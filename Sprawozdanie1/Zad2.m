%Czyszcze konsole
clc
clear
close all
format compact

% funkcja z przykladu
f = @(x)(1./(1+x.^10));

% Wybieram stopien wielomianu (bo ma miec 7 wezlow)
n = 6';

% Generuje równo odległe punkty z podanego przedzialu
range = [-1 1];
x = linspace(range(1), range(2), 1001);

% Obliczam wartości funkcji w punktach x
f_values = f(x);

% Inicjuje pusty wektor wynikowy
p_values = zeros(1, length(x));

% Wykonuje interpolację i zapisuje wyniki

xn = linspace(range(1), range(2), n+1);
fn = f(xn);
p_values(1,:) = NewInter(xn, fn, x);


% Narysuje wykresy
figure();
plot(x, f_values, 'k-', 'LineWidth', 2);
hold on;

colors = {'r-'};

plot(x, p_values(1,:), colors{1}, 'LineWidth', 1);


xlabel('x');
ylabel('f(x)');
title('Interpolacja wielomianowa (metoda Newtona)');
legend('f(x)', 'p(x)');


%Obliczam blad
xe = linspace(-1, 1, 1000);
ye = polyval(p_values(1,:), xe);
yt = [];
for i = 1:length(xe)
    yt(i) = f(xe(i));
end
avgerror = mean(abs(yt-ye));
disp("Sredni blad:");
disp(avgerror);

