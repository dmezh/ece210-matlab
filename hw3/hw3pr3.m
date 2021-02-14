function v = signSwitch(vi)
    v1 = ones(size(vi));
    v1(vi < 0) = 0;
    v2 = circshift(v1, 1);
    v2(1) = v1(1); % suppress first element because of shift
    v = zeros(size(vi));
    v(v1 ~= v2) = 1;
    v = find(v);
end
