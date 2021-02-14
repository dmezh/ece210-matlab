function [val, ind] = findThreshold(x, threshold)
	    I = find(x<threshold, 1);
	    [val, ind] = deal(x(I), I);
end
