function unew = RK4step(f, uold, told, h)
%RK4

b = [1, 2, 2, 1] / 6;

Y1 = f(told, uold);
Y2 = f(told + h/2, uold + h*Y1/2);
Y3 = f(told + h/2, uold + h*Y2/2);
Y4 = f(told + h, uold + h*Y3);

unew = uold + h * b * [Y1; Y2; Y3; Y4]; 
end

