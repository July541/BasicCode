divisors :: Int -> [Int]
divisors x = [i | i <- [1..x], (mod x i) == 0]

recreation :: Int -> (Int, Int)
recreation x = if f * f == s then (x, s) else (0,0)
  where s = sum $ map (\y -> y*y) (divisors x)
        f = round $ sqrt s

listSquared :: Int -> Int -> [(Int, Int)]
listSquared m n = foldl (\acc x -> recreation x : acc) [] [m..n]