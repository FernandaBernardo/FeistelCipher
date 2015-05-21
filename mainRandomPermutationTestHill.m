nBits = 8;
nRodadas = 20;

bases = 2.^((nBits-1):-1:0);

convKey = [];
convText = [];

for key=1:2^(nBits^2/4)
    convKey = [convKey; dec2bin(key-1,nBits^2/4)=='1'];
end

for text=1:2^(nBits)
    convText = [convText; dec2bin(text-1,nBits)=='1'];
end


matriz = cell(1,nRodadas);

for rodadas=1:nRodadas
    matriz{rodadas} = int16(zeros(2^nBits,2^nBits));
end

for text=1:2^nBits
    for key=1:2^(nBits^2/4)
        P = convText(text,:);
        K = convKey(key,:);
        for rodadas=1:nRodadas
            C = feistelHill(P,K,1);
            x = C*bases';
            matriz{rodadas}(text,x+1) = matriz{rodadas}(text,x+1) + 1;
            P = C;
        end
    end
    disp([text])
end


prob = cell(1,nRodadas);
entropia = zeros(2^nBits,nRodadas);
maxProb = zeros(2^nBits,nRodadas);
faixa1Elem = zeros(2^nBits,nRodadas);
faixa2Elem = zeros(2^nBits,nRodadas);

faixa1 = .5;
faixa2 = .9;

for rodadas=1:nRodadas
    prob{rodadas} = zeros(2^nBits,2^nBits);
end

for rodadas=1:nRodadas
    for text=1:2^nBits
        prob{rodadas}(text,:) = double(matriz{rodadas}(text,:))/sum(matriz{rodadas}(text,:));
        
        x = cumsum(sort(prob{rodadas}(text,:)));
        faixa1Elem(text,rodadas) = 2^nBits-sum(x<=(1-faixa1));
        faixa2Elem(text,rodadas) = 2^nBits-sum(x<=(1-faixa2));
    end
end

plot([mean(faixa1Elem);mean(faixa2Elem)]','LineWidth',2);
legend({'alpha=0.5','alpha=0.9'})
xlabel('rodadas')
ylabel('quantidade de elementos em M_c')

