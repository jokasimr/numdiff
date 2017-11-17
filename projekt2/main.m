

N = 100;
L = pi;
Dx = L/(N + 1);
x = Dx:Dx:(L-Dx);
x = x';
fvec = 4*sin(2*x);

a = 0;
b = 0;MAT

y = twopBVP(fvec, a, b, L, N);
sol = [a;y;b];

plot([0;x;L], sol)

%%

f = @(x) sin(x);
[x, y] = use_twopBVP(f, a, b, L, N);
plot(x, y)

%%

% solve bending problem
N = 999;
L = 10;
q = -50000;
E = 1.9 * 10^11;
I = @(x) 10^(-3) * (3 - 2*cos(pi*x/L).^12);

Dx = L/(N + 1);
x = Dx:Dx:(L-Dx);
x = x';

M = twopBVP(q*x./x, 0, 0, L, N);
HL = M./(E*I(x));

u = twopBVP(HL, 0, 0, L, N);
x = [0;x;L];
u = [0;u;0];
plot(x, u)
format long
u(501)

%%
errs = [];
NS = 100:100:2000;
for N=NS
    Dx = 1/(N + 1);
    r = zeros(1,N);
    r(1:2) = [-2, 1];
    A = toeplitz(r, r)/Dx^2;
    d = flipud(eig(A));
    eigvals = -((1:N)*pi).^2;
    err = (d-eigvals');
    errs = [errs; norm(err(1:3))];
end
loglog(NS, errs);
%%
% plotting eigenfunctions
N = 499;
Dx = 1/(N + 1);
r = zeros(1,N);
r(1:2) = [-2, 1];
A = toeplitz(r, r)/Dx^2;
[V, D] = eig(A);
V = [zeros(1,N); V ; zeros(1,N)];
plot(V(:, end-5:end))
%%
%f = @(x) 0*x;
%f = @(x) 700*(0.5 - abs(x - 0.5));
%f = @(x) 800*sin(3*pi*x).^2; 
%f = @(x) 800*sin(pi*x).^2;
%f = @(x) 1600*cos(1*pi*x).^2;
%f = block_potential([0.1, 0.2, 0.3, 0.7, 0.8, 0.9], 0.02, 2000);
%f = block_potential([0.3, 0.5, 0.7], 0.04, 2000);
%f = block_potential([0.2, 0.5 0.8], 0.1, 2000);
%f = block_potential([0.2, 0.4, 0.6, 0.8], 0.05, 2000);

%f = @(x) exp(20*abs(x-0.5));
%f = @(x) 40000-min(16*64*10^4*(1.3*(x-0.5)).^8, 40000);
f = block_potential([0.5, 0.5], [0.5, 0.1], [500, 0]);
%f = @(x) 50./((x-0.5).^2+0.01);
%f = block_potential([0.2, 0.4, 0.6, 0.8], ...
%                   [0.1, 0.03, 0.03, 0.1], ...
%                   [1000, 500, 500, 1000]);
%f = @(x) -1000./(abs(x/50-1/100)+0.01)+ 80000;
%f = @(x) 2000*(1-exp(-(x-1/2).^2/0.01));
%f = @(x) 4000*(x-0.5).^2;
[D, V, x] = shrodslv(f, 10);
plotshrod(f(x), D, V, x)
D


