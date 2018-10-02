module Exercises where

-- 1. b and c will return the same as:
-- foldr (*) 1 [1..5]
-- 1 * (2 * (3 * (4 * (5 * 1) )))

-- foldl (flip (*)) 1 [1..5]


-- 2.
-- foldl (flip (*)) 1 [1..3]
-- (((z f 1) f 2) f 3)
-- (((1 * 1) * 2) * 3)

-- 3. c)

-- 4. a)

-- 5.
foldr (++) [] ["woot", "WOOT", "woot"]

foldr max ' ' "fear is the little death"

foldr (&&) True [False, True]
foldr (||) False [False, True]

foldl (flip ((++) . show)) "" [1..5]

foldr const "a" [1..5]


