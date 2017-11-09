function [unew, err] = RK34step(f, uold, told, h)
%RK34

Y1 = f(told, uold);
Y2 = f(told + h/2, uold + h*Y1/2);
Y3 = f(told + h/2, uold + h*Y2/2);
Z3 = f(told + h, uold - h*Y1 + 2*h*Y2);
Y4 = f(told + h, uold + h*Y3);

unew = uold + h * (Y1 + 2*Y2 + 2 * Y3 + Y4) / 6; 
znew = uold + h * (Y1 + 4*Y2 + Z3) / 6;

err = znew - unew;

end 

