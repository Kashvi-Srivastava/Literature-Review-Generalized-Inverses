%%Row-reduced Echelon form
function [ECH] = Echelon_Form(A)
[m n] = size(A); %%size() is a function returns the two element row vector, i.e., D = [m,n]
i = 1;
j = 1;
l = 1;
flag = 0;
while 1
    if A(i,j) == 0
        if i~=m 
            i = i+1;
            continue;
        else
            flag = 1;
        end
    else
        A([l,i],:) = A([i,l],:);
        A = Sweep_column(A,l,j);
        l = l+1;
        flag = 1;
    end
    if flag~=0
        if l==m+1 || j==n
            break;
        else
            j = j+1;
            i = l;
        end
    end
end
ECH = A;