
y0 = [1;1];
t0 = 0;
tf = 10;
A=[-1 100; 0 -30];
plot_integral(@(A, y, h) eulerstep(A, y, h), A, y0, t0, 10, 10000)
%ierrVSh(A, y0, t0, tf);
%hold on
%errVSh(A, y0, t0, tf);
eig(A)