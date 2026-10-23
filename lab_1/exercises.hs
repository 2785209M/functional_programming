largeroftwo :: Int -> Int -> Int
largeroftwo x y = if x > y then x else y

-- -------------------------------------

largerofthree :: Int -> Int -> Int -> Int
largerofthree x y z = largeroftwo (largeroftwo x y) z

-- -------------------------------------

addThreeTuple :: (Int, (Int, Int)) -> Int
addThreeTuple tuple = x
 where
  a = fst(tuple)
  b = fst(snd(tuple))
  c = snd(snd(tuple))
  x = a + b + c

-- -------------------------------------

force :: Float -> Float -> Float -> Float
force m1 m2 d = result
 where
  result = ((6.67e-11) * m1 * m2)/(d^^2)

-- ==================================================

numbersbetween :: Int -> Int -> [Int]
numbersbetween a b = [x | x <- [a..b], mod x 3 == 0]

-- -------------------------------------

triangles :: Int -> [Int]
triangles n = [(x * (x+1) ) `div` 2 | x <- [1..n]]

-- -------------------------------------

isPrime :: Int -> Bool
isPrime n = result
 where
  factors = [x | x <- [1..n], (mod n x) == 0]
  result = factors == [1,n]

primes :: Int -> [Int]
primes n = [x | x <- [1..n], isPrime x]

-- -------------------------------------

flatten :: [[a]] -> [a]
flatten nested_list = [value | list <- nested_list, value <- list]
