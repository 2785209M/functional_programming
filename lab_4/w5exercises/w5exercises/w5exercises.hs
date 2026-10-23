import Data.List
import Data.Ord (comparing)

{- Week 4 exercises -}

-- IO
-- Q1
echoCaps :: IO ()
echoCaps = undefined

-- Q2
echoFile :: FilePath -> IO ()
echoFile path = undefined

-- Q3
calculator :: IO ()
calculator = undefined

-- Q4
infiniteAppend :: IO ()
infiniteAppend = undefined

-- Monads
-- Q1
-- flatten :: [[a]] -> [a]
-- flatten xss = [x | xs <- xss, x <- xs]

--flatten :: [[a]] -> [a]
--flatten xss = do
 --xs <- xss
 --x <- xs
 --return x

flatten :: [[a]] -> [a]
flatten xss = 
 xss >>= \xs ->
  xs >>= \x ->
   return x

-- Q2

superSafeDiv :: Int -> Int -> Maybe Int
superSafeDiv x y
 | y/= 0 && x > y && (mod x y == 0) = Just (div x y)
 | otherwise = Nothing

-- Q3
--divTwice :: Int -> Int -> Maybe Int
--divTwice x y = do
 --firstnumber <- superSafeDiv x y
 --secondnumber <- superSafeDiv firstnumber y
 --return secondnumber

divTwice :: Int -> Int -> Maybe Int
divTwice x y =
 superSafeDiv x y >>= \firstnumber ->
  superSafeDiv firstnumber y >>= \secondnumber ->
   return secondnumber

-- Connected words
connectionMap :: [(Char, [Char])]
connectionMap =
    [
        ('a', "aqzsw"),
        ('b', "bvghn"),
        ('c', "cxdfv"),
        ('d', "dxserfc"),
        ('e', "ewsdr"),
        ('f', "fdrtgvc"),
        ('g', "gftyhbv"),
        ('h', "hgyujnb"),
        ('i', "iujklo"),
        ('j', "jhuikmn"),
        ('k', "kjiolm"),
        ('l', "lkop"),
        ('m', "mnjk"),
        ('n', "nbhjm"),
        ('o', "oiklp"),
        ('p', "pol"),
        ('q', "qwa"),
        ('r', "redft"),
        ('s', "sawedxz"),
        ('t', "trfgy"),
        ('u', "uyhji"),
        ('v', "vcfgb"),
        ('w', "wqase"),
        ('x', "xzsdc"),
        ('y', "ytghu"),
        ('z', "zasx")
    ]

-- Q1
isConnected :: String -> Bool
isConnected word = all checkPair (zip word (drop 1 word))
 where
  checkPair(x, y) = case lookup x connectionMap of
    Just neighbors -> y `elem` neighbors
    Nothing -> False

-- Q2
connectedWords :: IO [String]
connectedWords = do
 path <- getLine
 fileContent <- readFile path
 let allWords = words fileContent
 let list = [x | x <- allWords, isConnected x]
 return list

-- Q3
printStats :: IO ()
printStats = do
 list <- connectedWords
 let sortedList = sortBy (comparing length) list
 let listLength = length list
 let topFive = take 5 (reverse sortedList)
 print topFive
 print listLength
