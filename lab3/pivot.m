N = 20:5:20;
for n=N
    A = rand(n);
    A(1, 1) = 50*eps*A(1,1);
    [L, U] = genp(A);
    disp([n norm(L) norm(U) norm(L*U-A)]);
    [L, U, P] = lu(A);
    disp([n norm(L) norm(U) norm(L*U-P*A)]);
    disp('');
end

%{
I can see that if we take large pivot instead of small pivot then our
result will be better and we can also see that if we use gepp instead of
genp when entries of matrix is small then gepp is much better than genp.

%}
