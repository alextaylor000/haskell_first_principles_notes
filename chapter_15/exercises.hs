module Chap15Ex where

import Data.Monoid

-- a review of record types
data Person = Person' { name :: String, age :: Int, email :: String }
-- > let alex = Person' { name = "Alex", age = 2, email = "a@b.com" }
-- > email alex
-- "a@b.com"
--

newtype Mem s a =
  Mem {
  -- this is actually a state monad: s -> (a, s)
  -- (also: data type 'St')
      runMem :: s -> (a, s)
  }


-- this doesn't compile... yet
instance Monoid a => Monoid (Mem s a) where
  mempty  = Mem $ \s -> (mempty, s)
  mappend (Mem f) (Mem f') =
    Mem $ \s -> ( (fst (f s)) <> (fst (f' s))  , (snd (f (snd (f' s))))  )


f' :: Mem Integer String
f' = Mem $ \s -> ("hi", s + 1)

main = do
  let rmzero = runMem mempty 0
      rmleft = runMem (f' <> mempty) 0
      rmright = runMem (mempty <> f') 0
  print $ rmleft -- ("hi, 1)
  print $ rmright -- ("hi", 1)
  print $ (rmzero :: (String, Int)) -- ("", 0)
  print $ rmleft == runMem f' 0 -- True
  print $ rmright == runMem f' 0 -- True
