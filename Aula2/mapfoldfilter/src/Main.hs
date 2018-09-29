module Main where

dobra :: Num a => a -> a
dobra x = 2*x

somaUm :: Num a => a -> a
somaUm x = x + 1


main :: IO ()
main = do
  putStrLn "Fold, Map, Filter, Function Composition"
  print(map somaUm $ map dobra [1..10])
  -- Também podemos usar o operador (.), que é uma função de composição de funcoes -> f.g x = f( g(x) )
  let lista = map (somaUm . dobra) [1..10]
  print(lista) 
