% 2 6 3 1 4 8 5 7
function [nkey] = initialPermutation(block)
	b1 = block(1);
	b2 = block(2);
	b3 = block(3);
	b4 = block(4);
	b5 = block(5);
	b6 = block(6);
	b7 = block(7);
	b8 = block(8);
	nkey = horzcat(b2, b6, b3, b1, b4, b8, b5, b7);
