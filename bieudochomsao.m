N = 6000; % s? l??ng bit s? lý
M = 64; % m?c ?i?u ch?
image = 'flower.jpg'; % tên ?nh
[bit, a, b, m, n] = docanh(image); % s? d?ng function docanh
bittest = bit(1:N); % l?y ra N bit trong chu?i bit
bit64_2 = reshape(bittest, N/6, 6); % chuy?n vector bittest thành ma tr?n 1000x6
bit64_8 = uint8(bit64_2); % chuy?n ma tr?n trên thành d?ng uint8
bit64_10 = bi2de(bit64_8); % chuy?n ma tr?n uint8 thành ma tr?n th?p phân
bit64_10d = double(bit64_10); % chuy?n ma tr?n th?p phân uint8 thành ma tr?n th?p phân double
h = modem.qammod(M, pi/4); % c?u hình qammod
h.SymbolOrder = 'gray';
y = modulate(h, bit64_10d); % ?i?u ch?
SNR = 8; % SNR dB
noisy = awgn(y, SNR, 'measured'); % tín hi?u sau awgn
h = scatterplot(noisy, 1, 0, 'xb');
hold on;
scatterplot(y, 1, 0, 'or', h);
