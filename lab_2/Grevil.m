function inversX = Grevil(X)
    [n,m] = size(X);
    EPS = 0.001;
    if (sum(abs(X(1,:))) > 0)  A_ = X(1,:)'/(X(1,:) * X(1,:)');
    else A_ = zeros(m,1);
    end
    for i = 2 : n
        A = X(1:i-1,:);
        a = X(i,:)';
        Z_ = Z(A,A_);
        AZA = (a'*Z_)*a;
        if ( AZA > EPS)
            first = A_ - (((Z_*a)*a')*A_)/AZA;
            second = (Z_*a)/AZA;
            A_ = cat(2,first,second);
        else 
            R_ = R(A_);
            first = A_ - (((R_*a)*a')*A_)/(1+(a'*R_)*a);
            second = (R_*a)/(1+(a'*R_)*a);
            A_ = cat(2,first,second);
        end     
    end
    inversX = A_;
    
