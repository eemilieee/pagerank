function [R1, R2] = PageRank(nume, d, eps)
    % deschiderea fisierului cu numele dat ca parametru pentru citirea
    % datelor
    fin = fopen(nume,'r');

    % determinarea numelui fisierului in care vor fi scrise rezultatele si
    % crearea acestuia
    nume_nou = strcat(nume, ".out");
    fout = fopen(nume_nou, 'w');

    % deschiderea fisierului cu numele dat ca parametru pentru citirea
    % datelor (acestea sunt memorate in ordinea in care apar in cadrul unui
    % vector pentru extragerea facila a capetelor intervalului de referinta
    % necesar determinarii gradului de apartenenta a fiecarei pagini web
    % analizate)
    date = fscanf(fin, '%f', [1, Inf]);
    val1 = date(length(date) - 1);
    val2 = date(length(date));
    fclose(fin);
    
    % calculul si afisarea vectorului PageRank in fisier conform metodei
    % iterative
    R1 = Iterative(nume, d, eps);
    dim = length(R1);
    fprintf(fout, '%d\n', dim);
    fprintf(fout, '\n');
    for i = 1:dim
        fprintf(fout, '%.6f\n', R1(i));
    end
    fprintf(fout, '\n');

    % calculul si afisarea vectorului PageRank in fisier conform metodei
    % algebrice
    R2 = Algebraic(nume, d);
    dim = length(R2);
    for i = 1:dim
        fprintf(fout, '%.6f\n', R2(i));
    end
    fprintf(fout, '\n');

    % sortarea crescatoare a vectorului PageRank calculat utilizand metoda
    % algebrica
    [R2, ord] = Sort_Desc(R2);
    
    % afisarea gradelor de apartenenta a paginilor web analizate la
    % multimea celor considerate importante
    for i = 1:length(R2)
        fprintf(fout, '%d %d ', i, ord(i));
        fprintf(fout, '%.6f\n', Apartenenta(R2(i), val1, val2));
    end
    
    fclose(fout);
end
