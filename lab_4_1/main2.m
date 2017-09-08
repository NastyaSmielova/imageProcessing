Y = double(imread('y12.bmp'));

figure(1)
imshow(uint8( (Y)));

[Y, radius] = focus(Y);

figure(2)
imshow(uint8( abs(Y)));

disp('radius = ');disp(radius);