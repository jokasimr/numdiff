function unew = eulerstep(A,uold,h)
%Eulerstep behöver inte förklarning
unew = A*uold * h + uold;
end

