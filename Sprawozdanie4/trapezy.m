function y = trapezy(f,a,b,n)
% y - wartosc obliczonego pola pod calka
% f - wzor funkcji calkowanej
% a - poczatek przedzialu calkowania
% b - koniec przedzialu calkowania
% n - liczba podprzedzialow calkowania

h = (b - a) / n; % wielkosc kroku


x = a:h:b; % obliczenie podprzedzialow
% obliczenie calki numerycznie 
suma = 0;
for i = 1:length(x) - 1
    a = x(i);
    b = x(i+1);
    suma = suma + h * (f(a) + f(b)) / 2;
end
% Sumowanie wszystkich wartosci w celu obliczenia calki oznaczonej
y = suma; 


