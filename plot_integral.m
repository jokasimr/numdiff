function plot_integral(func, A, y0, t0, tf, N)
%Integrate y' = Ay and plot the result
y = y0;
h = (tf-t0)/N;
points = zeros(N+1);
points(1) = norm(y0);
Points = zeros(N+1);
Points(1) = norm(y0);
t = zeros(N+1);
t(1) = t0;
for i=1:1:N
    y = func(A, y, h);
    Y = expm(A*(t0+i*h))*y0;
    points(i+1) = norm(y);
    Points(i+1) = norm(Y);
    t(i+1) = (t0+i*h);
end
plot(t, points, 'r');
hold on
plot(t, Points, 'g');
end

