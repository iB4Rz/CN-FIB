function [x,control,k] = func_iter(g,x,tol,n)
% Mètode iteratiu f
if nargin == 2
    n = 50;
    tol = 0.5e-5;
end
if nargin == 3
    n = 50;
end
k = 0; control = 1;
while (k < n) && (control > tol)
    x = g(x);
    control = abs(g(x)-x);
   k = k+1;
end
k = k-1;
end

