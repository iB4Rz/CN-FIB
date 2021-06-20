function b = zeroin(f,a,b)
   % Zeroin(f,a,b) reduces the interval [a,b] to a tiny
   % interal on which the function f(x) changes sign.
   % Returns one end point of that interval.

   fa = f(a);
   fb = f(b);
   if sign(fa) == sign(fb)
      error('Sorry, f(x) must change sign on the interval [a,b].')
   end
   s = '%5.0f %8s %19.15f %23.15e\n';
   fprintf(s,1,'initial',a,fa)
   fprintf(s,2,'initial',b,fb)
   k = 2;

   % a is the previous value of b and [b, c] always contains the zero.
   c = a; fc = fa;
   while true
      if sign(fb) == sign(fc)
         c = a; fc = fa;
      end

      % Swap to insure f(b) is the smallest value so far.
      if abs(fc) < abs(fb)
         a = b; fa = fb;
         b = c; fb = fc;
         c = a; fc = fa;
      end

      % Midpoint.
      m = (b + c)/2;
      if abs(m - b) <= eps(abs(b))
         return   % Exit from the loop and the function here.
      end

      % p/q is the the secant step.
      p = (b - a)*fb;
      if p >= 0
         q = fa - fb;
      else
         q = fb - fa;
         p = -p;
      end
      % Save this point.
      a = b; fa = fb;
      k = k+1;

      % Choose next point.
      if p <= eps(q)
         % Minimal step.
         b = b + sign(c-b)*eps(b);
         fb = f(b);
         fprintf(s,k,'minimal',b,fb)

      elseif p <= (m - b)*q
         % Secant.
         b = b + p/q;
         fb = f(b);
         fprintf(s,k,'secant ',b,fb)

      else
         % Bisection.
         b = m;
         fb = f(b);
         fprintf(s,k,'bisect ',b,fb)
      end
   end
end