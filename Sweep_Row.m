%% Sweep kth row with A(k,l) as pivot
function [S] = Sweep_Row(A,k,l);
[m n] = size(A);
for j = 1:n
    for i = 1:m
        if j==l
            S(i,j) = A(i,j)/A(k,l);
        else
            S(i,j) = A(i,j) - (A(k,j)/A(k,l))*A(i,l);
        end
    end
end