import Data.Char

toDigitList :: Int -> [Int]
toDigitList = map digitToInt . show