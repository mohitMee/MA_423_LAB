function b=solveLower(L, b)
    n = size(b, 1);
    for k=1:n
        for j=1:k-1
            b(k)=b(k)-L(k,j)*b(j);
        end
        b(k)=b(k)/L(k,k);
    end
    
end