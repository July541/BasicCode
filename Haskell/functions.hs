import Data.List

wordcount :: [String] -> [(String, Int)]
wordcount = map (\x -> (head x, length x)) . group . sort . concat . map words