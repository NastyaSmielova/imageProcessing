function [resY, resR] = focus(F)
    [N,M] = size(F);
    
    mDelta = -10^10;
    resY = zeros(N, M);
    resR = 0;
    
    for r = 1 : 2
      
        H = h(N,M,r);
        Y = ifft2(fft2(F)./fft2(H));   
        delta = 0;
        
        for i = 2 : N - 1
            for j = 2 : M - 1
                delta = delta - (abs( Y(i - 1,j) - Y(i,j)));
                delta = delta - (abs( Y(i + 1,j) - Y(i,j)));
                delta = delta - (abs( Y(i,j - 1) - Y(i,j)));
                delta = delta - (abs( Y(i,j + 1) - Y(i,j)));
           end
        if (delta > mDelta)
            mDelta = delta;
            resY = Y;
            resR = r;  
        end
        
    end
end