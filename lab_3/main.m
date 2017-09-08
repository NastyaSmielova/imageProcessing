input_Y = dlmread('y3.txt', ' ');
[M, N] = size(input_Y);
c2 = 0.3;
c4 = 0.12;
m2 = 28;
m3 = 18;

c1 = 0.1;
c3 = 0.1;
m1 = 9;

h = 0.2;
T = 50;
t0 = 0;
d_beta = zeros(1,3);
d_beta(1) = inf;
d_beta(2) = inf;
d_beta(3) = inf;
EPS = 0.00001;

while ((abs(d_beta(1)) > EPS) || (abs(d_beta(2)) > EPS) || (abs(d_beta(3)) > EPS))
    A = zeros(6,6);
    A(1,2) = 1;
    A(3,4) = 1;
    A(5,6) = 1;
    A(2,1) = -(c1+c2)/m1;
    A(2,3) = c2/m1;
    A(4,1) = c2/m2;
    A(4,3) = -(c2+c3)/m2;
    A(4,5) = c3/m2;
    A(6,3) = c3/m3;
    A(6,5) = -(c3+c4)/m3;
    
    y = input_Y(:,1);
    dy = input_Y(:,1) - y;
    U = zeros(6,3);
    beta1 = zeros(3,3);        
    beta2 = zeros(3,1);
    i = 2; 
    while (i <= N)
        U_step = zeros(6,3);
        U_step(2,1) = - y(1) / m1;
        U_step(4,2) = (y(5) - y(3)) / m2;
        U_step(2,3) = ((c2 + c1) * y(1) - c2 * y(3)) / (m1 * m1);
        
        k1 = h *(A * U + U_step);
        k2 = h *(A *(U + k1 / 2.0) + U_step);
        k3 = h *(A *(U + k2 / 2.0) + U_step);
        k4 = h *(A *(U + k3) + U_step);
        U_next = U + (k1 + 2.0 * (k2 + k3) + k4) / 6.0;       
        k1 = h * A * y;
        k2 = h * A * (y + k1 / 2.0);
        k3 = h * A * (y + k2 / 2.0);
        k4 = h * A * (y + k3);
        y_next = y + (k1 + 2.0 *(k2 + k3) + k4) / 6.0;
        dy_next = input_Y(:,i) - y_next;
        

        beta1 = beta1 + h * (U' * U + U_next' * U_next) / 2.0;
        beta2 = beta2 + h * (U' * dy + U_next' * dy_next) / 2.0;
        
        U = U_next;
        y = y_next;
        dy = dy_next;
        i = i + 1;
    end;
    
    beta1_inv = inv(beta1);
    d_beta = beta1_inv * beta2;
    
    c1 = c1 + d_beta(1,1);
    c3 = c3 + d_beta(2,1);
    m1 = m1 + d_beta(3,1);
end;

disp('c1:');
disp(c1);
disp('c3:');
disp(c3);
disp('m1:');
disp(m1);




