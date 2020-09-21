A=[10^(-20) 1;1 1];
genp(A);
%fprintf("this uncertainity coming because of dividing with very less number %d",10^(-20));


function [L,U] =genp(A)
     n = size(A, 1);
    for j=1:n-1
        A(j+1:n,j) = A(j+1:n,j)/A(j,j);
        A(j+1:n,j+1:n) = A(j+1:n,j+1:n) - A(j+1:n,j)*A(j,j+1:n);
    end
    U = triu(A);
    L = tril(A,-1)+eye(n);
    b=[1;0];
    y=solveLower(L,b);
    x=solveUpper(U,y);
    x
    
end


function b=solveLower(L, b)
    n = size(b, 1);
    for k=1:n
        for j=1:k-1
            b(k)=b(k)-L(k,j)*b(j);
        end
        b(k)=b(k)/L(k,k);
    end
    
end


function b=solveUpper(U, b)
    n = size(b, 1);
    for j=n:-1:1
        b(j) = b(j)/U(j,j);
        for i=(j-1):-1:1
            b(i)=b(i)-U(i,j)*b(j);
        end
        
    end
end

