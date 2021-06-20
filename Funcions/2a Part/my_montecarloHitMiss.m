function valor = my_montecarloHitMiss(f,a,b,m)
    x = (b-a).*rand(m,1) + a;
    y = (b-a).*rand(m,1) + a;
    k = 0;
    for i = 1:m
        if f(x(i),y(i)) <= 1
            k = k+1;
        end
    end
    valor = (b-a)*2*k/m;
end
