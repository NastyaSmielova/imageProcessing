function ans = Z(A, A_)
    [n,m] = size(A);
    E = eye(m,m);
    ans = E - (A_*A);