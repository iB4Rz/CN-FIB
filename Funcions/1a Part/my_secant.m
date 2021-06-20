function x = newton(f, x0, x1, tolf, tolx, n)
% mètode secant
k = 0; y = x0; x = x1; taula = []; controlf = 1; controlx = 1; 
while (k < n) && (controlf > tolf) && (controlx > tolx)
    z = (y*f(x) - x*f(y))/(f(x) - f(y));
    y = x;
    x = z;
    controlf = abs(f(x));
    controlx = abs(x - y);
    taula = [taula; k, x, controlf, controlx];
    k = k + 1;
end

secTable = array2table(taula, "VariableNames",{'k','x','tolf','tolx'});
disp(secTable)

end