function [bit, a, b, m, n] = docanh(image)
    [IMAGE, map] = imread(image);
    
    R8 = IMAGE(:,:,1);
    G8 = IMAGE(:,:,2);
    B8 = IMAGE(:,:,3);
    
    [m, n] = size(R8);
    
    R2uint8 = de2bi(R8);
    G2uint8 = de2bi(G8);
    B2uint8 = de2bi(B8);
    
    R2m = double(R2uint8);
    G2m = double(G2uint8);
    B2m = double(B2uint8);
    
    [a, b] = size(R2m);
    
    R2b = reshape(R2m, 1, a * b);
    G2b = reshape(G2m, 1, a * b);
    B2b = reshape(B2m, 1, a * b);
    
    bit = [R2b; G2b; B2b];
end
