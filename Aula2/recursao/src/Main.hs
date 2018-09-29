module Main where

-- Fatorial
fatorial :: Integer -> Integer  
fatorial 0 = 1
fatorial 1 = 1
fatorial n = n * fatorial (n-1)

fatorialComAcumulador :: Integer, Integer -> Integer
fatorialComAcumulador 0 acumulado = acumulado
fatorialComAcumulador n acumulado = fatorialComAcumulador (n-1) (n*acumulado)

fatorialCauda :: Integer, -> Integer
fatorialCauda 0 = 1
fatorialCauda 1 = 1
fatorialCauda n = auxiliarFatorialCauda n 1
  where auxiliarFatorialCauda 0 a = a
  auxiliarFatorialCauda numero acumulador = auxiliarFatorialCauda (numero-1) (acumulador*numero)



main :: IO ()
main = do
  putStrLn "hello world"
