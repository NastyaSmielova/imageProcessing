F = double(imread('y11.bmp'));
radius = 2;
[N,M] = size(F);
figure(1);
imshow(uint8(F));
 
H = h(N,M,radius);
Y = ifft2(fft2(F).*fft2(H));

figure(2)
imshow(uint8( abs(Y)));


[Y, radius] = focus(Y);

figure(3)
imshow(uint8( abs(Y)));

disp('radius = ');disp(radius);