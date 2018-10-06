module Main where

-- FUNCTOR

-- Tipo parametrizado
data MaybeValue a = Nada | JustValue a deriving (Show)
-- talvez a divisao retorne um Int
safeDiv:: Int -> Int -> MaybeValue Int
safeDiv _ 0 = Nada
safeDiv m n = JustValue (m `div` n)


-- Não podemos fazer isso:
--        3 + (safeDiv(4/2))
-- que equivale a:
--        3 + JustValue 2
-- para fazer uma operação semelhante, criamos um Functor
instance Functor MaybeValue where
  fmap f Nada = Nada
  fmap f (JustValue x) = JustValue (f x)

-- Agora é possível fazer
--       fmap (+3) (JustValue 2)     lembre que Just é uma das possibilidades de Maybe
-- e obtemos
--       JustValue 5
-- Note que:  fmap (+3) Nada  = Nada

-- APPLICATIVE -> Ou, como fazer Just 3 + Just 2
instance Applicative MaybeValue where
  pure                = JustValue
  JustValue f  <*> x  = fmap f x
  Nada  <*> _m        = Nada
  -- liftA2 f (JustValue x) (JustValue y) = JustValue (f x y)
  -- lifA2 _ _ _ = Nada

  JustValue _m1 *> m2      = m2
  Nada  *> _m2     = Nada
-- Agora podemos fazer a soma da seguinte forma:
-- JustValue (+2) <*> JustValue2
-- fmap (+) (JustValue 3) <*> (JustValue 2)
-- JustValue (+) <*> JustValue 3 <*> (JustValue 2)
-- pure (+) *> JustValue 3 <*> JustValue 2


  -- MONAD -> Ou, como fazer safeDiv >>= safeLog
instance  Monad MaybeValue  where
  (JustValue x) >>= k   = k x
  Nada >>= _            = Nada
  (>>)                  = (*>)
  fail _                = Nada




main :: IO ()
main = do
  putStrLn "hello world"
