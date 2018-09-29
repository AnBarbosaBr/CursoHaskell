Criar um novo projeto

# Piasa / Piazza

# Criar um novo Projeto
stack new pjname simple
cd pjname
stack setup
stack build

# Executar um stack
stack exec pjname


# Notas
Ao utilizar `mod`, repare que o "acento" é uma crase(`), não um apóstrofo(').

Pipes:
    sum (map (^2) (filter even ns))
    equivale a 
    sum
    $ map (^2)
    $ filter even ns
# Funcoes uteis
take int lista -> Pega os primeiros int termos de uma lista.

# Pontos a reforçar
Sintaxe das ListComprehension.
Ex: dada lista (x:xs), onde xs é uma lista
> Como eu crio uma lista contendo apenas os valores menores que n?
    menores n (x:xs) = [ a | a<- xs, a <= x]]
    
    menores n lista = filter (< n) lista