module OptionalMonoid where

import Data.Monoid

data Optional a = Nada | Only a deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty = Only mempty -- is derived  ^ from the type of this
  mappend (Only a) (Only b) = Only (a <> b)
  mappend (Only a) _        = Only (a <> mempty)
  mappend _ (Only a)        = Only (a <> mempty)
  mappend Nada Nada         = Nada

data Identity a = Identity a

instance Monoid a => Monoid (Identity a) where
  mempty = Identity mempty
  mappend (Identity a) (Identity b) = (Identity a <> b)
