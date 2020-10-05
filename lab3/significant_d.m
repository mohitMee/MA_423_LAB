N = 8:2:12;
for n = N
    H = hilb(n);
    HI = invhilb(n);
    x = rand(n, 1);
    b = H*x;
    x1 = HI*b;
    x2 = geppsolve(H, b);
    R = mychol(H);
    y = solveLower(R', b);
    x3 = solveUpper(R, y);
    fprintf('n = %d\n', n);
    disp([norm(x-x1)/norm(x) norm(x-x2)/norm(x) norm(x-x3)/norm(x)]);
    disp(cond(H));
end
