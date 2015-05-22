% plaintext 8 bit and key 10 bit
function [ciphertext] = SDESencryption(plaintext, key, rodadas)

plaintext = double(plaintext);
key = double(key);

[k1, k2] = keyGenerationDES(key);

ciphertext = initialPermutation(plaintext);

ciphertext = fk(ciphertext, k1);

for i=2:rodadas
	ciphertext = switchSW(ciphertext);
	
	if(mod(i,2) == 0)
		k = k2;
	else
		k = k1;
	end

	ciphertext = fk(ciphertext, k);
end

ciphertext = inversePermutation(ciphertext);