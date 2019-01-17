length' :: (Num a) => [b] -> a
length' [] = 0
length' (_:xs) = length' xs + 1

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "Exception"
maximum' [x] = x
maximum' (x:xs)
    | x > maxElem = x
    | otherwise = maxElem
    where maxElem = maximum' xs

take' :: (Ord a, Num a) => a -> [b] -> [b]
take' n _
    | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n - 1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x : repeat' x

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' v (x:xs)
    | v == x = True
    | otherwise = elem' v xs