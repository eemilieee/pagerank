% functia returneaza gradul extern al unui nod dintr-un graf
% (cate arce pornesc din nodul respectiv ->
% link-urile catre alte pagini web)
function grad = GradExtern(mat, nod)
    grad = 0;
    [n, ~] = size(mat);

    for i = 1:n
        if mat(nod, i) == 1
            grad = grad + 1;
        end
    end
end