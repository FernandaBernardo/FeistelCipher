function result = logEntropia(x)
result = zeros(size(x));
for i=1:numel(x);
    if x(i) > 0
        result(i) = log2(x(i));
    else
        result(i) = 0;
    end
end