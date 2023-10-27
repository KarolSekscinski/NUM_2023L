%Czyszcze konsole
clc
clear
close all
format compact


% Generacja macierzy A oraz b o zadanej wartosci uwarunkowania

condNumber = 5; % wartość uwarunkowania
N = [5,10,20,50,100,200,500,1000]; % rozmiar macierzy

time1 = zeros(size(N));
time2 = zeros(size(N));
time3 = zeros(size(N));


for i=1: length(N)

    A = rand(N(i), N(i));
    A = A + 10*eye(N(i));
    [U, S, V] = svd(A);
    S = diag(logspace(0, log10(condNumber), N(i)));
    A = U * S * V';

    % losowy wektor kolumnowy N na 1

    b = randn(N(i),1);
    E = 1e-10;
    N;
    tic
    [x, iteration, err] = algorytmy_iteracyjne(A, b, "Jacobie", E);
    
    time1(i) = toc;
    tic 
    x1 = algorytmy_iteracyjne(A,b, "Gauss-Seild",E);
    
    time2(i) = toc;
    tic
    x2 = algorytmy_iteracyjne(A,b, "SOR",E);
    time3(i) = toc;


end

% Rysujemy wykres czasu
figure
plot(N, time1, 'r')
xlabel('Rozmiar')
ylabel('Czas')
title('Metoda Jacobiego')

figure
plot(N, time2, 'b')
xlabel('Rozmiar')
ylabel('Czas')
title('Metoda Gaussa-Seilda')

figure
plot(N, time3, 'magenta')
xlabel('Rozmiar')
ylabel('Czas')
title('Metoda SOR')