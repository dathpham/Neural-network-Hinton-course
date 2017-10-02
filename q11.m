function ret = q11(w)

a=dec2bin(0:2^10-1)-'0';

    ret = log(sum(prod(1+exp(w'*a'),1)));
end

