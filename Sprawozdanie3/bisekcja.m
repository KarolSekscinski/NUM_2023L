
function [y,x0, iters] = bisekcja(f, x, eps)
% y - wspolrzedne y miejsca zerowego podanej funkcji
% iter - liczba iteracji potrzebna do osiagniecia miejsca zerowego
% f - wzor funkcji 
% x - dziedzina funkcji
% eps - maksymalny blad zbieznosci (kryterium stopu)
% x0 - wspolrzedna x miejsca zerowego podanej funkcji
iters = zeros(1,100);
i = 1;
% wyznaczenie punktow skrajnych z podanej wyzej dziedziny
a = min(x);
b = max(x);
% wyznaczenie punktu srodkowego
c = a + (b - a) / 2;
while abs(f(c)) > eps
    % zapisanie iteracji zeby wyswietlic droge algorytmu na wykresie
    iters(1,i) = c;
    c = a + (b - a) / 2;
    if sign(f(a)) == sign(f(c))
        a = c;
    else
        b = c;
    end
i = i+1;

end
x0 = c;
y = f(c);
iters = iters(1, 1:i-1);
