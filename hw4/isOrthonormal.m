% checks if rows of input matrix are an orthonormal set
function out = isOrthonormal(vi)
    maxerr = 10^-6;
    % checking if all the norms are 1
    if any(abs(vecnorm(vi) - 1) > maxerr)
        out = 0;
        return
    end
    % checking orthogonality
    rows = size(vi, 1);
    for i = 1:rows
        for j = i+1:rows
            if dot(vi(:,i), vi(:,j)) > maxerr
                out = 0;
                return
            end
        end
    end
    
end