%Czyszcze konsole
clc
clear
close all
format compact


% Generacja macierzy A oraz b o zadanej wartosci uwarunkowania

condNumber = 20; % wartość uwarunkowania
N = [5,10,20,30]; % rozmiar macierzy
baseJacobi = zeros(size(N));
baseGS = zeros(size(N));
baseSOR = zeros(size(N));
jacobi = zeros(size(N));
gs = zeros(size(N));
sor = zeros(size(N));

% prekondycjoner Jacobiego

for i=1: length(N)

    A = rand(N(i), N(i));
    A = A + 10*eye(N(i));
    [U, S, V] = svd(A);
    S = diag(logspace(0, log10(condNumber), N(i)));
    A = U * S * V';

    % losowy wektor kolumnowy N na 1

    b = randn(N(i),1);
    E = 1e-10;

    [~, iteration,~] = algorytmy_iteracyjne(A, b, "Jacobie", E);

    base(i) = iteration;
    
    [A, b] = prekondycjonery(A,b, "Jacobi");
    
    [~, iteration,~] = algorytmy_iteracyjne(A, b, "Jacobie", E);
    
    jacobi(i) = iteration;
     
    [~, iteration,~] = algorytmy_iteracyjne(A,b, "Gauss-Seild",E);
    
    gs(i) = iteration;
    
    [~, iteration,~] = algorytmy_iteracyjne(A,b, "SOR",E);
    sor(i) = iteration ;


end
disp("Prekondycjoner Jacobiego")
base
jacobi
gs
sor


% Rysujemy wykres zbieznosci
figure
hold on
plot(base,jacobi, Color='r', DisplayName="Jacobi")
plot(base, gs, Color='b', DisplayName="Gauss-Seidl")
plot(base, sor, Color='m', DisplayName="SOR")
legend
title("Jacobiego")

% prekondycjoner Gauss-Seild

for i=1: length(N)

    A = rand(N(i), N(i));
    A = A + 10*eye(N(i));
    [U, S, V] = svd(A);
    S = diag(logspace(0, log10(condNumber), N(i)));
    A = U * S * V';

    % losowy wektor kolumnowy N na 1

    b = randn(N(i),1);
    E = 1e-10;

    [~, iteration,~] = algorytmy_iteracyjne(A, b, "Jacobie", E);

    base(i) = iteration;
    
    [A, b] = prekondycjonery(A,b, "Gauss-Seidl");
    
    [~, iteration,~] = algorytmy_iteracyjne(A, b, "Jacobie", E);
    
    jacobi(i) = iteration;
     
    [~, iteration,~] = algorytmy_iteracyjne(A,b, "Gauss-Seild",E);
    
    gs(i) = iteration;
    
    [~, iteration,~] = algorytmy_iteracyjne(A,b, "SOR",E);
    sor(i) = iteration ;


end
disp("Prekondycjoner Gauss-Seidl")
base
jacobi
gs
sor


% Rysujemy wykres czasu
figure
hold on
plot(base,jacobi, Color='r', DisplayName="Jacobi")
plot(base, gs, Color='b', DisplayName="Gauss-Seidl")
plot(base, sor, Color='m', DisplayName="SOR")
legend
title("Gauss-Seild")

% prekondycjoner SOR

for i=1: length(N)

    A = rand(N(i), N(i));
    A = A + 10*eye(N(i));
    [U, S, V] = svd(A);
    S = diag(logspace(0, log10(condNumber), N(i)));
    A = U * S * V';

    % losowy wektor kolumnowy N na 1

    b = randn(N(i),1);
    E = 1e-10;

    [~, iteration,~] = algorytmy_iteracyjne(A, b, "Jacobie", E);

    base(i) = iteration;
    
    [A, b] = prekondycjonery(A,b, "SOR");
    
    [~, iteration,~] = algorytmy_iteracyjne(A, b, "Jacobie", E);
    
    jacobi(i) = iteration;
     
    [~, iteration,~] = algorytmy_iteracyjne(A,b, "Gauss-Seild",E);
    
    gs(i) = iteration;
    
    [~, iteration,~] = algorytmy_iteracyjne(A,b, "SOR",E);
    sor(i) = iteration ;


end
disp("Prekondycjoner SOR")
base
jacobi
gs
sor


% Rysujemy wykres czasu
figure
hold on
plot(base,jacobi, Color='r', DisplayName="Jacobi")
plot(base, gs, Color='b', DisplayName="Gauss-Seidl")
plot(base, sor, Color='m', DisplayName="SOR")
legend
title("SOR")




