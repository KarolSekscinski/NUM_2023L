function y = Simpson3_8(f, a, b, n)
% Funkcja obliczająca całkę oznaczoną funkcji f na przedziale [a,b] metodą Simpsona 3/8.
% Argumenty:
% f - funkcja, której całkę obliczamy
% a - początek przedziału całkowania
% b - koniec przedziału całkowania
% n - liczba punktów pomiarowych (musi być podzielna przez 3 i większa od 3)
% Wynik:
% y - przybliżona wartość całki oznaczonej funkcji f na przedziale [a,b]

% Sprawdzenie warunków koniecznych do zastosowania metody Simpsona 3/8
if rem(n, 3) ~= 0 || n < 4
    error('Liczba punktów pomiarowych musi być podzielna przez 3 i większa od 3!');
end
% Obliczenie wartosc na krancowych punktach przedzialu calkowania
fa = f(a);
fb = f(b);
% Obliczenie wielkosci kroku
h = (b - a) / n;
% Obliczanie wartosci funkcji w punktach x1,x2,x4,x5,...
ffO = 0;

for i = 1:n - 1
    if rem(i, 3) ~= 0 
        m = (a + i*h);
        fOdd = f(m);
        ffO = ffO + fOdd;
    end
end
% Obliczenie wartosci funkcji x3,x6,...
ffE = 0;
for i = 1:(n / 3) - 1
    m = (a + 3 * i * h);
    fEven = f(m);
    ffE = ffE + fEven;
end
% Sumowanie wszystkich wartosci w celu obliczenia calki oznaczonej
y = (3*h/8) * (fa + 3 * ffO + 2 * ffE + fb);



