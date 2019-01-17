import Data.Char

toDigitList :: Int -> [Int]
toDigitList = map digitToInt . show

isValidWalk :: [Char] -> Bool
isValidWalk walk = and [ns == ss, es == ws, ns + ss + es + ws == 10]
  where ns = length $ filter (\x -> x == 'n') $ take 10 walk
        ss = length $ filter (\x -> x == 's') $ take 10 walk
        es = length $ filter (\x -> x == 'e') $ take 10 walk
        ws = length $ filter (\x -> x == 'w') $ take 10 walk


-- toDigitList :: Int -> [Int]
-- toDigitList n = map digitToInt $ show n

-- isDigPow :: Int -> Bool
-- isDigPow n = n == (sum $ zipWith (\x y -> x ^ y) xs [1 .. length xs])
--   where xs = toDigitList n

-- sumDigPow :: Int -> Int -> [Int]
-- sumDigPow a b = foldr (\acc x -> if isDigPow x then x:acc else acc) [] [a .. b]


blink :: Int -> [Int]
blink n = map (\(x,y) -> x * 10 ^ (y -1)) $ zip (toDigitList n) [len, len - 1 .. 1]
  where len = length $ show n

expandedForm :: Int -> String
expandedForm n = 
  (show $ head lst) ++ (others $ tail lst)
  where lst = blink n
        others [] = ""
        others (x:xs)
          | x == 0 = others xs
          | otherwise = " + " ++ (show x) ++ (others xs)


split :: String -> [String]
split [] = []
split str = takeWhile isSpace ".... . -.--   .--- ..- -.. ."