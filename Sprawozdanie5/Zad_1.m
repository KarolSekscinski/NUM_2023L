%Czyszcze konsole
clc
clear
close all
format compact

% Rownanie do rozwiazania
% y' = 3xy^2
%
% Warunki poczatkowe
% y0 = 0.5
% 
% Przedzial calkowania
% x = [1, 1.5]

% Dane
f = @(x,y) 3*x*y^2;
y0 = 0.5;
range = [1, 1.5];
h = 0.001;
F = @(x) -1./(1.5*x.^2-3.5);

% Rozwiazanie
[x1, y1] = runge_knutt(f, y0, range,h, 1);
[x2, y2] = runge_knutt(f, y0, range,h, 2);
[x3, y3] = runge_knutt(f, y0, range,h, 3);
[x4, y4] = runge_knutt(f, y0, range,h, 4);

% Wykres
figure;

plot(x1, y1, 'r', 'LineWidth', 2); hold on
plot(x2, y2, 'g','LineWidth', 2);
plot(x3, y3, 'b','LineWidth', 2);
plot(x4, y4, 'm','LineWidth', 2);
x_a = linspace(range(1), range(2), 501);
y_a = F(x_a);
plot(x_a, y_a, 'k--')
title('Rozwiazanie rowniania y'' = 3xy^2');
legend('RK1', 'RK2', 'RK3', 'RK4', 'Analityczne')

% Bledy
figure;
plot(x1, abs(y1 - y_a), 'r'); hold on
plot(x2, abs(y2 - y_a), 'g');
plot(x3, abs(y3 - y_a), 'b');
plot(x4, abs(y4 - y_a), 'm');
title('Bledy rozwiazania rowniania y'' = 3xy^2');
legend('RK1', 'RK2', 'RK3', 'RK4')
