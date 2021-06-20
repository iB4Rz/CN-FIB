function x = sor_gseidelfun(A,b,w,tol,n)
% Mètode iteratiu de SOR-Gauss-Seidel
if nargin == 2
    w = 1.2;
    n = 100;
    tol = 0.5e-5;
end
if nargin == 3
    n = 100;
    tol = 0.5e-5;
end
if nargin == 4
    n = 100;
end
D = diag(diag(A));
L = tril(A-D);
U = triu(A-D);
C = inv(D+w*L);
Bwgs = C*((1-w)*D-w*U);
cwgs = w*C*b;
rhoW = abs(eigs(Bwgs,1));
if rhoW < 1
    k = 0;
    x = zeros(size(b));
    r = norm(A*x-b,1);
    while (k < n && r > tol)
        k = k + 1;
        x = Bwgs*x + cwgs;
        r = norm(A*x-b,1);
    end
    fprintf('El mètode és convergent, en k = %d, el residu és %5.4g i el vector solució és:\n',k,r)
else
    fprintf('mètode de SOR-Gauss-Seidel divergent')    
end

end
