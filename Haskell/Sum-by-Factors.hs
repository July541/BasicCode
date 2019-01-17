import Data.List(sort)

isPrime :: Integer -> Bool
isPrime 2 = True
isPrime x = Prelude.null [i | i <- [2 .. x - 1], mod x i == 0]

setPrimeTalbe :: Integer -> [Integer]
setPrimeTalbe maxValue = [i | i <- [2 .. maxValue], isPrime i]

primeFactors :: Integer -> [Integer] -> [Integer]
primeFactors xx primeTable = [i | i <- [2 .. x], mod x i == 0, elem i primeTable]
    where x = abs xx

-- primeFactors :: [Integer] -> [Integer]
-- primeFactors xs = sort $ nub $ filter isPrime $ foldl (\acc x -> factorss x ++ acc) [] xs

-- mapFactors :: [Integer] -> [Integer] -> [(Integer, Integer)]
-- mapFactors [] _ = []
-- mapFactors (x:xs) ys = (x, sum [i | i <- ys, mod i x == 0]) : mapFactors xs ys

-- fillMaps :: Integer -> [Integer] -> [(Integer, Integer)]
-- fillMaps _ [] = []
-- fillMaps y (x:xs) = Map.insertWith (+) x y  fromList fillMaps y xs

groupList :: [[Integer]] -> [Integer] -> [(Integer, Integer)]
groupList [] [] = []
groupList (x:xs) (y:ys) = (foldl (\acc x -> (x, y) : acc) [] x) ++ groupList xs ys

mapSum :: [(Integer, Integer)] -> [(Integer, Integer)]
mapSum [] = []
mapSum (x:[]) = [x]
mapSum (x:y:[]) = if fst x == fst y then [(fst x, ((snd x) + (snd y)))] else [x,y]
mapSum (x:y:xs) = if fst x == fst y then mapSum (t:xs) else x : mapSum (y:xs)
    where t = (fst x, ((snd x) + (snd y)))

sumOfDivided :: [Integer] -> [(Integer, Integer)]
sumOfDivided [] = []
sumOfDivided xs =  mapSum $ sort groupedMap
    where groupedMap = groupList mp xs
          absxs = map abs xs
          primeTable = setPrimeTalbe $ maximum absxs
          mp = map (\y -> primeFactors y primeTable) xs
    -- toList $ Prelude.foldl (\acc y -> Map.insertWith (+) y x $ fromList acc) [] (primeFactors x) : sumOfDivided xs
    -- (map (\y -> Map.insertWith (+) y x) (primeFactors x)) $ fromList sumOfDivided xs