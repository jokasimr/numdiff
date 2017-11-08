function errVSh_it(stepfunc, A, y0, t0, tf)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if length(A)~=length(y0)
    error("Give us a vector y0 of the length "+length(A));
end
n = 20;
errors = zeros(1, n);
h = zeros(1, n);
for i=1:n
    N = 2^(i/2);
    h(i) = (tf-t0)/N;
    [approx, err] = integrate_it(stepfunc, A, y0, t0, tf, N);
    errors(i) = norm(err);
end
loglog(h, errors);
xlabel("h");
ylabel("global err");
end