function C = feistelSDES(P, K, rodadas)

P=double(P);
K=double(K);

L0 = P(1:floor(end/2));
R0 = P((floor(end/2)+1):end);

C = P;
for i=1:rodadas
    L = R0;
    R = xor(SDESencryption(R0, K), L0);
    
    L0=L;
    R0=R;
end

C = [L R];
