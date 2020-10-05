N = 10:1:20;
for n = N
    H = hilb(n);
    x = randn(n,1);
    b = H*x;
    x1 = geppsolve(H, b);
    r = H*x1-b;
    disp([n norm(r) norm(x-x1)]);
end

%{
i am colcluding that if ||r|| is small then ||x - x^k|| is small.
%}