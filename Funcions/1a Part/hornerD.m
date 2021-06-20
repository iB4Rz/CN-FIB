function [ pa ] = hornerD(coeff,a,d)
%   HORNER avalua el polinomi de grau n
%   p(x) = coeff(1)x.^n + coeff(2)x.^(n-1) + ... + coeff(n-1)x + coeff(n)
%   en x=a pel mètode de horner fent ús de d dígits
Coeff = round(coeff,d,'significant');
A = round(a,d,'significant');
pa = round(coeff(1),d,'significant');
x=A;
for k=2:length(coeff)
    pa = round(pa.*x,d,'significant') + coeff(k);
    pa = round(pa,d,'significant');
end
return
end