%czyszcze konsole
clc 
clear


% funkcje f(x)
f1 = @(x) (1./(1+25*x.^2));
f2 = @(x) (1./(1+x.^10));
f3 = @(x) (sin(2*x).*exp(-x));


% liczba punktów interpolacji
n = 10;

% węzły Czebyszewa
x_cheb = cos(pi*(0:n)/(n));

% wartości funkcji w węzłach Czebyszewa
y1_cheb = f1(x_cheb);
y2_cheb = f2(x_cheb);
y3_cheb = f3(x_cheb);


% punkty do wykresu
x_plot = linspace(-1,1,100);
y1_plot = f1(x_plot);
y2_plot = f2(x_plot);
y3_plot = f3(x_plot);

% przygotowanie tabeli wynikow
table_results = cell(8+1,2);
table_results{1,1} = 'n';
table_results{1,2} = 'ΔFn(x)';

table_results_2 = cell(8+1,2);
table_results_2{1,1} = 'n';
table_results_2{1,2} = 'ΔFn(x)';



% wykres dla funkcji f1  
figure();
sgtitle('Interpolacja Newtona f(x) (1./(1+25*x.^2))'); 
i = 1;
% interpolacja dla różnych stopni wielomianów interpolacyjnych
for k = [n,2*n, 3*n, 4*n, 5*n, 6*n, 7*n, 8*n]
    x = cos(pi*(0:k)/k);
    y1 = f1(x);
    
    
    % interpolacja
    p1 = NewInter(x, y1, x_plot);
    
    
    subplot(2, 4, i);
    plot(x_plot, y1_plot, 'k-', x_plot, p1, 'r-', x_cheb, y1_cheb, 'bo', 'LineWidth', 1.5);
    legend('f(x)', ['n=' num2str(k)], 'Czebyszew', 'Location', 'south');
    xlabel('x');
    ylabel('y');

    i = i + 1;
end

% wykres dla funkcji f2 
figure();
sgtitle('Interpolacja Newtona f(x) (1./(1+x.^10))');
i = 1;
% interpolacja dla różnych stopni wielomianów interpolacyjnych
for k = [n,2*n, 3*n, 4*n, 5*n, 6*n, 7*n, 8*n]
    x = cos(pi*(0:k)/k);
    y2 = f2(x);
   
    % interpolacja
    p2 = NewInter(x, y2, x_plot);
        
    subplot(2, 4, i);
    plot(x_plot, y2_plot, 'k-', x_plot, p2, 'g-', x_cheb, y2_cheb, 'bo', 'LineWidth', 1.5);
    legend('f(x)', ['n=' num2str(k)], 'Czebyszew', 'Location', 'South');
   
    xlabel('x');
    ylabel('y');
    i = i + 1;
end

% wykres dla funkcji f3 
figure();
sgtitle('Interpolacja Newtona f(x) (sin(2*x).*exp(x))'); 
i = 1;
% interpolacja dla różnych stopni wielomianów interpolacyjnych
for k = [n,2*n, 3*n, 4*n, 5*n, 6*n, 7*n, 8*n]
    x = cos(pi*(0:k)/k);
    y3 = f3(x);
    
    % interpolacja
    p3 = NewInter(x, y3, x_plot);
    
    subplot(2, 4, i);
    plot(x_plot, y3_plot, 'k-', x_plot, p3, 'b-', x_cheb, y3_cheb, 'bo', 'LineWidth', 1.5);
    legend('f(x)', ['n=' num2str(k)], 'Czebyszew', 'Location', 'South');
   
    xlabel('x');
    ylabel('y');
    i = i + 1;
end

 for a = [n,2*n, 3*n, 4*n, 5*n, 6*n, 7*n, 8*n]
 
 
 % przygotowanie tabeli wynikow
 table_results = cell(3 , 2);
 table_results{1,1} = 'Funkcja';
 table_results{1,2} = 'ΔFn(x)';
 
 table_results_2 = cell(3 , 2);
 table_results_2{1,1} = 'Funkcja';
 table_results_2{1,2} = 'ΔFn(x)';
 
 
 % maksymalny blad bezwgledny 
 max_error_cheb_abs1 = max(abs(p1 - y1_plot));
 max_error_cheb_abs2 = max(abs(p2 - y2_plot));
 max_error_cheb_abs3 = max(abs(p3 - y3_plot));
  
 % sredni blad bezwgledny
 mean_error_cheb_abs1 = max_error_cheb_abs1 / a;
 mean_error_cheb_abs2 = max_error_cheb_abs2 / a;
 mean_error_cheb_abs3 = max_error_cheb_abs3 / a;
 
 %dodawanie wynikow do tabeli
 table_results{2,1} = '(1./(1+25*x.^2))';
 table_results{2,2} = max_error_cheb_abs1;
 table_results{3,1} = '(1./(1+x.^10))';
 table_results{3,2} = max_error_cheb_abs2;
 table_results{4,1} = '(sin(2*x).*exp(-x))';
 table_results{4,2} = max_error_cheb_abs3;
 
 table_results_2{2,1} = '(1./(1+25*x.^2))';
 table_results_2{2,2} = mean_error_cheb_abs1;
 table_results_2{3,1} = '(1./(1+x.^10))';
 table_results_2{3,2} = mean_error_cheb_abs2;
 table_results_2{4,1} = '(sin(2*x).*exp(-x))';
 table_results_2{4,2} = mean_error_cheb_abs3;
 
 % wyświetlanie tabeli
 
 table_results_title = sprintf("Tabela wyników maksymalnego błędu bezwzględnego n = %d:", a);
 disp(table_results_title);
 disp("|         Funkcja         |      ΔFn(x)     |")
 for i = 2: size(table_results)
     row = table_results(i, :);
     line = sprintf("|   %20s  |   %0.4f   |", row{1}, row{2});
     disp(line);
 end
 
 % wyświetlanie tabeli
 table_results_title_2 = sprintf("Tabela wyników sredniego błędu bezwzględnego n = %d:", a);
 disp(table_results_title_2);
 disp("|         Funkcja         |      ΔFn(x)     |")
 for i = 2: size(table_results_2)
     row = table_results_2(i, :);
     line = sprintf("|   %20s  |   %0.4f    |", row{1}, row{2});
     disp(line);
 end
 end



