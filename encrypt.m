% encrypt_utils.m
% Encryption and Decryption using modular arithmetic

function y = encrypt(x, a, b, m)
    y = mod(a * x + b, m);
end
