clc;
close all;


N = 6000; % S? l??ng bit ???c x? lý
M = 64; % M?c ?i?u ch?, trong tr??ng h?p này là 64-QAM
image = 'flower.jpg'; % Tên c?a t?p tin ?nh c?n x? lý

% ??c ?nh và chuy?n ??i thành các bit
[bit, a, b, m, n] = docanh(image);

% L?y ra N bit ??u tiên t? vect? bit
bittest = bit(1:N);

% Chuy?n ??i vect? bit thành ma tr?n 1000x6
bit64_2 = reshape(bittest, N/6, 6);

% Chuy?n ??i ma tr?n bit thành d?ng uint8
bit64_8 = uint8(bit64_2);

% Chuy?n ??i ma tr?n bit thành ma tr?n th?p phân
bit64_10 = bi2de(bit64_8);

% Chuy?n ??i ma tr?n th?p phân uint8 thành ma tr?n th?p phân double
bit64_10d = double(bit64_10);

% C?u hình tín hi?u ?i?u ch? QAM
h = modem.qammod(M, pi/4);
h.symbolorder = 'gray';

% ?i?u ch?
y = modulate(h, bit64_10d);

% Các m?c SNR (dB)
SNR = [5 8 12];

for i = 1:length(SNR)
    % Thêm nhi?u vào tín hi?u
    ynoisy = awgn(y, SNR(i), 'measured');
    
    % C?u hình tín hi?u gi?i ?i?u ch? QAM
    h = modem.qamdemod(M, pi/4);
    h.symbolorder = 'gray';
    
    % Gi?i ?i?u ch?
    z = demodulate(h, ynoisy);
    
    % Tính s? l??ng bit l?i
    numoferr = sum(bit64_10d ~= z);
    
    % Tính t? l? l?i bit (BER)
    BER(i) = numoferr / length(z);

% Hi?n th? t? l? l?i bit (BER) cho m?i m?c SNR
disp('BER:');
disp(BER);
end 
