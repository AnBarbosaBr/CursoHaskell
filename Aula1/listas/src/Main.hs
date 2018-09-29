module Main where

listas = [0..9]

idx n lista = head(drop n lista)


teste_idx n lista = idx n lista == lista !! n

pegar :: (Ord a, Num a) => a-> [a] -> [a]
pegar 0 _ = []
pegar n l = head l : pegar (n-1) (tail l)

main :: IO ()
main = do
  putStrLn "hello world"
