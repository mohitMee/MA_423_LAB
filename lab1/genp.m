function [L, U]= genp(A)
    n = size(A, 1);
    for j=1:n-1
        A(j+1:n,j) = A(j+1:n,j)/A(j,j);
        A(j+1:n,j+1:n) = A(j+1:n,j+1:n) - A(j+1:n,j)*A(j,j+1:n);
    end

    U = triu(A)
    L = tril(A,-1)+eye(n)
end