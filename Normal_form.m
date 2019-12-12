%% Reduction to normal form
function [NF] = Normal_form(A)
[m n] = size(A);
i = 1;
j = 1;
k = 0;
while 1
    if A(i,j) == 0
        if i < m
            i = i + 1;
            continue;
        else
            if j < n
                j = j + 1;
                i = k + 1;
                continue;
            else
                break;
            end
        end
    else
        k = k+1;
        A([k,i],:) = A([i,k],:);
        A(:,[k,j]) = A(:,[j,k]);
        A = Sweep_column(A,k,k);
        A = Sweep_Row(A,k,k);
        if k ~= min(m,n)
            i = k+1;
            j = k+1;
            continue;
        else
            break;
        end
    end
end
NF = A;