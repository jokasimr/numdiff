function [approx,err] = integrate_it(stepfunc, A, y0, t0, tf, N)
%Integrate y' = Ay 
y = y0;
h = (tf-t0)/N;
f = @(t, x) A*x;

for i=0:1:N-1
    y = stepfunc(f, y, t0+i*h, h);
end
Y = expm(A*tf)*y0;
approx = y;
err = y-Y;
end