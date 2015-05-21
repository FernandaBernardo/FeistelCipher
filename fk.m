% input de 8 bits
function [output] = fk(in,subkey)
	L = in(1:floor(end/2));
	R = in(floor(end/2)+1:end);
	F = mapingF(R, subkey);
	
	first = xor(L, F);
	second = R;
	output = horzcat(first, second);
end	