function [vap,vep,iteracions,residu] = vpotencia(A, x, n, tol)
% mètode de la potencia, mòdul màxim
k = 0; control = 1;
while (k < n) && (control > tol)
    y = x;
    z = A*x;
    m = (x'*z)/(x'*x);  % Quocient de Rayleigh
    x = z/m;
    %[m,j] = max(abs(z));  % norma infinit
    %x = z/z(j);
    control = norm(x-y,'inf');
    k = k+1;
end
vep = x;
vap = (x'*z)/(x'*x);
iteracions = k;
residu = norm(A*vep-vap*vep);
end
