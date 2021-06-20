function b = secant(f,a,b, tolf, tolx, n)
% mètode de la secant de Cleve Moler
   s = '%5.0f %19.15f %23.15e %19.15f\n';
   fprintf('%5s %10.5s %19.5s %19.5s\n','k','x','f','l')
   fprintf(s,[],a,f(a),[])
   fprintf(s,[],b,f(b),[])
   controlf = 1; controlx = 1;
   k = 0;
   while (k < n) && (controlx > tolx)
      c = a;
      a = b;
      b = b + (b - c)/(f(c)/f(b) - 1);
      k = k+1;
      controlx = abs(b-a);
      controlf = abs(f(b));
      fprintf(s,k,b,f(b),controlx)
   end
end