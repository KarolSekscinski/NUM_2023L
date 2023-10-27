%Czyszcze konsole
clc
clear
close all
format compact

% funkcja z przykladu
f = @(x)(1/(1 + x.^10));

% Wykonuje interpolację i zapisuje wyniki
xn = linspace(-1, 1, 7);
P = LagInter(f, xn);
yn = polyval(P, xn);

% Generuje równo odległe punkty z podanego przedzialu
xr = linspace(xn(1), xn(end), 1001);
yr = polyval(P, xr);

% Narysuje wykresy
figure;
plot(xn, yn, 'ok', 'LineWidth', 2); 
hold on;
plot(xr, yr, 'k-', 'LineWidth', 2);

xlabel('x');
ylabel('f(x)');
title('Interpolacja wielomianowa (metoda Langrage''a)');
legend('f(x)', 'p(x)');


%Obliczam blad
xe = linspace(-1, 1, 1000);
ye = polyval(P, xe);
yt = [];
for i = 1:length(xe)
    yt(i) = f(xe(i));
end
avgerror = mean(abs(yt-ye));
disp("Sredni blad:");
disp(avgerror);




