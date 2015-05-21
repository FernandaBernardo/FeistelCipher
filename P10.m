% 3, 5, 2, 7, 4, 10, 1, 9, 8, 6
function [nkey] = P10(key)
	k1 = key(1);
	k2 = key(2);
	k3 = key(3);
	k4 = key(4);
	k5 = key(5);
	k6 = key(6);
	k7 = key(7);
	k8 = key(8);
	k9 = key(9);
	k10 = key(10);
	nkey = horzcat(k3, k5, k2, k7, k4, k10, k1, k9, k8, k6);
