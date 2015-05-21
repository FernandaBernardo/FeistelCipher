function [output] = mapingF(block, subkey)
	b1 = block(1);
	b2 = block(2);
	b3 = block(3);
	b4 = block(4);

	k11 = subkey(1);
	k12 = subkey(2);
	k13 = subkey(3);
	k14 = subkey(4);
	k21 = subkey(5);
	k22 = subkey(6);
	k23 = subkey(7);
	k24 = subkey(8);

	% expansion / permutation of input block
	ep = horzcat(b4, b1, b2, b3, b2, b3, b4, b1);	

	% adicionar subkey ao ep usando o operador XOR 
	ep(1) = xor(b4, k11);
	ep(2) = xor(b1, k12);
	ep(3) = xor(b2, k13);
	ep(4) = xor(b3, k14);

	ep(5) = xor(b2, k21);
	ep(6) = xor(b3, k22);
	ep(7) = xor(b4, k23);
	ep(8) = xor(b1, k24);

	% montar lado direito e lado esquerdo
	L = horzcat(ep(1), ep(2), ep(3), ep(4));
	R = horzcat(ep(5), ep(6), ep(7), ep(8));

	% matrizes S
	S0 = [1 0 3 2; 3 2 1 0; 0 2 1 3; 3 1 3 2];
	S1 = [0 1 2 3; 2 0 1 3; 3 0 1 0; 2 1 0 3];
	
	% calculo da linha e coluna das matrizes S
	rowLeft = bi2de(horzcat(L(1), L(4)), 'left-msb') + 1;
	columnLeft = bi2de(horzcat(L(2), L(3)), 'left-msb') + 1;

	rowRight = bi2de(horzcat(R(1), R(4)), 'left-msb') + 1;
	columnRight = bi2de(horzcat(R(2), R(3)), 'left-msb') + 1;

	% pegando da posição da matriz o decimal e transformando para array de binario
	decimalLeft = S0(rowLeft, columnLeft);
	decimalRight = S1(rowRight, columnRight);

	binLeft = dec2bin(decimalLeft,2);
	binRight = dec2bin(decimalRight,2);

	binLeft = str2double(regexp(num2str(binLeft),'\d','match'));
	binRight = str2double(regexp(num2str(binRight),'\d','match'));

	% juntando as duas partes do binario e fazendo permutação
	bin = horzcat(binLeft, binRight);
	bin = horzcat(bin(2), bin(4), bin(3), bin(1));

	output = bin;
end