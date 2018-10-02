{-# LANGUAGE FlexibleInstances #-}

module LogicGoats where

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

newtype NumTooMany a = NumTooMany (a, a)
instance (Num a, TooMany a) => TooMany (NumTooMany a) where
  tooMany (NumTooMany (x, y)) = tooMany x
