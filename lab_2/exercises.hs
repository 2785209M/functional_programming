import Data.Char (toUpper)

-- 1. --------------
exceptLast :: [a] -> [a]
exceptLast [] = error "Empty list has no last element"
exceptLast [_] = []
exceptLast (x:xs) = x : exceptLast xs

prop_exceptLast :: Eq a => [a] -> Bool
prop_exceptLast = \xs -> if length xs > 0
 then exceptLast xs == reverse (tail (reverse xs))
 else True

-- 2. --------------
dropOdds :: [a] -> [a]
dropOdds [] = []
dropOdds [x] = [x]
dropOdds (x:_:xs) = x : dropOdds(xs)

prop_dropOdds :: Eq a => [a] -> Bool
prop_dropOdds x = length(dropOdds x) == (length x + 1) `div` 2

-- 3. --------------
myReverse :: [a] -> [a]
myReverse [] = []
myReverse [x] = [x]
myReverse x = (last x) : myReverse(exceptLast x)

prop_myReverse :: Eq a => [a] -> Bool
prop_myReverse x = myReverse x == reverse x

-- HIGHER ORDER FUNCTIONS ==========================================
f :: a -> a
f x = x

-- 1. -------------------------
twice :: (a -> a) -> a -> a
twice function x = function(function(x))

-- 2. ------------------------------
ntimes :: (a -> a) -> Int -> a -> a
ntimes f 0 x = x
ntimes f n x = ntimes f (n-1) (f x)
 
prop_addm :: Int -> Bool
prop_addm = \m -> if m < 0
 then True
 else ntimes (+1) m 0 == m
 
 -- 3. -----------------------------
myMap :: (a -> b) -> [a] -> [b]
myMap f xs = [f x | x <- xs]

prop_myMap :: Eq b => (a -> b) -> [a] -> Bool
prop_myMap f xs = myMap f xs == map f xs

-- 4. ------------------------------
myEven :: Int -> Bool
myEven x = x `mod` 2 == 0

myFilter :: (Int -> Bool) -> [Int] -> [Int]
myFilter _ [] = []
myFilter f (x:xs)
 | f x = x : myFilter f xs
 | otherwise = myFilter f xs
 
 -- STRING PROCESSING =================================
 -- 1. ------------------------------
myToUpper :: Char -> Char
myToUpper c
 | c >= 'a' && c <= 'z' = toEnum (fromEnum c - 32)
 | otherwise = c

mkUpperCase :: [String] -> [String]
mkUpperCase xs = [map myToUpper x | x <- xs]

prop_mkUpperCase :: [String] -> Bool
prop_mkUpperCase xs = mkUpperCase xs == [map toUpper x | x <- xs]

-- 2. -----------------------------------------
myToLower :: Char -> Char
myToLower c
 | c >= 'A' && c <= 'Z' = toEnum (fromEnum c + 32)
 | otherwise = c
 
tidy :: String -> String
tidy "" = ""
tidy (x:xs) = myToUpper x : map myToLower xs

-- 3. -----------------------------------------
mkFirstLettersUpper :: String -> String
mkFirstLettersUpper "" = ""
mkFirstLettersUpper x = unwords(map tidy (words x))

-- 4. -----------------------------------------
checkLength :: [String] -> [String]
checkLength [] = []
checkLength (x:xs)
 | length x <= 3 = x : checkLength xs
 | otherwise = tidy x : checkLength xs

mkSomeFirstLettersUpper :: String -> String
mkSomeFirstLettersUpper "" = ""
mkSomeFirstLettersUpper x = unwords(checkLength (words x))

-- BINARY TREES ============================================
-- 1. --------------------------------
data Tree = Leaf | Node Int Tree Tree

tree1 = Node 1
 (Node 2 Leaf Leaf)
 (Node 3
  (Node 4 Leaf Leaf)
  (Node 5 Leaf Leaf))

my_preOrder :: Tree -> [Int]
my_preOrder Leaf = []
my_preOrder (Node val left right) = [val] ++ my_preOrder left ++ my_preOrder right

dfs_preOrder :: Tree -> String
dfs_preOrder t = unwords(map show (my_preOrder t))

-- 2. ---------------------------------------
my_inOrder :: Tree -> [Int]
my_inOrder Leaf = []
my_inOrder (Node val left right) = my_inOrder left ++ [val] ++ my_inOrder right

dfs_inOrder :: Tree -> String
dfs_inOrder t = unwords(map show (my_inOrder t))
