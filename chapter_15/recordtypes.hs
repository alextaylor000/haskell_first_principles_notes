module RecordTypes where

newtype Mem s a = Mem { runMem :: s -> (a, s) }
newtype MyMem s a = MyMem (s -> (a, s))

runMyMem (MyMem f) = f

