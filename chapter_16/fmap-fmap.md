```haskell
let replaceWithP = const 'p'

let a = Just "a"
let b = Nothing
let c = Just "c"

let listOfMaybes = [a, b, c]

fmap replaceWithP listOfMaybes
-- "ppp"
-- We get this output because `fmap` is passing each list item
-- into `replaceWithP`, but `replaceWithP` is just returning 'p'

-- the only reason this works is because the `replaceWithP` function
-- happens to not care about the type of the argument it receives,
-- because it discards it. That's why this won't work:

fmap (++ " hello") listOfMaybes
-- • Couldn't match type ‘Maybe [Char]’ with ‘[Char]’

-- clearly our intent above was to keep the structure of the list elements
-- intact, in addition to the list itself. How do we do that?

(fmap . fmap) (++ " hello") listOfMaybes
-- [Just "a hello", Nothing, Just "c hello"]

-- that's because (fmap . fmap) is giving us a function that looks like this:
fmap (fmap (++ " hello") <a list item>) listOfMaybes

-- the inner `fmap` actually takes our (++ "hello") function and applies it
-- to each list item, preserving its structure. The outer `fmap` is handed
-- the function that we're actually running over the list, which is:
-- (fmap (++ " hello"))

```
