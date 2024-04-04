N = 6000; % s? l??ng bit s? l�
M = 64; % m?c ?i?u ch?
image = 'flower.jpg'; % t�n ?nh
[bit, a, b, m, n] = docanh(image); % s? d?ng function docanh
bittest = bit(1:N); % l?y ra N bit trong chu?i bit
bit64_2 = reshape(bittest, N/6, 6); % chuy?n vector bittest th�nh ma tr?n 1000x6
bit64_8 = uint8(bit64_2); % chuy?n ma tr?n tr�n th�nh d?ng uint8
bit64_10 = bi2de(bit64_8); % chuy?n ma tr?n uint8 th�nh ma tr?n th?p ph�n
bit64_10d = double(bit64_10); % chuy?n ma tr?n th?p ph�n uint8 th�nh ma tr?n th?p ph�n double
h = modem.qammod(M, pi/4); % c?u h�nh qammod
h.SymbolOrder = 'gray';
y = modulate(h, bit64_10d); % ?i?u ch?
SNR = 8; % SNR dB
noisy = awgn(y, SNR, 'measured'); % t�n hi?u sau awgn
h = scatterplot(noisy, 1, 0, 'xb');
hold on;
scatterplot(y, 1, 0, 'or', h);
