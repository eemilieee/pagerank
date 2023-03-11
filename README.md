	Programul construit analizeaza un set de pagini web din punct de vedere al
relevantei in urma cautarilor efectuate de catre utilizatori (caracteristica
PageRank). Acesta este constituit din o serie de functii, dupa cum urmeaza:

	- "Iterative" -> calculeaza vectorul PageRank specific grafului paginilor
web date pe baza unei relatii de recurenta (R(t+1)=d*M*R(t)+(1-d)/N*v, unde M
este o matrice stochastica, d reprezinta probabilitatea ca o pagina sa fie
vizitata de catre utilizator, N este numarul de noduri al grafului iar v este
un vector coloana alcatuit exclusiv din valori de 1; M este transpusa
produsului dintre inversa matricei K (contine gradul extern al fiecarui nod din
graf pe diagonala principala) si matricea de adiacenta a grafului); procesul
repetitiv are loc pana cand se atinge aproximarea dorita a valorilor;

	- "Algebraic" -> calculeaza vectorul PageRank specific grafului paginilor
web date pe baza unei formule de calcul directe (rezolvarea ecuatiei matriceale
R = M*R*d + B, unde B este vectorul coloana format din elemente 
identice ((1-d)/N), d reprezinta probabilitatea ca o pagina sa fie
vizitata de catre utilizator, N este numarul de noduri al grafului iar M este
matricea stochastica);

	- "PageRank" -> calculeaza vectorul PageRank specific grafului paginilor
web date utilizand cele doua metode principale (iterativa si algebrica); apoi
sorteaza in ordine descrescatoare vectorul rezultat in urma aplicarii celui
de-al doilea algoritm si aplica functia membru asupa fiecarei valori pentru
determinarea gradului de apartenenta a fiecarei pagini la multimea celor
relevante;

	- "Apartenenta" -> calculeaza valoarea functiei membru intr-un punct;

	- "PR_inv" -> calculeaza inversa unei matrice pe baza factorizarii QR
a acesteia (R^-1 * Q^t, unde R^-1 se determina rezolvand sisteme superior
triunghiulare);

	- "Eroare" -> calculeaza eroarea de aproximare la un moment dat a valorilor
obtinute din vectorul PageRank si determina daca procesul de calcul ar trebui
sa continue sau nu (eroarea aflata este mai mica decat eroarea de calcul primita
ca parametru);

	- "GradExtern" -> calculeaza gradul extern al unui nod din graful asociat
setului de pagini web dat;

	- "GramSchmidt" -> reprezinta implementarea algorimtului optimizat de
factorizare QR a unei matrice, returnand matricele obtinute;

	- "SST" -> reprezinta modalitatea de rezolvare a unui sistem superior
triunghiular (Ax=b), returnand vectorul coloana solutie;

	- "Sort_Desc" -> efectueaza sortarea descrescatoare a vectorului PageRank
conform metodei interchimbarii.

	Programul a fost testat pas cu pas, in timpul implementarii fiecarei functii,
verificandu-se rezultatele cu cele din exemplele existente in cerinta.