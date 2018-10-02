module Chapter18 where

import Control.Monad (join)

-- p 782
-- fmap, join
-- Monad m => (a -> m b) -> m a -> m b
-- a ~ Char
-- m ~ []
-- b ~ Char
-- (Char -> [Char]) -> [Char] -> [Char]
-- bind (\a -> [a]) -> "hello"
bind :: Monad m => (a -> m b) -> m a -> m b
bind f x = join $ fmap f x

-- fmap :: (a -> b)     -> f a     -> f b
-- bind :: (a -> m b)   -> m a     -> m (m b)

bindingAndSequencing :: IO ()
bindingAndSequencing =
  putStrLn "hello what is your name? " >>
  putStr "> " >>
  getLine >>=
  \n ->
    putStrLn $ "hi there, " ++ n ++ "!"

twiceWhenEven :: [Integer] -> [Integer]
twiceWhenEven xs = do
  x <- xs -- bind an individual Integer out of the list to `x`
  if even x
     then [x*x, x*x]
     else [x*x]

twiceWhenEven' :: [Integer] -> [Integer]
twiceWhenEven' xs = do
  x <- xs
  if even x
     then [x*x, x*x]
     else []

--
--
--
--- p 805

type Founded = Int -- years ago
type Coders =  Int -- number of programmers

data SoftwareShop =
  Shop {
    founded :: Founded,
    programmers :: Coders
  } deriving (Eq, Show)

data FoundedError =
    NegativeYears Founded
  | TooManyYears Founded

  | NegativeCoders Coders
  | TooManyCoders Coders

  | TooManyCodersForYears Founded Coders
  deriving (Eq, Show)

validateFounded :: Int -> Either FoundedError Founded
validateFounded n
  | n < 0        = Left $ NegativeYears n
  | n > 500      = Left $ TooManyYears n
  | otherwise    = Right n

validateCoders :: Int -> Either FoundedError Coders
validateCoders n
  | n < 0        = Left $ NegativeCoders n
  | n > 5000     = Left $ TooManyCoders n
  | otherwise    = Right n

mkSoftware :: Int -> Int -> Either FoundedError SoftwareShop
mkSoftware years coders = do
  founded      <- validateFounded years
  programmers  <- validateCoders coders
  if programmers > div founded 10
     then Left $
       TooManyCodersForYears founded programmers
     else Right $ Shop founded programmers

----

-- p. 808
-- implement the Either Monad
-- (hint: we should look back on the previous chapters for some of this,
-- I remember there's some trickiness around applying the two arguments
-- for the Sum datatype)

data Sum a b = First a | Second b deriving (Eq, Show)

instance Functor (Sum a) where
  fmap _ (First a)  = First a
  fmap f (Second b) = Second $ f b

-- instance Applicative (Sum a) where
--   pure = Second
--   _ <*> (First a)  = First a
--   (First a) <*> _  = First a
--   (Second f) <*> (Second a) = Second $ f a

-- or:
instance Applicative (Sum a) where
  pure = Second
  First y <*> _  = First y
  Second f <*> x = fmap f x

instance Monad (Sum a) where
  return = pure
  (First a) >>= _  = First a
  (Second a) >>= f = f a

oddIsBad :: Int -> Either Int Int
oddIsBad x =
  case even x of
    True  -> Right x
    False -> Left x

bigIsBad :: Int -> Either Int Int
bigIsBad x
  | x > 100   = Left x
  | otherwise = Right x

makeGoodNumber :: Int -> Either Int Int
makeGoodNumber n = do
  validateOddness <- oddIsBad n
  validateBigness <- bigIsBad validateOddness
  return validateBigness

