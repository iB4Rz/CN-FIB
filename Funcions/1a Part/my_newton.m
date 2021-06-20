function x = newton(f, df, x0, tol, n)
% mètode de newton
k = 0; x = x0; taula = []; controlf = 1; controlx = 1;
tolf = tol; tolx = tol;
while (k < n) && (controlf > tolf) && (controlx > tolx)
    y = x;
    x = x - (f(x)/df(x));
    controlf = abs(f(x));
    controlx = abs(x - y);
    taula = [taula; k, x, controlf, controlx];
    k = k + 1;
end

newTable = array2table(taula, "VariableNames",{'k','x','tolf','tolx'});
disp(newTable)

end
