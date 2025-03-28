function inv = modular_inverse(a, m)
    [g, x, ~] = gcd_extended(a, m);
    if g ~= 1
        inv = -1; % No modular inverse
    else
        inv = mod(x, m);
    end
end