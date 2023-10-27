function [y, x0,  iters] = Newton_num(f, x, x1, eps, h)
% y - wspolrzedne x miejsca zerowego podanej funkcji
% iter - liczba iteracji potrzebna do osiagniecia miejsca zerowego
% f - wzor funkcji 
% x - dziedzina funkcji
% x1 - punkt poczatkowy
% eps - maksymalny blad zbieznosci (kryterium stopu)
% h - wielkosc kroku

% Przygotowanie macierzy iteracji
iters = zeros(1,100);
i = 1;
xk = x1;
while abs(f(xk)) > eps
    % Zapisuje punkty iteracji
    iters(1,i) = xk;
    % numeryczne wyznaczenie wartosci pochodnej
    fp = (f(xk+h) - f(xk)) / (h);
    % kolejna iteracja odnajdywania miejsc zerowych metoda Newtona-Raphsona
    xk = xk - f(xk)/fp;
    i = i + 1;
end
x0 = xk;
y = f(xk);
iters = iters(1, 1:i-1);

