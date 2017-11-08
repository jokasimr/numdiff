function [approx,err] = ieulerint(A, y0, t0, tf, N)
%Integrate y' = Ay 
y = y0;
h = (tf-t0)/N;
for i=0:1:N-1
    y = ieulerstep(A, y, h);
end
Y = expm(A*tf)*y0;
approx = y;
err = y-Y;
end

