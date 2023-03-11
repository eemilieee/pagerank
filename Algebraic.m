function R = Algebraic(nume, d)
    % deschiderea fisierului cu numele dat ca parametru pentru citirea
    % datelor
    fin = fopen(nume,'r');
    dim = fscanf(fin, '%d', 1);

    % determinarea numarului de noduri al grafului
    nr_noduri = dim(1,1);
   
    % initializarea matricei de adiacenta
    mat = zeros(nr_noduri);

    % initializarea matricei K (apartinand formulei)
    k = zeros(nr_noduri);

    % initializarea vectorlui coloana necesar determinarii vectorului
    % PageRank
    b(1:nr_noduri, 1) = (1 - d)/nr_noduri;
  
    % construirea matricei de adiacenta in urma citirii listei de adiacenta
    % a grafului determinat de paginile web
    for i = 0:nr_noduri
        linie = fgetl(fin);
        cuvinte = strsplit(linie);
        vecini = str2num(char(cuvinte))';
        if length(vecini) ~= 2
            for j = 3:length(vecini)
                mat(vecini(1,1),vecini(1,j)) = 1;
            end
        end
    end

    for i = 1:nr_noduri
        mat(i,i) = 0;
    end

    % construirea matricei K (pentru calculul lui M)
    for i = 1:nr_noduri
        k(i, i) = GradExtern(mat, i);
    end
    
    k = PR_Inv(k);

    % calculul matricei M (apartinand formulei)
    m = (k * mat)';
    
    % determinarea vectorului PageRank
    % (rezolvarea ecuatiei R = M*R*d + B)
    in = eye(nr_noduri);

    R = PR_Inv(in-m*d) * b;

    fclose(fin);
end
