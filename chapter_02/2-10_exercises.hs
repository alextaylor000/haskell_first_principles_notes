module TwoTenExercises where

-- let x = 5 in x
easyId = x
  where x = 5

-- let x = 5 in x * x
timesItself = x * x
  where x = 5

-- let x = 5; y = 6 in x * y
timesAnother = x * y
  where x = 5; y = 6

-- let x = 3; y = 1000 in x + 3
plus3 = x + 3
  where x = 3; y = 1000

-- let x = 3; y = 1000 in x * 3 + y
f         = x * 3 + y
  where x = 3
        y = 1000

-- let y = 10; x = 10 * 5 + y in x * 5
g = x * 5
  where y = 10
        x = 10 * 5 + y

-- let x = 7
--     y = negate x
--     z = y * 10
--  in z / x + y
h = z / x + y
  where x = 7
        y = negate x
        z = y * 10

