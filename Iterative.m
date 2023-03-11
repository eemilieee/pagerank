function R = Iterative(nume, d, eps)
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
    
    % initializarea vectorilor coloana necesari calculului
    % vectorului PageRank (conform relatiei de recurenta):

    % pasul precedent
    pr_t1 = zeros(nr_noduri, 1);
    pr_t1(1:nr_noduri) = 1/nr_noduri;

    % pasul curent
    pr_t2 = zeros(nr_noduri, 1);

    % initializarea vectorlui coloana alcatuit din valori de 1
    % (apartinand formulei)
    col(1:nr_noduri, 1) = 1;

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

    % calculul vectorului PageRank conform relatiei de recurenta pana cand
    % se obtine aproximarea dorita a valorilor determinate

    ok = 1;
    while ok == 1
        
        pr_t2 = d*m*pr_t1 + ((1-d)/nr_noduri)*col;

        if Eroare(pr_t1, pr_t2, eps) == 0
            ok = 0;
        else
            pr_t1 = pr_t2;
        end
    end

    R = pr_t1;
    
    fclose(fin);
end
