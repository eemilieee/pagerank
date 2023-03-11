% functia calculeaza inversa unei matrice folosind algoritmul Gram-Schmidt:
% descompunerea QR faciliteaza calculul datorita proprietatilor matricelor
% rezultate (Q - ortogonalitate (transpusa coincide cu inversa) si
% R - superior triunghiularitate), altfel ca A^-1 devine R^-1 * Q^t
function B = PR_Inv(A)
    [dim, ~] = size(A);  
    e = eye(dim);

    [Q, R] = GramSchmidt(A);

    % pentru calculul lui R^-1 se rezolva "dim" sisteme superior
    % triunghiulare, fiecare vector solutie reprezentand cate o coloana din
    % inversa rezultata
    % coloana termenilor liberi a fiecarui sistem reprezinta pe rand 
    % cate o coloana din matricea unitate

    for i = 1:dim
        Ri(1:dim, i) = SST(R, e(1:dim, i));
    end
    
    B = Ri*Q';
end
