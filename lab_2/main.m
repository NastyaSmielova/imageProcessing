X = double(imread('x1.bmp'));
figure 
imshow(uint8(X));

Y = double(imread('y6.bmp'));
figure
imshow(uint8(Y));

[n,m] = size(X);

for i = 1 : m  X(n + 1,i) = 1;
end    
invX = Grevil(X);
A = Y * invX;
newY = A * X;
figure
imshow(uint8(newY));

