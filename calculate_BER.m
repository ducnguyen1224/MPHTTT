function BER = calculate_BER(image_filename, N, M, SNR)
    % ??c ?nh và chuy?n ??i thành các bit
    [bit, ~, ~, ~, ~] = docanh(image_filename);

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
    h_mod = modem.qammod(M, pi/4);
    h_mod.symbolorder = 'gray';

    % ?i?u ch?
    y = modulate(h_mod, bit64_10d);

    BER = zeros(size(SNR)); % Kh?i t?o m?ng BER

    for i = 1:length(SNR)
        % Thêm nhi?u vào tín hi?u
        ynoisy = awgn(y, SNR(i), 'measured');

        % C?u hình tín hi?u gi?i ?i?u ch? QAM
        h_demod = modem.qamdemod(M, pi/4);
        h_demod.symbolorder = 'gray';

        % Gi?i ?i?u ch?
        z = demodulate(h_demod, ynoisy);

        % Tính s? l??ng bit l?i
        numoferr = sum(bit64_10d ~= z);

        % Tính t? l? l?i bit (BER)
        BER(i) = numoferr / length(z);
    end
end
