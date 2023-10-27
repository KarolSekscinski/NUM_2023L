%Czyszcze konsole
clc
clear
close all
format compact

% Funkcja oraz jej dziedzina
f = @(x)(x.^3+x.^2+x+1);
x = linspace(-2,2,1001);

% Punkt poczatkowy
x1 = 1;

% Warunek stopu
eps = 1e-6;

% wielkosc kroku
h = 1e-6;

[y,x0,iters] = Newton_num(f,x,x1,eps,h);

i = length(iters);
iters = iters(1, 1:i-1);

% Wyswietlenie wykresu
figure(1)
plot(x, f(x), iters, f(iters), "*"); grid on;
disp("Miejsce zerowe ma wspolrzedne (x,y)")
disp(x0)
disp(y)
