% Khai báo bien
h = 0.1;            % buoc thoi gian
x0 = 0;             % gia tri ban dau cua x
y0 = 1;             % gia tri ban cua cua y
xn = 2;             % gia tri cua x tai diem ket thúc

% Tính toán
x = x0:h:xn;
y = zeros(size(x));
y(1) = y0;

for i = 1:length(x)-1
    y(i+1) = y(i) + h * (4 * x(i)^2 + x(i) - 24 * y(i));
end
%a)
% ve 
plot(x, y);
xlabel('x');
ylabel('y');
title('phuong trinh y'' = 4x^2 + x - 24y bang pp Euler');
%b)tinh nguyen ham 

int_y = cumtrapz(x, y);

% V? ?? th? c?a hàm y và nguyên hàm
subplot(2,1,1);
plot(x, y);
xlabel('x');
ylabel('y');
title('Ham y');

subplot(2,1,2);
plot(x, int_y);
xlabel('x');
ylabel('Int(y)');
title('Nguyen ham cua ham y');


