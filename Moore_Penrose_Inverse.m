%%Find the Moore-Penrose Inverse of a given matrix.
function [MPI] = Moore_Penrose_Inverse(A)
D = size(A); %%size() is a function returns the two element row vector, i.e., D = [m,n]
m = D(1,1);
n = D(1,2);
X = A; %%Form a duplicate matrix
%%Row reduced form
for k = 1:(m-1)
    for i = (k+1):m
        if A(k,k)~=0
            x = (A(i,k)/A(k,k));
            for j = 1:n
                A(i,j) = A(i,j) - x*A(k,j);
            end
        end
    end
end
zero_rows = ~any(A,2); %%Gives the logical array for zero and non-zero rows
indices = find(zero_rows); %%Gives the positions of zero rows
rank = m - length(indices); %%Rank of the matrix = number of non-zero rows
%%Rank factorization %%A = BC
B = zeros(m,rank);
C = zeros(rank,n);
j = 1;
for i = 1:m
    if(i~=indices(:,1))
        C(j,:) = X(i,:); %%C contains the basis of row space
        j = j + 1;
    end
end
Ct = C.'; %%Transpose of Matrix C
for i = 1:m
    Xi = X(i,:).';
    Y = linsolve(Ct,Xi);
    B(i,:) = Y; %%B contains the constants of linear combinations
end
Bt = B.' ; %%Tranpose of Matrix B
P = (inv(Bt*B))*Bt; %%Moore-Penrose inverse of B
Q = Ct*(inv(C*Ct)); %%Moore-Penrose inverse of C
MPI = (Q*P);
    

    