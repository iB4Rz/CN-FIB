function S = my_exp(x,n)
j = 1; S = 1; p = 1;
ea = 1; ve = exp(x);
if (x > 0)
    while(ea > 0.5e-12 && j <= n)   % 12 decimals correctes
        p = p*x/j;
        S = S + p;
        j = j + 1;
        ea = abs(S-ve);
    end
end

if (x < 0)
    y = abs(x);
    while(ea > 0.5e-12 && j <= n)
        p = p*y/j;
        S = S + p;
        j = j + 1;
        ea = abs(1/S-ve);
    end
    S = 1/S;
end

dc = fix(-log10(2*ea));
xc = fix(-log10(2*(ea/ve)));
fprintf('El valor de e^(%g) calculat de Matlab és %16.14f\n',x,ve)
fprintf(['El valor de e^(%g) aproximat és %16.14f; es tenen ', ...
'%g decimals correctes i %g xifres significatives\n\n'],x,S,dc,xc)

    
