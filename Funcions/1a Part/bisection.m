function m = bisection(f, a, b, n, tol)
% mètode de la bisecció
k = 0; taula = []; control = 1;
while (k < n) && (control > tol)
    m = (a+b)/2;
    control = (b-a)/2;
    taula = [taula; k,control,a,m,b,f(a),f(m),f(b)];
    if (f(a)*f(m) < 0)
        b = m;
    else
        a = m;
    end
    k = k + 1;
end

bisecTable = array2table(taula, "VariableNames",{'k','(b-a)/2','a','m', ...
    'b','f(a)','f(m)','f(b)'});
disp(bisecTable)

end

