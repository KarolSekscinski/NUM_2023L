%Czyszcze konsole
clc
clear
close all
format compact

% Funkcja oraz jej dziedzina

f = @(x)(-2*x.^3+10*x.^2-10);
x = linspace(-2,5,1001);

% Warunek stopu
eps = 1e-6;

[y,x0,iters] = bisekcja(f,x,eps);

i = length(iters);
iters = iters(1, 1:i-1);

% Wyswietlenie wykresu
figure(1)
plot(x, f(x), iters, f(iters), "*"); grid on;
disp("Miejsce zerowe ma wspolrzedne (x,y)")
disp(x0)
disp(y)

