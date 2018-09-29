module Main where


  divisores :: Int-> [Int]
  divisores n = [x | x <- [1..n], n `mod` x == 0]
  
  primo :: int -> Bool
  primo n = divisores n == [1,n]
  
  todosPrimos::[Int]
  todosPrimos n = [x | x <- [1..n], primo x]
  main :: IO ()
  main = do
    putStrLn "Atividade2"
    putStrLn "Divisores de 5"
    print(divisores 15)
  