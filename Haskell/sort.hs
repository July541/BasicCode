quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
    let left = quicksort [a | a <- xs, a < x]
        right = quicksort [a | a <- xs, a >= x]
    in left ++ [x] ++ right