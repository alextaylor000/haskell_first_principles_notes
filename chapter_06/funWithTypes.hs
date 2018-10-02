module FunWithTypes where

data Mood = Blah | Woot deriving (Eq, Show)

instance Num Mood where
  (+) _ _ = Blah
  (-) _ _ = Woot
  (*) _ _ = Woot
  abs _ = Woot
  signum  _ = Woot
  fromInteger _ = Woot
