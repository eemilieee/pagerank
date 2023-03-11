% functia sorteaza descrescator vectorul dat ca parametru conform metodei
% sortarii prin interschimbare
% se returneaza de asemenea vectorul indicilor de ordine a valorilor pentru
% a putea realiza conexiunea dintre nod si gradul sau de apartenenta
function [v, ord] = Sort_Desc(v)

    ord(1:length(v)) = 1:length(v);

    for i = 1:length(v)
        for j = i+1:length(v)
            
            if v(i) < v(j) || v(i) - v(j) < 1e-16 % cazul de egalitate luand in calcul eroarea zecimalelor
                aux = v(i);
                v(i) = v(j);
                v(j) = aux;

                aux = ord(i);
                ord(i) = ord(j);
                ord(j) = aux;
            end
        end
    end
end