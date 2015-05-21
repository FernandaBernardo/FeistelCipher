% plaintext 8 bit and key 10 bit
function [ciphertext] = SDESencryption(plaintext, key)

[k1, k2] = keyGenerationDES(key);

ciphertext = initialPermutation(plaintext);

ciphertext = fk(ciphertext, k1);

ciphertext = switchSW(ciphertext);

ciphertext = fk(ciphertext, k2);

ciphertext = inversePermutation(ciphertext);