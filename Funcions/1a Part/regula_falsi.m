function x = regula_falsi(f, a, b, n, tol)
% mètode de regula falsi
k = 0; taula = []; control = 1;
while (k < n) && (control > tol)
    x = a - f(a)*(b-a)/(f(b) - f(a));
    control = abs(f(x));
    taula = [taula; k,control,a,x,b,f(a),f(x),f(b)];
    if (f(a)*f(x) < 0)
        b = x;
    else
        a = x;
    end
    k = k + 1;
end

fasiTable = array2table(taula, "VariableNames",{'k','cota','a','x', ...
    'b','f(a)','f(x)','f(b)'});
disp(fasiTable)

end
