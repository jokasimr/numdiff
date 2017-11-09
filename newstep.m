function hnew = newstep(tol, err, errold, hold, k)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

hnew = (tol/err)^(2/(3*k)) *  (tol/errold)^(-1/(3*k)) * hold;

end

