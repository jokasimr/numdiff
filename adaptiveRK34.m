function [t,y] = adaptiveRK34(f, y0, t0, tf, tol)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
k = 4;
y = [y0];
t = [t0];
errold = tol;
h = abs(tf-t0) * tol^(1/4) / (100*(1+norm(f(t0, y0))));

while t(end)+h<tf
    [ynew, err] = RK34step(f, y(end), t(end), h);
    if err<tol
        err=tol;
    end
    y = [y;  ynew];
    t = [t; t(end) + h];
    h = newstep(tol, err, errold, h, k);
    errold = err;
end
ynew = RK34step(f, y(end), t(end), tf-t(end));
y = [y;  ynew];
t = [t; tf];
end

