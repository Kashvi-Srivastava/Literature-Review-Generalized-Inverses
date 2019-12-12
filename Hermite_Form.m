%% Reduction of a square matrix to Hermite Canonical form
function [HCF] = Hermite_Form(A)
[n n] = size(A);
i = 1;
j = 1;
flag = 0;
while 1
    if A(i,j) == 0
        if i<n
            i = i+1;
            continue;
        else
            if j==1
                flag = 1;
            else
                i = 1;
                