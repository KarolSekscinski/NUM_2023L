function [x0, y, iters] = Newton_poch(f, x, x1, eps)
% y - wspolrzedne x miejsca zerowego podanej funkcji
% iters - liczba iteracji potrzebna do osiagniecia miejsca zerowego
% f - wzor funkcji 
% x - dziedzina funkcji
% x1 - punkt poczatkowy
% eps - maksymalny blad zbieznosci (kryterium stopu)

% Przygotowuje macierz iteracji
iters = zeros(1,100);
i = 1;
xk = x1;

f = @(x) 2*sin(x).*exp(-0.1*x); % znany wzor funkcji
poch = @(x) 2 * exp(-0.1*x).* (cos(x) - 0.1 * sin(x)); % znany wzor pochodnej

while abs(f(xk)) > eps
    iters(1,i) = xk;
    % wyznaczenie wartosci pochodnej
    fp = poch(xk);
    % kolejna iteracja odnajdywania miejsc zerowych metoda Newtona-Raphsona
    xk = xk - f(xk)/fp;
    i = i + 1;
end
x0 = xk;
y = f(xk);
iters = iters(1, 1:i-1);