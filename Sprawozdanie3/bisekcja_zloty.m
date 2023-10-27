
function [y,x0, iters] = bisekcja_zloty(f, x, eps)
% y - wspolrzedne x miejsca zerowego podanej funkcji
% iter - liczba iteracji potrzebna do osiagniecia miejsca zerowego
% f - wzor funkcji 
% x - dziedzina funkcji
% x1 - punkt poczatkowy
% eps - maksymalny blad zbieznosci (kryterium stopu)

iters = zeros(1,100);
i = 1;

% wyznaczenie punktow skrajnych z podanej wyzej dziedziny
a = min(x);
b = max(x);
% Wyznaczenie punktu podzialu opartego o zloty podzial
phi = ( 1 + sqrt(5)) / 2;
c = a + (b - a) / phi;

while abs(f(c)) > eps
    iters(1,i) = c;
    c = a + (b - a) / phi;
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
