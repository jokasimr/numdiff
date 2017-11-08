function unew = ieulerstep(A,uold,h)
%Eulerstep behöver inte förklarning

unew = (eye(size(A,1))-h*A)\uold;
end

