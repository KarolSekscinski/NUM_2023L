function P = LagInter(func, points)


%   points - punkty 
%   P - współczynniki wielomianu wynikowego
    len = length(points);
     for i = 1:len
         pc = points;
         pc(i) = [];
         dzielnik = 1;
         for j = 1:length(pc)
             dzielnik = dzielnik * (points(i)-pc(j));
         end
         X = poly(pc) / dzielnik;
         P(i, :) = func(points(i)) .* X;
     end
     P = sum(P);
 end