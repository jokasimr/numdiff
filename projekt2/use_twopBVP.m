function [x, y] = use_twopBVP(f, a, b, L, N)

Dx = L/(N + 1);
x = 0:Dx:L;
x = x';
fvec = f(x(2:end-1));

y = zeros(size(x))
y(2:end-1) = twopBVP(fvec, a, b, L, N);

end

