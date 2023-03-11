% calculul gradului de apartenenta al unui nod (pagina web) la multimea
% paginilor importante bazat pe functia membru
function y = Apartenenta(x, val1, val2)
    % calculul parametrilor functiei membru astfel incat aceasta sa fie
    % continua pe ramuri

    a = 1 / (val2 - val1);
    b = val1 / (val1 - val2);

    if x >= val1 && x <= val2 
        y = a*x + b;
    end

    if x < val1
        y = 0;
    end
    
    if x > val2
        y = 1;
    end
end
	