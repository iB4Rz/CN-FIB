function valor = my_montecarlo(f,a,b,k)
    n = length(k); TM = [];
    ve = integral(f,a,b);
    for i = 1:n
        m = 10^k(i);
        x = a+(b-a)*rand(m,1);
        valor = (b-a)*sum(f(x))/m;
        TM = [TM; k(i), m, valor, abs(valor-ve), fix(-log10(2*abs(valor-ve)))];
    end
    taula = array2table(TM,'VariableNames',{'k','M','f(_)','error', 'xifres'});
    disp(taula)
end
