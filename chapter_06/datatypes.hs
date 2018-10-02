-- the ' is just a way of differentiating the type constructor
-- from the data type
data Trivial = Trivial' deriving Show

instance Eq Trivial where
  Trivial' == Trivial' = True

data Farts =
  Fart [Char] Int
  deriving Show

data Butt =
  Hairy | Smooth

data DayOfWeek =
  Mon | Tues | Wed | Thurs | Fri | Sat | Sun
  deriving Show

data Date =
  Date DayOfWeek Int
  deriving Show

instance Eq DayOfWeek where
  (==) Mon Mon = True
  (==) Tues Tues = True
  (==) Wed Wed = True
  (==) Thurs Thurs = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) Sun Sun = True
  -- if you leave this last case out,
  -- the pattern matches for this type
  -- instances will be "non-exhaustive"
  -- and could cause errors. You can
  -- use `:set -Wall` in the REPL to turn
  -- on warnings for this type of situation.
  (==) _ _ = False

instance Eq Date where
  (==) (Date weekday dayOfMonth)
       (Date weekday' dayOfMonth') =
     weekday == weekday'
     && dayOfMonth == dayOfMonth


-- p 177
data Identity a = Identity a

instance Eq a => Eq (Identity a) where
  (==) (Identity v) (Identity v') = v == v'
