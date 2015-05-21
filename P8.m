% 6 3 7 4 8 5 10 9
function [nkey] = P8(key)
	k3 = key(3);
	k4 = key(4);
	k5 = key(5);
	k6 = key(6);
	k7 = key(7);
	k8 = key(8);
	k9 = key(9);
	k10 = key(10);
	nkey = horzcat(k6, k3, k7, k4, k8, k5, k10, k9);
