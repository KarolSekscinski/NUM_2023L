clc
clear

f = @(x)(-2*x.^3+10*x.^2-10);  % funkcja podcałkowa
a = -2;         % dolna granica całkowania
b = 5;         % górna granica całkowania
n = 12;       % liczba podziałów przedziału [a,b]

result = Simpson3_8(f, a, b, n);  % wynik całkowania metoda Simpsona 3/8
q = integral(f,a,b); % wynik calkowania wbudowana metoda matlaba do calkowania

err = (q - result) / q * 100;  % blad wzgledny
disp("Funkcja:")
disp(func2str(f))
disp("Blad wzgledny rozwiazania wzgledem wbudowanej metody w Matlabie:")
disp(err)

f = @(x)(0.2*x.*exp(x)-0.4*exp(x)); % funkcja podcałkowa
a = -1; % dolna granica całkowania
b = 3; % górna granica całkowania
n = 12; % liczba podziałów przedziału [a,b]

result = Simpson3_8(f, a, b, n);  % wynik całkowania metoda Simpsona 3/8
q = integral(f,a,b); % wynik calkowania wbudowana metoda matlaba do calkowania

err = (q - result) / q * 100;  % blad wzgledny
disp("Funkcja:")
disp(func2str(f))
disp("Blad wzgledny rozwiazania wzgledem wbudowanej metody w Matlabie:")
disp(err)


