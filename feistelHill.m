function C = feistelHill(P,K,rodadas)

P=double(P);
K=double(K);

L0 = P(1:floor(end/2));
R0 = P((floor(end/2)+1):end);

K = reshape(K,length(L0),length(L0));

C = P;
for i=1:rodadas
    L = R0;
    R = mod(L0 + R0*K + R0 + 1,2);
    
    L0=L;
    R0=R;
    
end

C = [L R];