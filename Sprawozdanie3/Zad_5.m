%Czyszcze konsole
clc
clear
close all
format compact


% Przygotowuje funkcje wraz z ich dziedzinami
f1 = @(x)(x.^3+x.^2+x+1);
x1 = linspace(-27,2,1001);

f2 = @(x)(-2*x.^3+10*x.^2-10);
x2 = linspace(-2,5,1001);

f3 = @(x)(0.2*x.*exp(x)-0.4*exp(x));
x3 = linspace(-19,3,1001);

f4 = @(x)(2*sin(x)+log(x));
x4 = linspace(0,6,1001);

% Przygotowuje macierz funkcji
functions = cell(4,2);
functions{1,1} = f1;
functions{2,1} = f2;
functions{3,1} = f3;
functions{4,1} = f4;
functions{1,2} = x1;
functions{2,2} = x2;
functions{3,2} = x3;
functions{4,2} = x4;


% Przygotowuje macierz wynikowa zbieznosci
zbieznosc = cell(4,3);
zbieznosc{1,1} = f1;
zbieznosc{2,1} = f2;
zbieznosc{3,1} = f3;
zbieznosc{4,1} = f4;
eps = 1e-6;
for i = 1:4
    f = functions{i,1};
    x = functions{i,2};
    [~,~,iters] = bisekcja(f,x,eps);
    i1 = length(iters);
    zbieznosc{i,2} = i1;
    [~,~, iters1] = bisekcja_zloty(f, x, eps);
    i2 = length(iters1);
    zbieznosc{i,3} = i2;
    
end

% odczytanie wymiarów macierzy
[num_rows, num_cols] = size(zbieznosc);

% inicjalizacja wektorów wynikowych
func_names = cell(num_rows, 1);
result1 = zeros(num_rows, 1);
result2 = zeros(num_rows, 1);

% przypisanie wartości wektorom wynikowym
for i = 1:num_rows
    func_names{i} = func2str(zbieznosc{i, 1}); % konwersja funkcji na napis
    result1(i) = zbieznosc{i, 2};
    result2(i) = zbieznosc{i, 3};
end

% wykres kolumnowy porównujący wyniki
figure
bar([result1, result2])
xlabel('Funkcje')
ylabel('liczba iteracji')
set(gca, 'XTickLabel', func_names)
legend('Rownomierny podzial', 'Zloty podzial')



