% Czyszcze konsole
clc
clear
close all
format compact
warning('off','all')

% Dane
% Funkcja 1
f1 = @(x,y) 3*x*y^2;
y01 = 0.5;
range1 = [1, 1.5];
F1 = @(x) -1./(1.5*x.^2-3.5);

% Funkcja 2
f2 = @(x, y) -y * cos(x);
y02(1)=5;
range2 = [6, 20];
F2 = @(x) 5.*exp(-sin(x));

% Funkcja 3
f3 = @(x,y) x.^2 - 4 * x + 3 - 6 * exp(x);
y03 = 8;
range3 = [10, 15];
F3 = @(x) 1/3 * x.^3 - 2 * x.^2 + 3*x - 6* exp(x) + 14;

% Funkcja 4
f4 = @(x,y) 2*y + 4 * cos(x) - 8 * sin(x);
y04 = 3;
range4 = [0, 10];
F4 = @(x) 3 * exp(2*x) + 4 * sin(x);


% Przygotowanie macierzy 
f = {f1, f2, f3, f4};
y0 = [y01, y02, y03, y04];
range = {range1, range2, range3, range4};
F = {F1, F2, F3, F4};


for h = [0.001, 0.01, 0.1]
    figure;
    sgtitle(['h = ', num2str(h)])
    % Rzad pierwszy metody
    for i = 1:4
        [x, y] = ode_rk(f{i}, y0(i), range{i}, h,1);
        subplot(4, 4, i)
        plot(x, y, 'r')
        hold on
        fplot(F{i}, range{i}, 'b')
        newTitle = func2str(f{i});
        title(newTitle(7:end))
        legend('Runge-Knutt', 'Funkcja')
        hold off
    end
    % Rzad drugi metody
    for i = 1:4
        [x, y] = ode_rk(f{i}, y0(i), range{i}, h,2);
        subplot(4, 4, i+4)
        plot(x, y, 'r')
        hold on
        fplot(F{i}, range{i}, 'b')
        newTitle = func2str(f{i});
        title(newTitle(7:end))
        legend('Runge-Knutt', 'Funkcja')
        hold off
    end
    % Rzad trzeci metody
    for i = 1:4
        [x, y] = ode_rk(f{i}, y0(i), range{i}, h,3);
        subplot(4, 4, i+8)
        plot(x, y, 'r')
        hold on
        fplot(F{i}, range{i}, 'b')
        newTitle = func2str(f{i});
        title(newTitle(7:end))
        legend('Runge-Knutt', 'Funkcja')
        hold off
    end
    % Rzad czwarty metody
    for i = 1:4
        [x, y] = ode_rk(f{i}, y0(i), range{i}, h,4);
        subplot(4, 4, i+12)
        plot(x, y, 'r')
        hold on
        fplot(F{i}, range{i}, 'b')
        newTitle = func2str(f{i});
        title(newTitle(7:end))
        legend('Runge-Knutt', 'Funkcja')
        hold off
    end
end
