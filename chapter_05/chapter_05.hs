module Chapter05 where

addStuff :: Integer -> Integer -> Integer
addStuff a b  = a + b + 5

subtractStuff :: Integer
              -> Integer
              -> Integer
subtractStuff x y = x - y - 10
subtractOne = subtractStuff 1

nonsense :: Bool -> Integer
nonsense True = 805
nonsense False = 31337

curriedFunction :: Integer -> Bool -> Integer
curriedFunction i b = i + (nonsense b)

uncurriedFunction :: (Integer, Bool) -> Integer
uncurriedFunction (i, b) = i + (nonsense b)

anonymous :: Integer -> Bool -> Integer
anonymous = \i b -> i + (nonsense b)

anonNested :: Integer -> Bool -> Integer
anonNested = \i -> \b -> i + (nonsense b)

-- parametricity
tripleA :: a -> a -> a
-- tripleA x y = x
-- or:
tripleA x y = y

-- this can only have one implementation
aBB :: a -> b -> b
aBB x y = y
