function s = sumapi(m)
% Funció convergència a pi
x = 0;
for n = 0:m
    x = x + ((-1/3)^n)/(2*n+1);
end
s = sqrt(12)*x;
end