import Data.Char
import Control.Monad

{- Week 4 exercises -}

-- IO
-- Q1
echoCaps :: IO ()
echoCaps = do
 str <- getLine
 let upStr = map toUpper str
 putStrLn upStr

-- Q2
echoFile :: FilePath -> IO ()
echoFile path = do
 strings <- readFile path
 let stringLines = lines strings
 sequence_ [putStrLn line | line <- stringLines]

-- Q3
calculator :: IO ()
calculator = do
  action <- getLine
  
  num1 <- readLn
  num2 <- readLn
  
  let result = case action of
        "+" -> num1 + num2
        "-" -> num1 - num2
        "*" -> num1 * num2
        _   -> num1 + num2
        
  putStrLn (show result)

-- Q4
infiniteAppend :: IO ()
infiniteAppend = do
 path <- getLine
 
 forever $ do
  input <- getLine
  appendFile path (input ++ "\n")
 
-- ================================
-- Monads
-- Q1
flatten :: [[a]] -> [a]
flatten xss = undefined

-- Q2

superSafeDiv :: Int -> Int -> Maybe Int
superSafeDiv x y = undefined

-- Q3
divTwice :: Int -> Int -> Maybe Int
divTwice x y = undefined

-- =================================
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
isConnected word = undefined 

-- Q2
connectedWords :: IO [String]
connectedWords = undefined

-- Q3
printStats :: IO ()
printStats = undefined
