T = 5;
X = 0 : 0.01 : T;
Y = dlmread('f6.txt', ' ');
figure(1)
plot(X, Y);

N = length(Y);
C = zeros(1, N);
for k = 1 : N
    sum = 0.0;
    for m = 1 : N
        sum = sum + Y(m) * exp(-1i * 2 * pi * k * m / N);
    end
    C(k) = sum / N;
end
C = abs(C);

figure(2)
plot(C);

maxFr = -1;
for i = 3 : N/2 - 3
    if C(i) > C(i - 2) && C(i) > C(i - 1 ) && C(i) > C(i + 1) && C(i) > C(i + 2) 
        maxFr = i / T;
    end
end


numCoef = 5;
B = zeros(numCoef,1);
A = zeros(numCoef, numCoef);

for i = 1 : N
    for m = 1 : numCoef
        B(m) = B(m) + Y(i) * G(m, X(i), maxFr);
    end
end

for i = 1 : N
    for j = 1 : numCoef
        for k = 1 : numCoef
            A(j,k)= A(j,k) + G(j, X(i), maxFr) * G(k, X(i), maxFr);
        end
    end
end


% Aa= b -> a = (A^-1)b
coef = (A^-1) * B;


res = zeros(1,N);
for k = 1 : N
  for m = 1 : numCoef
    res(k) = res(k) + coef(m) * G(m, X(k), maxFr);
   end
end

figure(3)
plot(X, res);

figure(4)
subplot(2,1,1);
plot(X,Y);
subplot(2,1,2);
plot(X,res);
