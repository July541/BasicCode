-- 给定两个升序数组，返回两个数组合并后的第k小的数

merge :: [Int] -> [Int] -> [Int]
merge a1 a2
    | and [null a1, null a2] = []
    | null a1 = a2
    | null a2 = a1
    | otherwise = if (head a1) < (head a2) then (head a1) : (merge (tail a1) a2) else (head a2) : (merge a1 (tail a2))

smallest_v1 :: [Int] -> [Int] -> Int -> Int
smallest_v1 a1 a2 k = merge a1 a2 !! (k - 1)

partion :: [Int] -> [Int] -> Int -> Int -> Int -> Int
partion a1 a2 m n k
    | (a1 !! m) > (a2 !! n) = r1
    | (a1 !! m) < (a2 !! n) = r2
    | otherwise = if m > n then r1 else r2 
    where
        r1 = smallest_v2 (take (m `div` 2) a1) a2 k (drop ((m `div` 2) + 1) a1)
        r2 = smallest_v2 a1 (take (n `div` 2) a2) k (drop ((n `div` 2) + 1) a2)

smallest_v2 :: [Int] -> [Int] -> Int -> [Int] -> Int
smallest_v2 a1 a2 k z
    | m + n > k = partion a1 a2 m n k
    | otherwise = z !! (k - m - n)
    where
        m = length a1 - 1
        n = length a2 - 1

smallest a1 a2 k = smallest_v2 (0:a1) (0:a2) k []