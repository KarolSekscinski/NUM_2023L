function [A,b] = prekondycjonery(A, b, alg)

D = diag(diag(A));

L = tril(A) - D;

U = triu(A) - D;

if (alg == "Jacobi")

    M = D;
    A = M \ A;
    b = M \ b;
end

if (alg == "Gauss-Seidl")

    M = D + L;
    A = M \ A;
    b = M \ b;
end

if (alg == "SOR")

    omg = 1.2;
    M = D + omg * L;
    A = M \ A;
    b = M \ b;
end