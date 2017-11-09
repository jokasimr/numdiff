function [ts,ys] = adaptiveRK34(f, y0, t0, tf, tol)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
k = 4;
ys = [y0];
ts = [t0];
y = y0;
t = t0;
errold = tol;
h = abs(tf-t0) * tol^(1/4) / (100*(1+norm(f(t0, y0))));

while (t(end)+h)<tf 
    [ynew, err] = RK34step(f, y, t, h);
    delta = norm(err);
    if delta<tol/1000
        delta
        delta=tol/1000;
    end
    if delta<tol
        y = ynew;
        t = t + h;
        ys = [ys,  y];
        ts = [ts, t];
        if h==0
            break
        end
        h = newstep(tol, delta, errold, h, k);
        errold = delta;
        continue
        
    end
    h = h/2;  
end
ynew = RK34step(f, y, t, tf-t(end));
ys = [ys,  ynew];
ts = [ts, tf];
y = ys;
t = ts;
end

