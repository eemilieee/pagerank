% functia determina daca a fost atinsa aproximarea corespunzatoare (eps)
% in urma calculului valorilor continute de vectorii v1 si v2
% aceasta returneaza 1 in cazul in care calculul continua si 0 altfel
function continui = Eroare(v1, v2, eps)
    ok = 1;
    max = 0;

    for i = 1:length(v1)
        if max < abs(v2(i) - v1(i))
            max = abs(v2(i) - v1(i));
        end
    end

    if max < eps
        ok = 0;
    end
    
    continui = ok;
end