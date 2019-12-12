%% Reduction of a square matrix to upper triangular form
function [UTF] = Upper_Triangular(A)
D = size(A);
n = D(1,1);
i = 1;
j = 1;
while 1
    if A(i,j) ~= 0
        A([i,j],:) = A([j,i],:);
        for k = j+1:n
            for p = 1:n
                A(k,p) = A(k,p) - (A(j,p)*A(k,p))/A(j,j);
            end
        end
    else
        if i < n
            i = i+1;
            continue;
        else
            if j<n-1
                j = j+1;
                i = j;
                continue;
            else
                break;
            end
        end
    end
end
A