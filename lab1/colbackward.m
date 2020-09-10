function b=colbackward(U, b)
    n = size(b, 1);
    for j=n:-1:1
        b(j) = b(j)/U(j,j);
        for i=(j-1):-1:1
            b(i)=b(i)-U(i,j)*b(j);
        end
        
    end
end