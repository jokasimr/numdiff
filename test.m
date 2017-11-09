

%% 3.1

a = 3;
b = 9;
c = 15;
d = 15;
p = 1.17288;

H = @(x, y) c*x + b*y - d * log(x) - a * log(y);
f = @(t, y) [a*y(1) - b*y(1)*y(2); c*y(1)*y(2) - d*y(2)];
    
y0 = [2; 1];

[t, y] = adaptiveRK34(f, y0, 0, 1000*p, 10^-6);
figure(1);
plot(y(1,:), y(2, :))
%%

figure(1);
semilogx(t, abs(H(y(1, :), y(2, :))/H(y0(1), y0(2))-1)); 

figure(2);
semilogy(t, abs(H(y(1, :), y(2, :))/H(y0(1), y0(2))-1)); 

figure(3);
loglog(t, abs(H(y(1, :), y(2, :))/H(y0(1), y0(2))-1)); 

%% 4.1
y0=[2;0];
mu = 100;
f = @(t, y) [y(2); mu*(1-y(1)^2)*y(2)-y(1)];
[t,y] = adaptiveRK34(f,y0,0,2*mu,10^-6);
plot(t,y(2,:))
%%
y0=[2;0];
mu = 100;
f = @(t, y) [y(2); mu*(1-y(1)^2)*y(2)-y(1)];
[t,y] = adaptiveRK34(f,y0,0,2*mu,10^-6);
plot(y(1,:),y(2,:))
hold on
y0=[0;-0.1];
[t,y] = adaptiveRK34(f,y0,0,2*mu,10^-6);
plot(y(1,:),y(2,:))

