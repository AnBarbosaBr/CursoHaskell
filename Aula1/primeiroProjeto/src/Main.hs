module Main where

dobra x = x + x
quadruplica x = dobra (dobra x)
fatorial n = product [1..n]

{- A expressão abaixo significa que a expressão recebe três parâmetros 
de tipo a. Cada um desses parametros é Ord e Floating.
  Ord -> Pode ser ordenado por >, <, =
  Floating -> Número de ponto flutuante -}
raiz2Grau :: (Ord a, Floating a) => a -> a -> a -> (a, a)
raiz2Grau a b c 
  | a == 0    = error "Função de primeiro grau."
  | delta < 0 = error "Raizes negatias"
  | otherwise = (x1, x2) 
  where
    x1 = ((-b) + sqDelta) / (2*a)
    x2 = ((-b) - sqDelta) / (2*a)
    sqDelta = sqrt delta
    delta = b^2 - (4*a*c)
    
 
-- Pattern Matching
mul :: (Eq a, Num a) => a -> a -> a
mul 0 _ = 0 -- não importa o valor de _, o resultado será 0
mul _ 0 = 0 -- não importa o valor de _, o resultado será 0
mul x 1 = x
mul 1 y = y
mul x y = x * y



(:+) :: Num -> Num -> Num
(:+) x y = abs x + y

main :: IO ()
main = do
  putStrLn "hello world"
