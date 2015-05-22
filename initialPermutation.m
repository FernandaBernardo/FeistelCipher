% 2 6 3 1 4 8 5 7
function [nkey] = initialPermutation(b)
	nkey = horzcat(b(2), b(6), b(3), b(1), b(4), b(8), b(5), b(7));
