function p = NewInter(xn, yn, x)

% xn - wektor wspolrzednych x wezlow interpolacyjnych
% yn - wektor wspolrzednych y wezlow interpolacyjnych
% xx - wektor wartosci x, dla ktorych nalezy obliczyc wartosci p

% wyznaczenie wspolczynnikow interpolacyjnych
    
    w = zeros(length(xn), length(xn));
    w(:,1) = yn';
    for j = 2 : length(xn)
        for i = j : length(xn)
            w(i,j) = (w(i, j-1) - w(i-1,j-1)) / (xn(i) - xn(i-j+1));
        end
    end

%wyznaczenie wartosci p dla kazdego elementu x
    p = zeros(size(x));
    for k = 1 : length(x)
        p(k) = w(1,1);
        for j = 2 : length(xn)
            temp = 1;
            for i = 1 : j - 1
                temp = temp.*(x(k) - xn(i));
            end
            p(k) = p(k) + w(j,j)*temp;
        end
    end

end
