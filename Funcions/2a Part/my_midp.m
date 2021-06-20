function valor = my_midp(f,a,b,k)
    n = length(k); MT = [];
    ve = integral(f,a,b);
    for i = 1:n
        n = 2^k(i);
        valor = midp(f,a,b,n);
        MT = [MT; k(i), (b-a)/n, valor, abs(valor-ve), fix(-log10(2*abs(valor-ve)))];
    end
    taula = array2table(MT,'VariableNames',{'k','h','f(_)','error','xifres'}); 
    disp(taula)
end


function r = midp(f,a,b,n)
    h = (b - a) / n;
    x = a + h * 0.5;
    r = 0;
    for i=1:n
        r = r + f(x);
        x = x + h;
    end
    r = r * h;
end