%Czyszcze konsole
clc
clear
close all
format compact

% Generacja macierzy A oraz b o zadanej wartosci uwarunkowania

condNumber = [5,10,15,20,25,30]; % wartość uwarunkowania
N = 10; % rozmiar macierzy

condNumberAfterJacobie = zeros(1,length(condNumber));
condNumberAfterGS = zeros(1,length(condNumber));
condNumberAfterSOR = zeros(1,length(condNumber));

for i = 1: length(condNumber)
    A = rand(N);
    A = A + 10*eye(N);
    [U, S, V] = svd(A);
    S = diag(logspace(0, log10(condNumber(i)), N));
    A = U * S * V'

    b = randn(N,1);

    [c,d] = prekondycjonery(A,b, "Jacobi");
    condNumberAfterJacobie(i) = cond(c);
    [c,d] = prekondycjonery(A,b, "Gauss-Seidl");
    condNumberAfterGS(i) = cond(c);
    [c,d] = prekondycjonery(A,b, "SOR");
    condNumberAfterSOR(i) = cond(c);



end


figure
hold on
plot(condNumber, condNumberAfterJacobie, "r")
plot(condNumber, condNumber, "--", Color="b")
title("Jacobie")

figure
hold on
plot(condNumber, condNumberAfterGS, "r")
plot(condNumber, condNumber, "--", Color="b")
title("Gauss-Seidl")

figure
hold on
plot(condNumber, condNumberAfterSOR, "r")
plot(condNumber, condNumber, "--", Color="b")
title("SOR")




    


