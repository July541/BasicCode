makePairs :: [Integer] -> [Integer] -> [(Integer, Integer)]
makePairs [] _ = []
makePairs (x:xs) ys = (map (\y -> (x,y)) ys) ++ (makePairs xs ys)

removNb :: Integer-> [(Integer, Integer)]
removNb n = filter (\x -> (fst x) * (snd x) == (s - (fst x) - (snd x))) xs
  where xs = makePairs [lowerBound..upperBound] [lowerBound..upperBound]
        s = sum [1..n]
        lowerBound = (((n - 1) * n) `div` 2) `div` (n + 1)
        upperBound = (round (sqrt (fromIntegral (s + 1)))) - 1
