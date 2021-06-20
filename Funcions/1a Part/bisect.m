function x = bisect(f,a,b,n,tol)
% mètode de la biseccio de Cleve Moler
   s = '%5.0f %19.15f %19.15f %19.15f\n';
   fprintf('%5s %10.5s %19.5s %19.5s\n','k','x','f','l')
   fprintf(s,[],a,f(a),[])
   fprintf(s,[],b,f(b),[])
   k = 0; l = b-a;
   while (k < n) && (l > tol)
      x = (a + b)/2;
      if sign(f(x)) == sign(f(b))
         b = x;
      else 
         a = x;
      end
      k = k+1;
      l = b-a;
      fprintf(s,k,x,f(x),l)
   end
   x = (a + b)/2;
   fprintf(s,[],x,f(x),l/2)
end