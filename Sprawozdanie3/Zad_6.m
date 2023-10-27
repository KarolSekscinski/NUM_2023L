%Czyszcze konsole
clc
clear
close all
format compact

% Przygotowuje funkcje wraz z ich dziedzinami
f1 = @(x)(x.^3+x.^2+x+1);
x1 = linspace(-2,2,1001);

f2 = @(x)(-2*x.^3+10*x.^2-10);
x2 = linspace(-2,5,1001);

f3 = @(x)(0.2*x.*exp(x)-0.4*exp(x));
x3 = linspace(-1,3,1001);

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

% Przygotowuje macierze wynikowe
zbieznosc = cell(4,8);
zbieznosc{1,1} = f1;
zbieznosc{2,1} = f2;
zbieznosc{3,1} = f3;
zbieznosc{4,1} = f4;
wyniki = cell(4,8);
wyniki{1,1} = f1;
wyniki{2,1} = f2;
wyniki{3,1} = f3;
wyniki{4,1} = f4;

% Warunek stopu
eps = 1e-6;
j = 1;

% Obliczam zbieznosci oraz wplyw wielkosci kroku na wynik
for h = [1e-1,1e-2,1e-3,1e-4, 1e-5, 1e-6, 1e-7,1e-8]
    for i = 1:4
        f = functions{i,1};
        x = functions{i,2};
        x1 = 1.6;
        [y, ~,  iters] = Newton_num(f, x, x1, eps, h);
        zbieznosc{i, j} = length(iters);
        wyniki{i,j} = y;

    end
    j = j + 1;

end
% Przygotowuje wyniki w celu latwiejszego wyswietlenia na wykresie
zbieznosc = cell2mat(zbieznosc);
wyniki = cell2mat(wyniki);

% Rysowanie wykresu log-log wplywu h na wyniki zbieznosci
h = [1e-1,1e-2,1e-3,1e-4, 1e-5, 1e-6, 1e-7,1e-8];
figure

for i = 1:4
    subplot(2,2,i);
    loglog(h, zbieznosc(i,:), 'o-', 'LineWidth', 2);
    title('Wpływ h na zbieznosc');
    xlabel('wielkosc kroku (h)');
    ylabel('Iteracje');

end
sgtitle("Zbieznosc wynikow w zaleznosc od h")
figure

% Rysowanie wykresu log-log wplywu h na dokladnosc rozwiazania
for i = 1:4
    subplot(2,2,i);
    loglog(h, abs(wyniki(i,:)), 'LineWidth', 2);
    title('Wpływ h na wyniki');
    xlabel('wielkosc kroku (h)');
    ylabel('|wyniki|');
    % Dodanie siatki pomocniczej
    grid on;
end
sgtitle("Dokladnosc rozwiazania w zaleznosci od h")
