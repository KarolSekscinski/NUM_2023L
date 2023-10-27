function y = Bool(f,a,b,n)
% y - wartosc obliczonego pola pod calka
% f - wzor funkcji calkowanej
% a - poczatek przedzialu calkowania
% b - koniec przedzialu calkowania
% n - liczba podprzedzialow calkowania

% Funkcja obliczająca całkę oznaczoną funkcji f na przedziale [a,b] metodą Bool'a.
% Argumenty:
% f - funkcja, której całkę obliczamy
% a - początek przedziału całkowania
% b - koniec przedziału całkowania
% n - liczba punktów pomiarowych (musi byc parzysta)
% Wynik:
% y - przybliżona wartość całki oznaczonej funkcji f na przedziale [a,b]

% Sprawdzenie warunków koniecznych do zastosowania metody Bool'a

if mod(n,2) ~= 0
    error('Number of subintervals must be even')
end

h = (b - a) / n; % wielkosc kroku 
% Obliczenie wartosc funkcji na krancach przedzialu
fa = f(a);
fb = f(b);
% Obliczenie wartosc funkcji dla nieparzystych punktow
ffi = 0;
for i = 1:2:n - 1
    m1 = (a + i * h);
    fi = f(m1);
    ffi = ffi + fi;
end
% Obliczenie wartosc funkcji dla punktow x2, x6,...
ffj = 0;
for j = 2:4:n - 2
    m2 = (a + j * h);
    fj = f(m2);
    ffj = ffj + fj;
end
% Obliczenie wartosc funkcji dla punktow x4,x8,...
ffk = 0;
for k = 4:4:n - 4
    m3 = (a + k * h);
    fk = f(m3);
    ffk = ffk + fk;
end
% Sumowanie wszystkich wartosci w celu obliczenia calki oznaczonej
y = ((2 * h) / 45) * (32 * ffi + 12 * ffj + 14 * ffk + 7 * (fa + fb));



