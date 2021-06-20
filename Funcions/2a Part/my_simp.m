function valor = my_simp(f,a,b,k)
    n = length(k); TS = [];
    ve = integral(f,a,b);
    for i = 1:n
        h = 1/(2^k(i));
        x = a:h:b; y = f(x);
        w = 4*ones(1,length(y)-2);
        w(2:2:end) = 2;
        w = [1 w 1];
        valor = sum(y.*w*(h/3));
        TS = [TS; k(i), h, valor, abs(valor-ve), fix(-log10(2*abs(valor-ve)))];
    end
    taula = array2table(TS,'VariableNames',{'k','h','f(_)','error','xifres'});
    disp(taula)
end
