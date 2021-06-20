function [rhoJ, rhogs, rhoWgs, rhoWJ] = radis(A,n)
D = diag(diag(A)); 
L = tril(A-D); 
U = triu(A-D);

% Matrius de Jacobi
DI = inv(D);
BJ =-DI*(L+U);
rhoJ = abs(eigs(BJ,1));
fprintf('Jacobi amb rho = %5.4g\n',rhoJ);

% Matrius de SOR - Jacobi
w = 1;
C = inv(D);
Bwj = C*((1-w)*D-w*(L+U));
rhoWJ = abs(eigs(Bwj,1));
fprintf('Òptim de tanteig per SOR_J és w = %5.4g amb rho = %5.4g\n', w,rhoWJ);

% Matrius de Gauss-seidel
DI = inv(D+L);
Bgs =-DI*U;
rhogs = abs(eigs(Bgs,1));
fprintf('Gauss-Seidel amb rho = %5.4g\n', rhogs);

% Matrius de SOR - Gauss-Sseidel optim
wOpt = 2/(1+sqrt(1-rhoJ^2));
C = inv(D+wOpt*L);
Bwgs = C*((1-wOpt)*D-wOpt*U);
rhoWgsOpt = abs(eigs(Bwgs,1));
fprintf('Òptim teòric per SOR_GS és w = %5.4g amb rho = %5.4g\n', wOpt,rhoWgsOpt);

% Matrius de SOR - Gauss-Sseidel
w = 1.2;
C = inv(D+w*L);
Bwgs = C*((1-w)*D-w*U);
rhoWgs = abs(eigs(Bwgs,1));
fprintf('Òptim de tanteig per SOR_GS és w = %5.4g amb rho = %5.4g\n', w,rhoWgs);


w = linspace(0.1,2,n);
rhosg = zeros(n,1);
rhoj = zeros(n,1);
for i = 1:n
    C = inv(D+w(i)*L);
    Bwgs = C*((1-w(i))*D-w(i)*U);
    rhosg(i)= abs(eigs(Bwgs,1));
    Cj = inv(D);
    Bwj = Cj*((1-w(i))*D-w(i)*(L+U));
    rhoj(i) = abs(eigs(Bwj,1));
end

plot(w,rhoj,'r.');
title('radis SOR - Jacobi');
xlabel('w'); ylabel('rho'); xline(1,'b--');
yticks(0:0.5:2.5), ylim([0 2.5]);


plot(w,rhosg,'r.');
title('radis SOR - Gauss-Seidel');
xlabel('w'); ylabel('rho'); xline(1,'b--');
yticks(0:0.5:2), ylim([0 2]);
hold on
plot(wOpt,rhoWgs,'g*');
hold off



rhoWJ = rhoWgs;
end

