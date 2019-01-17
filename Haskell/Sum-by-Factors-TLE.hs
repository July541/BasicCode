import Data.List(sort, nub)

factorss :: Integer -> [Integer]
factorss xx = [i | i <- [2 .. x], mod x i == 0]
    where x = abs xx

isPrime :: Integer -> Bool
isPrime 2 = True
isPrime x = null [i | i <- [2 .. (ceiling $ sqrt (x - 1))], mod x i == 0]

primeFactors :: [Integer] -> [Integer]
primeFactors xs = sort $ nub $ filter isPrime $ foldl (\acc x -> factorss x ++ acc) [] xs

mapFactors :: [Integer] -> [Integer] -> [(Integer, Integer)]
mapFactors [] _ = []
mapFactors (x:xs) ys = (x, sum [i | i <- ys, mod i x == 0]) : mapFactors xs ys

sumOfDivided :: [Integer] -> [(Integer, Integer)]
sumOfDivided xs = mapFactors (primeFactors xs) xs