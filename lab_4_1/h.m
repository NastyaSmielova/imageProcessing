function H = h(N,M,radius)
  
    H = zeros(N,M);
    value =  1 / (pi * radius * radius);

    for i = - radius : radius
        for j = - radius : radius
            if (i*i + j*j <= radius * radius)
                H(mod(i + N, N) + 1,mod(j + M, M) + 1) = value;
            end
        end
    end