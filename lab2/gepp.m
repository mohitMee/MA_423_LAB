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
