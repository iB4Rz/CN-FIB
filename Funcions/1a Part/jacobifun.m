function x = jacobifun(A,b,tol,n)
% Mètode iteratiu de Jacobi
if nargin == 2
    n = 100;
    tol = 0.5e-5;
end
if nargin == 3
    n = 100;
end
D = diag(diag(A));
L = tril(A-D);
U = triu(A-D);
DI = inv(D);
BJ = -DI*(L+U);
cJ = DI*b;
rhoJ = abs(eigs(BJ,1));
if rhoJ < 1
    k = 0;
    x = zeros(size(b));
    r = norm(A*x-b,1);  % error
    while (k < n && r > tol)
        k = k+1;
        x = BJ*x + cJ;
        r = norm(A*x-b,1);
    end
    fprintf('El mètode és convergent, en k = %d, el residu és %5.4g i el vector solució és:\n',k,r)
else
    fprintf('mètode de Jacobi divergent')
end
    
end

