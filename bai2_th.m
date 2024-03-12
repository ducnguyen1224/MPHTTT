%b21dcvt135
A = [1 ;1; 2];
phi = [0; pi/4; 0];
f = [10;30;50] ;

% Tao vector thoi gian
t = linspace(0, 1, 1000);

% Tính toán tín hieu s(t)
s = A(1)*cos(2*pi*f(1)*t+phi(1)) + A(2)*cos(2*pi*f(2)*t+phi(2)) + A(3)*cos(2*pi*f(3)*t+phi(3));

% Tính toán pho tín hieu s(t)
N = length(t);
fs = 1000;
X = fft(s, N)/N;
f_axis = linspace(0, fs, N);

% Ve tín hieu s(t) và pho trên cua so 2D
figure(1);
subplot(2, 1, 1);
plot(t, s);

subplot(2, 1, 2);
plot(f_axis(1:N/2), abs(X(1:N/2)));


% Ve tin hieu s(t) và pho trên cua so 3D
figure(2);
plot3(t, real(s), imag(s));


% Ve tin hieu s(t) trên các cua so con theo tang giá tri cua i
figure(3);
for k = 1:3
    subplot(3, 1, k);
    s_k = A(k)*cos(2*pi*f(k)*t+phi(k));
    plot(t, s_k);
   
end

% Ve pho tin hieu s(t) trên các cua so con theo tung giá tri cua i
figure(4);
for k = 1:3
    subplot(3, 1, k);
    s_k = A(k)*cos(2*pi*f(k)*t+phi(k));
    N_k = length(t);
    fs_k = 1000;
    X_k = fft(s_k, N_k)/N_k;
    f_axis_k = linspace(0, fs_k, N_k);
    plot(f_axis_k(1:N_k/2), abs(X_k(1:N_k/2)));
  
    
end