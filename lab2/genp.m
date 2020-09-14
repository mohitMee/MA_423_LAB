
function [L,U] =genp(A)
    n = size(A, 1);
    real=A;
    L=eye(n);
    for i=1:n-1
        for j=i+1:n
            m=A(j,i);
            m=m/A(i,i);
            L(j,i)=m;
            for k=i:n
            A(j,k)=A(j,k)-m*A(i,k);
            end
        end
    end
   U= A;
   real-(L*U)
end
