function plotshrod(V,E,Y,x)
N = length(x);
height = (ones(N, 1)*E');
raised_wave = height + Y*max(E);
P = (Y.*Y);
raised_P = height + P*max(E)^1.5;
figure(1)
hold on
plot(x, V, '--');
plot(x, raised_wave)

figure(2)
hold on
plot(x, V, '--');
plot(x, raised_P)

end

