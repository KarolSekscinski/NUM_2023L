clc
clear

f = @(x)(0.2*x.*exp(x)-0.4*exp(x)); % funkcja podcałkowa
a = -1; % dolna granica całkowania
b = 3; % górna granica całkowania
n =  12:12:240; % liczba podprzedzialow
% Przygotowanie macierzy wynikowych dla wszystkich metod calkowania
errorsTrapezoidal = zeros(size(n)); 
errorsSimpson1_3 = zeros(size(n)); 
errorsSimpson3_8 = zeros(size(n)); 
errorsBool = zeros(size(n)); 
hTable = zeros(size(n)); % wielkosc kroku

for i = 1:length(n)
    ni = n(i);
    h = (b - a) / ni;
    hTable(i) = h;

    % Obliczanie wartości całek dla każdej z metod
    integralTrapezoidal = trapezy(f, a, b, ni);
    integralSimpson1_3 = simpson1_3(f, a, b, ni);
    integralSimpson3_8 = Simpson3_8(f, a, b, ni);
    integralBool = Bool(f, a, b, ni);
        
    % Obliczanie błędów dla każdej z metod
    exactValue = integral(f,a,b);  % Dokładna wartość całki
    errorsTrapezoidal(i) = abs(integralTrapezoidal - exactValue);
    errorsSimpson1_3(i) = abs(integralSimpson1_3 - exactValue);
    errorsSimpson3_8(i) = abs(integralSimpson3_8 - exactValue);
    errorsBool(i) = abs(integralBool - exactValue);

end
% Wykres błędów w zależności od wielkości kroku
loglog(hTable, errorsTrapezoidal, '-r', 'LineWidth', 1.5);
hold on;
loglog(hTable, errorsSimpson1_3, '-g', 'LineWidth', 1.5);
loglog(hTable, errorsSimpson3_8, '-b', 'LineWidth', 1.5);
loglog(hTable, errorsBool, '-m', 'LineWidth', 1.5);
  
xlabel('Wielkosc kroku');
ylabel('Błąd');
title('Porównanie błędów różnych metod numerycznych');
legend('Metoda trapezów', 'Metoda Simpsona 1/3', 'Metoda Simpsona 3/8', 'Metoda Boola');
grid on;
hold off;
