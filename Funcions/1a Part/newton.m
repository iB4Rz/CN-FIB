function x = newton(f,fprime,x,tol,n)
% mètode de newton de Cleve Moler
   s = '%5.0f %19.15f %19.15f %19.15f\n';
   fprintf('%5s %10.5s %19.5s %19.5s\n','k','x','f','l')
   fprintf(s,0,x,f(x),[])
   k = 0;
   xprev = x-1; l = abs(x-xprev);
    while (k < n) && (l > tol)
        xprev = x;
        x = x - f(x)/fprime(x);
        k = k + 1;
        l = abs(x-xprev);
        fprintf(s,k,x,f(x),l)
    end
end


