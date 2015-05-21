% 4 1 3 5 7 2 8 6
function [nkey] = inversePermutation(block)
	b1 = block(1);
	b2 = block(2);
	b3 = block(3);
	b4 = block(4);
	b5 = block(5);
	b6 = block(6);
	b7 = block(7);
	b8 = block(8);
	nkey = horzcat(b4, b1, b3, b5, b7, b2, b8, b6);
