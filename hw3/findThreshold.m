% returns value and index of first element in x below some threshold
% x must be strictly decreasing
% for problem 2
function [val, ind] = findThreshold(x, threshold)
	    I = find(x<threshold, 1);
	    [val, ind] = deal(x(I), I);
end
