function W = Wilkinsion(n)
    W = -1*tril(ones(n))+2*eye(n);
    W(:, n)=1;
end
