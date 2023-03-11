% functia determina vectorul solutie al unui sistem superior triunghiular
% rezolvat iterativ
function [X] = SST(A, B)
    dim = size(A);
    n = dim(1, 1);

    for i = n:-1:1
       s = 0;

       for j = i+1:n
           s = s + A(i, j) * X(j);
       end

       X(i) = (B(i, 1) - s) * 1/A(i, i);
    end
end