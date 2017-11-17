function [D, V, x] = shrodslv(V, n)
N = 1000;
Dx = 1/(N + 1);
x = Dx:Dx:(1-Dx);
r = zeros(1,N);
r(1:2) = [-2, 1];
A = toeplitz(r, r)/Dx^2;
V = diag(V(x));
H = sparse(V-A);
[V, D] = eigs(H, n, 'smallestabs');
V = [zeros(1, n);V;zeros(1, n)];
if sum(V(:, 1))<0
    V = -V;
end
x = [0,x,1];
D = diag(D);

end

