module Main where

  qsort :: Ord a => [a] -> [a]
  qsort [] = []
  qsort (x:xs) = qsort menores ++ [x] ++ qsort maiores
    where
      menores = [a | a <- xs, a <= x]
      maiorse = [b | b <- xs, b > x]

main :: IO ()
main = do
  putStrLn "hello world"
