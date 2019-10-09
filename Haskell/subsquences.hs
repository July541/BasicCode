subsequences :: [a] -> [[a]]
subsequences [] = [[]]
subsequences (x:[]) = [[], [x]]
subsequences (x:xs) = (map (\a -> a) (subsequences xs)) ++ (map (\a -> x:a) (subsequences xs))