module Chap17Exercises where
import Control.Applicative

newtype Identity a = Identity a
  deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity a) = Identity (f a)

instance Applicative Identity where
  pure = Identity
  -- (<*>) (Identity f) (Identity a) = Identity (f a)

  -- alernate minimal implementation
  liftA2 f (Identity a) (Identity b) = Identity (f a b)

newtype Name = Name String deriving (Eq, Show)
newtype Address = Address String deriving (Eq, Show)

validateLength :: Int
               -> String
               -> Maybe String

validateLength maxLen s =
  if (length s) > maxLen
  then Nothing
  else Just s

mkName :: String -> Maybe Name
mkName s =
  fmap Name $ validateLength 25 s

mkAddress :: String -> Maybe Address
mkAddress a =
  fmap Address $ validateLength 100 a

data Person =
  Person Name Address
  deriving (Eq, Show)

mkPerson name address =
  Person <$> mkName name <*> mkAddress address

