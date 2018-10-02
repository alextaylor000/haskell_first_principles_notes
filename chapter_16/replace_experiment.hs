module ReplaceExperiment where

replaceWithP ::  b -> Char
replaceWithP = const 'p'

lms :: [Maybe [Char]]
lms = [Just "boom", Nothing, Just "funk"]

-- a more specific type...
replaceWithP' :: [Maybe [Char]] -> Char
replaceWithP' = replaceWithP

liftedReplace :: Functor f => f a -> f Char
liftedReplace = fmap replaceWithP

-- a more specific type...
liftedReplace' :: [Maybe [Char]] -> [Char]
--                                  ^ this is the `f` of `f Char`
--                                  `f` could be "any Functor", but we
--                                  can make it more specific by saying "we're
--                                  actually just looking for the List functor,
--                                  which is written like []"
liftedReplace' = liftedReplace

twiceLifted :: (Functor f1, Functor f) => f (f1 a) -> f (f1 Char)
twiceLifted = (fmap . fmap) replaceWithP

-- a more specific type...
twiceLifted' :: [Maybe [Char]] -> [Maybe Char]
twiceLifted' = twiceLifted

thriceLifted :: (Functor f2, Functor f1, Functor f) => (f (f1 (f2 a))) -> (f (f1 (f2 Char)))
thriceLifted = (fmap . fmap . fmap) replaceWithP

-- a more specific type...
thriceLifted' :: [Maybe [Char]] -> [Maybe [Char]]
thriceLifted' = thriceLifted

main :: IO ()
main = do
  putStr "replaceWithP' lms:   "
  print (replaceWithP' lms)

  putStr "liftedReplace lms:   "
  print (liftedReplace lms)

  putStr "liftedReplace' lms:  "
  print (liftedReplace' lms)

  putStr "twiceLifted lms:     "
  print (twiceLifted lms)

  putStr "twiceLifted' lms:    "
  print (twiceLifted' lms)

  putStr "thriceLifted lms:    "
  print (thriceLifted lms)

  putStr "thriceLifted' lms:   "
  print (thriceLifted' lms)

