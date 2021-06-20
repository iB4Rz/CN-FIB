function valor = my_trap(f,a,b,k)
    n = length(k); TT = [];
    ve = integral(f,a,b);
    for i = 1:n
        h = 1/(2^k(i));
        x = a:h:b; y = f(x);
        w = [1 2*ones(1,length(y)-2) 1];
        valor = sum(y.*w*(h/2));
        TT = [TT; k(i), h, valor, abs(valor-ve), fix(-log10(2*abs(valor-ve)))];
    end
    taula = array2table(TT,'VariableNames',{'k','h','f(_)','error','xifres'}); 
    disp(taula)
end
