% returns the indices of zeros and extrema of given x, y vector pair + displays plot
% for problem 3
function [zeros, extrema] = zerosAndExtrema(x, y)
    zeros = signSwitch(y);
    d = diff(y) ./ diff(x);
    extrema = signSwitch(d);
    figure('Name', 'Function Analysis');
    plot(x,y,x(zeros),y(zeros),'r*',x(extrema),y(extrema),'ko');
end

% returns the indices of sign switches (zero crossings) of given vector
function v = signSwitch(vi)
    v1 = ones(size(vi));
    v1(vi < 0) = 0;
    v2 = circshift(v1, 1);
    v2(1) = v1(1); % suppress first element because of shift
    v = zeros(size(vi));
    v(v1 ~= v2) = 1;
    v = find(v);
end
