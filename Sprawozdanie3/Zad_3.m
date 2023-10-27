%Czyszcze konsole
clc
clear
close all
format compact
% Funkcja oraz jej dziedzina
f = @(x) 2*sin(x).*exp(-0.1*x);
x = linspace(-3*pi, 3*pi, 1e3);

% Punkt poczatkowy
x1 = 1;

% Warunek stopu
eps = 1e-6;

[x0,y,iters] = Newton_poch(f,x,x1,eps);

i = length(iters);
iters = iters(1, 1:i-1);

% Wyswietlenie wykresu
figure(1)
plot(x, f(x), iters, f(iters), "*"); grid on;
disp("Miejsce zerowe ma wspolrzedne (x,y)")
disp(x0)
disp(y)