function [g, x, y] = gcd_extended(a, b)
    if b == 0
        g = a; x = 1; y = 0;
    else
        [g, x1, y1] = gcd_extended(b, mod(a,b));
        x = y1;
        y = x1 - floor(a/b) * y1;
    end
end