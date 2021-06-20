function x = my_roots(eq)
% Resolució equacions segon grau
    if length(eq) == 3
        a = eq(1); b = eq(2); c = eq(3);
        if (a == 0) x = -c/b;
        else
            dis = b^2 - 4*a*c;
            if dis < 0
                disp('No hi ha solució');
            elseif dis > 0
                x(1) = (-b+sqrt(dis))/(2*a);
                x(2) = (-b-sqrt(dis))/(2*a);
            else
                x = -b/(2*a);
            end
        end
    else
        disp('No és una equació de segon grau');
    end
end