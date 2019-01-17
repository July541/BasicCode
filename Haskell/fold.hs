sum' :: (Num a) => [a] -> a
sum' = foldl (\acc x -> acc + x) 0

maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 (\acc x -> if acc > x then acc else x)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldl (\acc x -> acc * x) 1

filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr (\x acc -> if f x then x : acc else acc) []

head' :: [a] -> a
head' = foldl1 (\acc _ -> acc)

last' :: [a] ->a
last' = foldr1 (\_ acc -> acc)