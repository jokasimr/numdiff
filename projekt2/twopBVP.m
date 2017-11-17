function y = twopBVP(fvec, alpha, beta, L, N)
% Solves the boundary problem y'' = fvec 
% where y(0) = alpha and y(L) = beta.
% N is the number of gridpoints in the interior of the intervall.
Dx = L / (N + 1);

fvec(1) = fvec(1) - alpha/Dx^2;
fvec(end) = fvec(end) - beta/Dx^2;

r = zeros(1,N);
r(1:2) = [-2, 1];
A = sparse(toeplitz(r, r));

y = A \ (Dx^2 * fvec);

end

