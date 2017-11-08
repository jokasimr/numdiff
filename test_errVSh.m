
y0 = 1;
t0 = 0;
tf = 10;
A=[-3 100; 0 -30];
errVSh(1, y0, t0, tf); 
hold on
errVSh(2, y0, t0, tf);
errVSh(3, y0, t0, tf);
errVSh(4, y0, t0, tf);
errVSh(A, [1;1], t0, tf);
