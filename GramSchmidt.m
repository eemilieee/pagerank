% functia realizeaza descompunerea QR a matricei transmise ca parametru
% prin intermediul algoritmului Gram-Schmidt optimizat
function [Q, R] = GramSchmidt(A)
    [m, n] = size(A);
    R = zeros(n);
    Q = zeros(n);

    for i = 1:n
        a = A(1:m, i);

        R(i, i) = sqrt(a' * a);

        Q(1:n, i) = a/R(i, i);

        for j = i+1:n
            q = Q(1:n, i);

            R(i, j) = q' * A(1:m, j);
            
            A(1:m, j) = A(1:m, j) - q * R(i, j);
        end
    end
end