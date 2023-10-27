function y = simpson1_3(f,a,b,n)
% Parametry wyjsciowe
% y - wartosc obliczonego pola pod calka
% Parametry wejsciowe 
% f - wzor funkcji calkowanej
% a - poczatek przedzialu calkowania
% b - koniec przedzialu calkowania
% n - liczba podprzedzialow calkowania


   
    
% Sprawdzenie warunków koniecznych do zastosowania metody Simpsona 1/3

    if mod(n,2) ~= 0
        error('Number of subintervals must be even')
    end

% Obliczenie wielkosci kroku
    h = (b - a) / n;
% Sumowanie przedzialow nieparzystych
    ffO = 0;
    for i = 2:2:n
        m = (a + (i-1)*h);
        fOdd = f(m);
        ffO = ffO + fOdd;
    end
% Sumowanie przedzialow parzystych
    ffE = 0;
    for i = 3:2:n
        m = (a + (i-1) * h);
        fEven = f(m);
        ffE = ffE + fEven;
    end
% Sumowanie wszystkich wartosci w celu obliczenia calki oznaczonej
    y = (h/3) * (f(a)+f(b) + 4*ffO + 2*ffE);











