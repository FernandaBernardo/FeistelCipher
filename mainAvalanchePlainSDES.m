nBits = 8;
nRepeticoes = 100;
nRodadas = 30;

entropia = zeros(4,nRodadas);

for rodadas=1:nRodadas
    matriz = zeros(nRepeticoes,nBits,nBits); 
    for repeticoes=1:nRepeticoes;
        for bit=1:nBits
            K = rand(1,10)>.5; %obtem uma chave aleatoria

            P1 = rand(1,nBits)>.5; %obtem um bloco de bits aleatorio
            C1 = SDESencryption(P1,K,rodadas);

            P2 = P1;
            P2(bit) = ~P2(bit); %inverte um dos bits do texto P1
            C2 = SDESencryption(P2,K,rodadas);

            %computa o que mudou na cifra
            
            matriz(repeticoes,:,bit) = mod(C1+C2,2);
        end
    end
    
    disp (rodadas)

    entropiaQuad = [];
    entropiaTri = [];
    entropiaBi = [];
    entropiaMono = [];
    for bit=1:nBits
        for bit4=1:nBits
        for bit3=(bit4+1):nBits
        for bit2=(bit3+1):nBits
        for bit1=(bit2+1):nBits
            x = hist(matriz(:,[bit1 bit2 bit3 bit4],bit)*[1 2 4 8]',[0:15]);
            x = x/nRepeticoes;
            entropiaQuad = [entropiaQuad, -sum(x.*logEntropia(x))];
        end
        end
        end
        end
        
        for bit3=1:nBits
        for bit2=(bit3+1):nBits
        for bit1=(bit2+1):nBits
            x = hist(matriz(:,[bit1 bit2 bit3],bit)*[1 2 4]',[0:7]);
            x = x/nRepeticoes;
            entropiaTri = [entropiaTri, -sum(x.*logEntropia(x))];
        end
        end
        end
        
        for bit2=1:nBits
        for bit1=(bit2+1):nBits
            x = hist(matriz(:,[bit1 bit2],bit)*[1 2]',[0:3]);
            x = x/nRepeticoes;
            entropiaBi = [entropiaBi, -sum(x.*logEntropia(x))];
        end
        end
        
        for bit1=1:nBits
            x = hist(matriz(:,bit1,bit)*[1]',[0:1]);
            x = x/nRepeticoes;
            entropiaMono = [entropiaMono, -sum(x.*logEntropia(x))];
        end
    end
    entropia(1,rodadas) = mean(entropiaMono);
    entropia(2,rodadas) = mean(entropiaBi)/2;
    entropia(3,rodadas) = mean(entropiaTri)/3;
    entropia(4,rodadas) = mean(entropiaQuad)/4;
end

plot(entropia','LineWidth',2)
legend({'1 bit','2 bits','3 bits','4 bits'})
xlabel('rodadas')
ylabel('entropia media')