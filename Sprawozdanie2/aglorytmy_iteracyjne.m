function y = algorytmy_iteracyjne(A, b, alg, E)
% A - macierz glowna ukladu
% b - macierz wyrazow wolnych
% alg - rodzaj metody rozwiazywania aglorytmu iteracyjnego
% E - blad przy ktorym nastapi kryterium stopu

% Obliczanie macierzy dodatkowych L, D i U
D = diag(diag(A))

L = tril(A) - D

U = triu(A) - D


%Metoda Jacobiego
if (alg == "Jacobie")
    x0 = zeros(length(A));
    InvD = inv(D);
    M = -InvD * (L+U);
    w = InvD * b;
    err = 0;
    
    for x = x0 : (err < E)
        x = x.';
        xi = M * x + w;

        err = (norm(b-A*xi,2)/norm(x,2));
        x = xi;
    
    end


end

% Metoda Gaussa-Seidla
if (alg == "Gauss-Seild")



end

% Metoda SOR
if (alg == "SOR")


end


end

