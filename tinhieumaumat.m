clc;
clear all;


image = 'flower.jpg';
R = 4e6; % t?c ?? bit
Es = 6; % n?ng l??ng symbol
Tb = 1 / R; % chu k? bit
Ts = 6 * Tb; % chu k? symbol

[bit, a, b, m, n] = docanh(image); % ??c ?nh
bittest = bit(1:60); % l?y ra 60 bit t??ng ???ng v?i 10 symbol
bit64_2 = reshape(bittest, length(bittest)/6, 6); % ??i ma tr?n trên thành d?ng 10x6
bit64_8 = uint8(bit64_2); % chuy?n ma tr?n trên thành d?ng uint8
bit64_10 = bi2de(bit64_8); % chuy?n ma tr?n v? d?ng th?p phân uint8
bit64_10d = double(bit64_10); % chuy?n ma tr?n th?p phân uint8 thành double

M = 64; % m?c ?i?u ch?
dc = qammod(bit64_10d, M); % ?i?u ch?
SNR = 8; % dB
SNR_1 = 10^(SNR/10); % s? l?n
dcr = real(dc); % ph?n th?c
dci = imag(dc); % ph?n ?o
t = 0:Ts/39:Ts; % l?y 40 m?u m?t symbol
pt = sqrt(2 * Es / Ts) * (1 - cos(2 * pi * t / Ts)); % d?ng tín hi?u

xr = []; % t?o vector m?u c?a ph?n th?c
xi = []; % t?o vector m?u c?a ph?n ?o
tc = []; % t?o vector th?i gian
for i = 1:length(dc)
    x1 = pt * dcr(i); % ?i?u ch? m?i symbol
    xr = [xr x1]; % ghép vào vector t?ng

    x2 = pt * dci(i); % ?i?u ch? m?i symbol
    xi = [xi x2]; % ghép vào vector t?ng
    
    tc = [tc (i-1)*Ts + t]; % ghép vào vector t?ng
end

X = xr + 1i * xi; % tín hi?u sau ?i?u ch? b?ng g?c
varn = var(X) / SNR_1;
Xn = X + sqrt(varn) * (randn(size(X)) + 1i * randn(size(X))); % tín hi?u sau nhi?u
Xrn = real(Xn); % ph?n th?c sau nhi?u
Xin = imag(Xn); % ph?n ?o sau nhi?u

figure(1) % tín hi?u sau awgn
subplot(2,1,1)
plot(tc, Xrn);
hold on;
title('Biên ?? A');
subplot(2,1,2)
plot(tc, Xin);
hold on;
title('Pha');

figure(2) % tin hi?u tr??c awgn
subplot(2,1,1)
plot(tc, xr);
hold on;
title('Biên ?? A');
subplot(2,1,2)
plot(tc, xi);
hold on;
title('Pha');

eyediagram(Xn, 40); % bi?u ?? m?t
