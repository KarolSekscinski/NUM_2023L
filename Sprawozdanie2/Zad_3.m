%Czyszcze konsole
clc
clear
close all
format compact


% Generacja macierzy A oraz b o zadanej wartosci uwarunkowania

condNumber = 5; % wartość uwarunkowania
N = 101; % rozmiar macierzy

A = rand(N);
A = A + 10*eye(N);
[U, S, V] = svd(A);
S = diag(logspace(0, log10(condNumber), N));
A = U * S * V';

% losowy wektor kolumnowy N na 1

b = randn(N,1); 

%A =[ 3.6949   -2.1455    0.6739    0.7276   -1.6621;
%    -2.1031   16.1014   -2.5597   -6.3384   -3.0199;
%     0.7560   -2.9286    6.0576   -0.9870   -2.2731;
%     0.8312   -6.1312   -0.7206    5.2986    1.4500;
%    -2.0541   -1.9893   -2.8025    1.4923    5.8452];
%b =[    3.7527;
 %       5.7755;
 %       8.5317;
 %       3.3304;
  %      7.2411];

% Obliczanie rozwiazan poszczegolnymi algorytmami iteracyjnymi
% maksymalny blad zbieznosci (kryterium stopu)
E = 1e-6;

[x, i, err] = algorytmy_iteracyjne(A, b, "Jacobie", E)

x1 = algorytmy_iteracyjne(A, b, "Gauss-Seild", E);

x2 = algorytmy_iteracyjne(A, b, "SOR", E);
