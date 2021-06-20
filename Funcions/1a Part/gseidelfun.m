function x = gseidelfun(A,b,tol,n)
% Mètode iteratiu de Gauss-Seidel
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
DI = inv(D+L);
Bgs = -DI*U;
cgs = DI*b;
rhoGS = abs(eigs(Bgs,1));
if rhoGS < 1
    k = 0;
    x = zeros(size(b));
    r = norm(A*x-b,1);
    while (k < n && r > tol)
        k = k + 1;
        x = Bgs*x + cgs;
        r = norm(A*x-b,1);
    end
    fprintf('El mètode és convergent, en k = %d, el residu és %5.4g i el vector solució és:\n',k,r)
else
    fprintf('mètode de Gauss-Seidel divergent')    
end

end

