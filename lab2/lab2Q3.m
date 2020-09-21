for i=1:3
    A=rand(4);
    b=rand(4,1);
    x=geppsolve(A,b);
    x
    y=A\b;
    y
end




function x = geppsolve(A, b)
    [L, U, P] = gepp(A);
    b = P*b;
    y = solveLower(L, b);
    x = solveUpper(U, y);
    
end

function [L, U,P] = gepp(A)
    n = size(A,1);
    p = (1:n)';
   
    parity = 1;
    for k=1:n-1
        [~, m] = max(abs(A(k:n,k))); 
        
        m = m + k-1; % we need to shift the rows by offset k-1
        
        if(m ~= k)
            parity = parity*-1;
            A([k,m],:) = A([m,k],:); % swap m and k rows
            p([k,m]) = p([m,k]);
        end
        A(k+1:n,k) = A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
    end
    U = triu(A);
    L = tril(A,-1)+eye(n);
    I = eye(n);
    P = I(p, :); 
   
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

