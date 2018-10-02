module Chap15Summer where
import Data.Monoid


data Optional a = Nada | Only a deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty = Only mempty
  mappend (Only a) (Only b) = Only (a <> b)
  mappend (Only a) _        = Only (a <> mempty)
  mappend _ (Only b)        = Only (b <> mempty)
  mappend Nada Nada         = Nada

-- Expected output:
-- Prelude> Only (Sum 1) `mappend` Only (Sum 1)
-- Only (Sum {getSum = 2})
--
-- Prelude> Only (Product 4) `mappend` Only (Product 2)
-- Only (Product {getProduct = 8})
--
-- Prelude> Only (Sum 1) `mappend` Nada
-- Only (Sum {getSum = 1})
--
-- Prelude> Only [1] `mappend` Nada
-- Only [1]
--
-- Prelude> Nada `mappend` Only (Sum 1)
-- Only (Sum {getSum = 1})
