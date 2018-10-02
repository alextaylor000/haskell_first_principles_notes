{-# LANGUAGE FlexibleInstances #-}
module LogicGoats where

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

-- newtype IntString = IntString (Int, String)
--   deriving (Eq, Show)

-- instance TooMany IntString where
--   tooMany (IntString (n, _)) = n > 42
instance TooMany (Int, String) where
  tooMany (x, y) = x > 42

instance (Num a, Ord a) => TooMany (a, a) where
  tooMany (x, y) = x > 42

newtype NumTooMany a = NumTooMany (a, a)
instance (Num a, TooMany a) => TooMany (NumTooMany a) where
  tooMany (NumTooMany (x, y)) = False

-- newtype IntInt = IntInt (Int, Int)
--   deriving (Eq, Show)

-- instance TooMany IntInt where
--   tooMany (IntInt (n, n')) = (n + n') > 42

-- instance (Num a, TooMany a) => (a, a) where
--   tooMany (x, y) = (x + y) > 42


-- newtype NumTooMany a = NumTooMany (a, a) where
--   tooMany (x, y) = x > 42

-- Question: p 443 #3, how to do
-- newtype NumTooMany = NumTooMany (a, a)
--   deriving (Eq, Show)
