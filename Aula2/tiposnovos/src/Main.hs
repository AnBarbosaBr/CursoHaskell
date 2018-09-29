module Main where

  -- Declaracao de tipo 
-- type é semelhante a typedef
type Associacao k v = [(k, v)]
type Coordenada = (Int, Int)
{- Exemplo de função usando type Associacao -}
find :: Eq k => k -> Associacao k v -> v
find k dicionario = head [v | (kArmazenado, v) <- dicionario, k == kArmazenado]
--}

-- data 
-- data: tipo soma (or) é semelhante a um enum. É validado pelo compilador
data Direcao = Norte | Sul | Leste | Oeste

-- Funcoes que usam data tipo soma, precisam prever todos os casos
moveNaDirecao :: Direcao -> Coordenada -> Coordenada
moveNaDirecao Norte (x, y) = (x, y+1)
moveNaDirecao Sul (x, y) = (x, y-1)
moveNaDirecao Leste (x, y) = (x+1, y)
moveNaDirecao Oeste (x, y) = (x-1, y)
-- caso haja algum caso que "não importe", use o operador don't care(_)
-- ex moveNaDirecao _ (x, y) = (x, y)

--  data: tipo produto (and)
data Ponto = Ponto Double Double 
--   Ponto = nome do tipo
--           Ponto = Construtor - nome arbitrário, poderia ser qualquer coisa
--                 Double Double = tipos que ele encapsula
data PontoImprimivel = PontoImprimivel Double Double deriving (Show)
--                                                   deriving = Derivado de outra classe
--                                                   Show = Tipo imprimivel

distanciaEntre:: Ponto -> Ponto -> Double
distanciaEntre (Ponto x y) (Ponto x2 y2) = sqrt 
                                              $ (x-x2)^2 + (y-y2)^2

-- data: podemos criar tipos soma e produto:
data Forma = Circunferencia Ponto Double | Retangulo Ponto Double Double

area :: Forma -> Double
area (Circunferencia posicao raio) = pi*raio^2
area (Retangulo posicao largura altura) = largura*altura

-- Podemos usar record types:
data Contato = Contato { nome :: String, telefone :: String} deriving Show

novoContato = Contato "Maria" "9990-9990"
atualizaContato :: Contato -> String -> Contato
atualizaContato c t = c {telefone = t}

formataContato:: Contato -> String
formataContato c  = (nome c) ++ " - " ++ (telefone c)

-- Tipo parametrizado
data Talvez a = Nada | Apenas a
-- talvez a divisao retorne um Int
safeDiv:: Int -> Int ->Talvez Int
safeDiv _ 0 = Nada
safeDiv m n = Apenas (m `div` n)

safeHead :: [a] -> Talvez a
safeHead xs = Apenas (head xs)

divComErro :: Int->Int -> Int
divComErro m n = case (safeDiv m n ) of
                                    Nada -> error "divisao por 0"
                                    Apenas x -> x

-- NEWTYPE faz um sinonimo que é reconhecido como novo tipo
newtype MinhaString = S [char]

-- funcoes que aceitem MinhaString não aceitaram strings, mesmo que [char] === string.



-- TIPOS RECURSIVOS
data Tree a = Leaf a | Node (Tree a) a ( Tree a)
contem :: Eq a => Tree a -> a -> Bool
contem (Leaf y) x = x == y2contem (Node l y r) x = x == y || l `contem` x || r `contem` x

-- CLASSESE DE TIPO




main :: IO ()
main = do
  putStrLn "hello world"
