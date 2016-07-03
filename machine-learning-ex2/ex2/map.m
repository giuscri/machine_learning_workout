function Y = map(cb, X)
	Y = [];
	for i = 1:length(X)
		Y = [Y, cb(X(i))];
	end
end
