
function x = decrypt(y, a_inv, b, m)
    if a_inv == -1
        error('Modular inverse does not exist.');
    else
        x = mod(a_inv * (y - b), m);
    end
end
