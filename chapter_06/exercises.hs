module Exercises where

data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn a) (TisAn a') = a == a'


data TwoIntegers = Two Integer Integer
instance Eq TwoIntegers where
  (==) (Two a b) (Two a' b') = a == a' && b == b'

data StringOrInt =
    TisAnInt Int
  | TisAString String

instance Eq StringOrInt where
  (==) (TisAnInt a) (TisAnInt a') = a == a'
  (==) (TisAString a) (TisAString a') = a == a'
  (==) _ _ = False

data Pair a = Pair a a
instance Eq a => Eq (Pair a) where
  (==) (Pair v w) (Pair v' w') = v == v' && w == w'

data Tuple a b =
  ThisIsATuple a b

instance (Eq first, Eq second) => Eq (Tuple first second) where
  (==) (ThisIsATuple v w) (ThisIsATuple v' w') = v == v' && w == w'
  -- instance
  -- ^^^^^^^^           just the start of the declaration.
  --
  -- (Eq a, Eq b) => Eq
  -- ^^^^^^^^^^^^^^^^^^ the typeclass constraint, it says
  --                    that we're defining an instance of
  --                    Eq, and the parameters `a` and `b`
  --                    are both constrained to types that
  --                    have instances of Eq
  --
  -- (Tuple a b)
  -- ^^^^^^^^^^^        we're defining this typeclass instance
  --                    for the datatype `Tuple a b`

data Which a =
      ThisOne a
    | ThatOne a

-- Question: is there a terser way to do this?
instance Eq a => Eq (Which a) where
  -- (==) v v' = v == v' -- using this gives me an... infinite loop?

  (==) (ThisOne v) (ThatOne v') = v == v'
  (==) (ThatOne v) (ThisOne v') = v == v'
  (==) a b = a == b


-- interesting, so this datatype can accept two types, but you
-- only ever pass one OR the other
data EitherOr a b =
    Hello a
  | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello v) (Hello v') = v == v'
  (==) (Goodbye v) (Goodbye v') = v == v'

  -- if my understanding is correct:
  --   Hello _ can NEVER equal Goodbye _, even if
  --   the values happen to be of the same type,
  --   because the type signature defines Hello
  --   as having a different type than Goodbye,
  --   therefore they can never be compared
  (==) (Hello _) (Goodbye _) = False
  (==) (Goodbye _) (Hello _) = False


--
-- Ord instances

data DayOfWeek =
  Mon | Tue | Wed | Thu | Fri | Sat | Sun
  deriving (Eq, Show)

instance Ord DayOfWeek where
  compare Fri Fri = EQ
  compare Fri _   = GT
  compare _   Fri = LT
  compare _   _   = EQ
