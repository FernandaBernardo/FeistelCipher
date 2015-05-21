function [subKey1, subKey2] = keyGenerationDES(key)
	% permuta randomicamente os valores da chave
	p10 = P10(key);

	% divide em dois a chave permutada
	k1 = p10(1:floor(end/2));
	k2 = p10(floor(end/2)+1:end);

	%left shift circular em cada parte
	k1 = circshift(k1, [0, -1]);
	k2 = circshift(k2, [0, -1]);

	% concatena as duas partes em um só
	p8 = horzcat(k1, k2);

	%tirando as duas primeiras posições da chave e permutando again
	p8 = P8(p8);
	subKey1 = p8;

	% left shift de 2 bits com cada parte (k1 e k2)
	k1 = circshift(k1, [0, -2]);
	k2 = circshift(k2, [0, -2]);

	% reaplicando P8 na chave
	p8 = horzcat(k1, k2);
	p8 = P8(p8);
	subKey2 = p8;