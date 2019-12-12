%% Sweep lth column with A(k,l) as pivot
function [S] = Sweep_column(A,k,l)
[m n] = size(A);
for i = 1:m
    for j = 1:n
    if i==k
        S(i,j) = A(i,j)/A(k,l);
    else
        S(i,j) = A(i,j) - (A(i,l)*A(k,j))/A(k,l);
    end
    end
end
