function vo = gramSchmidt(vi)
    vo = zeros(size(vi));
    for i = 1:size(vi, 2)
            v1 = vi(:,i);
            for j = 1:(i-1)
                v1 = v1 -  vo(:,j)*( vo(:,j)'*vi(:,i) );
            end
            vo(:,i) = v1/(norm(v1));
    end
end