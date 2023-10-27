function [y, iteration, error] = algorytmy_iteracyjne(A, b, alg, E)
% A - macierz glowna ukladu
% b - macierz wyrazow wolnych
% alg - rodzaj metody rozwiazywania aglorytmu iteracyjnego
% E - blad przy ktorym nastapi kryterium stopu

% Obliczanie macierzy dodatkowych L, D i U
D = diag(diag(A));

L = tril(A) - D;

U = triu(A) - D;

% Zmienne pomocnicze
err = 1;
i= 1;


% Metoda Jacobiego
if (alg == "Jacobie")
    x = ones(1, length(A));
    x = x.';
    InvD = inv(D);
    M = -InvD * (L+U);
    w = InvD * b;
    

    while (err > E)
        xi = M * x + w;
        err = (norm((b)-A*xi,2)/norm(x,2));
        x = xi;
        i = i + 1;


    end
   
    iteration = i;
    error = err;
y = x;
end

% Metoda Gaussa-Seidla
if (alg == "Gauss-Seild")
    x = ones(1, length(A));
    x = x.';
    M = -(D+L)\U;
    w = (D+L)\b;

    while (err > E)
        xi = M * x + w;
        err = (norm((b)-A*xi,2)/norm(x,2));
        x = xi;
        i = i + 1;
    end
    
    iteration = i;
    error = err;
    
y = x;

end

% Metoda SOR
if (alg == "SOR")
    x = ones(1, length(A));
    x = x.';
    omg = 1.12;
    M = (D+omg*L) \ ((1-omg)*D-omg*U);
    w = (D+omg*L) \ (omg * b);

    while (err > E)
        xi = M * x + w;
        err = (norm((b)-A*xi,2)/norm(x,2));
        x = xi;
        i = i + 1;
    end
    
    iteration = i;
    error = err;
    y = x;

end


end

