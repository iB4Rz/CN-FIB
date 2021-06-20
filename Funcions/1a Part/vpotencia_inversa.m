function [vap,vep,iteracions,residu] = vpotencia_inversa(A, x, n, tol)
% mètode de la potencia, mòdul mìnim
k = 0; control = 1;
while (k < n) && (control > tol)
    y = x;
    z = linsolve(A,x);
    m = (x'*z)/(x'*x);  % Quocient de Rayleigh
    x = z/m;
    %[m,j] = max(abs(z));  % norma infinit
    %x = z/z(j);
    control = norm(x-y,'inf');
    k = k+1;
end
vep = x;
vap = (x'*x)/(x'*z);
iteracions = k;
residu = norm(A*vep-vap*vep);
end