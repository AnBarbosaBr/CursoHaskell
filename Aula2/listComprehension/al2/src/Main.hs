module Main where

  -- DIVISORES
  divisores :: Int-> [Int]
  divisores n = [x | x <- [1..n], n `mod` x == 0]
  
  -- PRIMOS
  primo :: Int -> Bool
  primo n = (divisores n) == [1,n]
  
  todosPrimosSimples:: Int-> [Int]
  todosPrimosSimples n = [x | x <- [1..n], primo x]

  todosPrimosEficiente::[Int]
  todosPrimosEficiente = 
    2: -- Uma lista com '2' contatenada com
    3: -- com uma lista com '3' contatenada com 
    -- Uma lista formada pelos numeros 6k+1 e 6k-1
    [n | k <- [1..], n<-[6*k-1, 6*k+1], primo n]

  -- FIBONACCI
  fibs :: [Integer]
  fibs = 1:(zipWith + fibs (0:fibs)) 


  main :: IO ()
  main = do
    putStrLn "Atividade2"
    --putStrLn "Divisores de 5"
    {-
    print(divisores 15)
    print(take 100 todosPrimosEficiente)
    -}
    print(take 10 fibs)