% 4 1 3 5 7 2 8 6
function [nkey] = inversePermutation(b)
	nkey = horzcat(b(4), b(1), b(3), b(5), b(7), b(2), b(8), b(6));
