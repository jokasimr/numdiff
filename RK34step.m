function [unew, err] = RK34step(f, uold, told, h)
%RK34

by = [1, 2, 2, 1] / 6;
bz = [1, 4, 1] / 6;

Y1 = f(told, uold);
Y2 = f(told + h/2, uold + h*Y1/2);
Y3 = f(told + h/2, uold + h*Y2/2);
Z3 = f(told + h, uold - h*Y1 + 2*h*Y2);
Y4 = f(told + h, uold + h*Y3);

unew = uold + h * by * [Y1; Y2; Y3; Y4]; 
znew = uold + h * bz * [Y1; Y2; Z3];

err = norm(znew - unew);

end 

