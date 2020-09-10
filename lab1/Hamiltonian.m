function mat= Hamiltonian(n)
    H11 = randn(n/2);
    H12 = randn(n/2);
    H21 = randn(n/2);
    H11 = tril(H11, -1)+tril(H11, -1)' + diag(diag(H11));
    H12 = tril(H12, -1)+tril(H12, -1)' + diag(diag(H12));
    H21 = tril(H21,-1)+tril(H21,-1)' + diag(diag(H21));
    
    mat = [H11 H12; H21 -H11];
end
