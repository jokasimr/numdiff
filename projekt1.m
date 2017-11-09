
% Vi vill beräkna y givet initialvillkor och en matris A

unew = @(A, uold, h) A*uold * h + uold;

%%

% Experiment med e^x
y0 = 1;
A = 1;
h = 0.01;
x = [0];
y = [y0];

for i=0:h:5
    y = [y, unew(A, y(end), h)];
    x = [x, x(end)+h];
end

plot(x, y, 'x')
hold on
plot(x, exp(x))

%%


    