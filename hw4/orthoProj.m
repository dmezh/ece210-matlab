% computes the orthogonal projection
function vo = orthoProj(v, vi)
    c = size(vi,2);
    v(size(v)+1:c) = 0; % pad
    vo = zeros(size(vi));
    for i = 1:c
        vo(:,i) = (dot(v, vi(:,i))/norm(vi(:,i))^2)*vi(:,i);
    end
end