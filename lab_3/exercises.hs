{-# LANGUAGE BangPatterns #-}

import System.Random
import Data.Ord

{- Parametric Polymorphism -}

-- Q1
rotate :: (a, b, c) -> (c, a, b)
rotate (x, y, z) = (z, x, y)

-- Q2
myCurry :: ((a, b) -> c) -> a -> b -> c
myCurry f x y = f (x, y)

-- Q3
myUncurry :: (a -> b -> c) -> (a, b) -> c
myUncurry f (x, y) = f x y

-- Q4
myFlip :: (a -> b -> c) -> b -> a -> c
myFlip f x y = f y x

-- Q5
f :: (a, b) -> (a -> c) -> (b -> d) -> ((c, d) -> e) -> e
f (a, b) f1 f2 f3 = f3 (f1 a, f2 b)

{- Typeclasses -}

-- Q1: Define a Vehicle ADT
data Vehicle = Bicycle | Car | Bus

-- Q2, Q3: How do we modify to support printing the name and deciding equality?
 deriving (Show, Eq)

-- Q4
numWheels :: Vehicle -> Int
numWheels Bicycle = 2
numWheels Car = 4
numWheels Bus = 4

-- numWheels :: Vehicle -> Int

-- Q5: How do we implement an ordering on wheels?
instance Ord Vehicle where
 compare vehicle1 vehicle2 = compare (numWheels vehicle1) (numWheels vehicle2)

{- Lazy evaluation -}
ackermann :: Integer -> Integer -> Integer
ackermann 0 n = n + 1
ackermann m 0 = ackermann (m - 1) 1
ackermann m n = ackermann (m - 1) (ackermann m (n - 1))

-- (1)
butIfZero :: Integer -> Integer -> Integer
butIfZero a b
 | a /= 0 = a
 | otherwise = b
 
-- butIfZero evaluates its parameters based on need, and it is lazy, so if a condition is satisfied by the first parameter then the function will finish without ever computing the second parameter. This saves processing time.

-- (2)

{- let f = \x y z -> if (x=="hello" && y=="haskell") then z
                  else 42 -}

-- (a) What is the type of f?
-- f is a lambda function

-- (b)
-- How would you describe f in terms of evaluation of its parameters?
-- Which must always be evaluated?
-- Only x must always be evaluated. If x is false, y will be skipped, and z will be output. If x is true, y will also be evaluated, and x may be skipped in favor of 42

-- (c)
-- Would you expect the following function evaluation to take a long time? Why/why not?
-- f "hello" "c++" (ackermann 4 2)
-- No, because the "&&" conditional would return false, so the ackermann function would be skipped

-- (d) Given the strictness annotation on z, would you expect evaluating
-- f "goodbye" "java" (ackermann 4 2) would take a long time?
-- Yes, because the ackermann function would now be evaluated by necessity every time

-- (e) Can you see any useful reason for strictness annotations in Haskell?
-- This prevents memory leaks in the form of unmanaged Thunks. A Thunk is a piece of data that has been left unevaluated and is clogging memory space. Thunks introduce a performance overhead to be managed, so if you know a variable will be needed, it is more efficient to evaluate it straight away. Sometimes a programmer may also need precise control over when a variable is evaluated, for instance if an expression might result in an error or in an infinite loop, forcing evaluation makes this easier to trace when the code is executing.

{- Further exercises -}

randomElem :: (RandomGen g) => g -> [a] -> (a, g)
randomElem gen xs =
 let (index, newGen) = uniformR (0, length xs -1) gen
 in (xs !! index, newGen)

randomElements :: Int -> [a] -> [a]
randomElements seed xs = generateList (mkStdGen seed)
 where
  generateList gen =
   let (item, nextGen) = randomElem gen xs
   in item : generateList nextGen

