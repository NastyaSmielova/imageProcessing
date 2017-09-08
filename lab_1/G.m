function answer = G( m, x, freq )
    switch m
        case 1, answer = x ^ 3;
        case 2, answer = x ^ 2;
        case 3, answer = x;
        case 4, answer = sin(2 * pi * freq * x);
        case 5, answer = 1;
          otherwise answer = 1;
    end
end

