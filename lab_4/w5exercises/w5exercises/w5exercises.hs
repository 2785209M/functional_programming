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
flatten :: [[a]] -> [a]
flatten xss = undefined

-- Q2

superSafeDiv :: Int -> Int -> Maybe Int
superSafeDiv x y = undefined

-- Q3
divTwice :: Int -> Int -> Maybe Int
divTwice x y = undefined

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
