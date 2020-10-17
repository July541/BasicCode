import Test.QuickCheck

head' :: [a] -> a
head' (x:_) = x

last' :: [a] -> a
last' [x] = x
last' (_:xs) = last' xs

tail' :: [a] -> [a]
tail' (_:xs) = xs

init' :: [a] -> [a]
init' [x] = []
init' (x:xs) = x : init' xs

null' :: [a] -> Bool
null' [] = True
null' (_:_) = False

(++++) :: [a] -> [a] -> [a]
[] ++++ ys = ys
(x:xs) ++++ ys = x : (xs ++++ ys)

map' :: (a -> b) -> [a] -> [b]
map' f xs = [f x | x <- xs] -- recursive version

filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = [x | x <- xs, p x]

concat' :: [[a]] -> [a]
concat' [] = []
concat' (x:xs) = x ++ concat' xs -- foldr

length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs -- foldl

(!!!!) :: [a] -> Int -> a
(x:_) !!!! 0 = x
(_:xs) !!!! n | n > 0 = xs !!!! (n - 1)
(_:_) !!!! _ = error "Negative index"
[] !!!! _ = error "Index too large"

foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' _ z [] = z
foldl' f z (x:xs) = foldl' f (f z x) xs

foldl1' :: (a -> a -> a) -> [a] -> a
foldl1' f (x:xs) = foldl' f x xs

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' _ z [] = z
foldr' f z (x:xs) = f x (foldr' f z xs)

foldr1' :: (a -> a -> a) -> [a] -> a
foldl1' f [x] = x
foldl1' f (x:xs) = f x (foldl1' f xs)

iterate :: (a -> a) -> a -> [a]
iterate f x = x : iterate f (f x)

type TestType = Int

prop_head :: [TestType] -> Property
prop_head xs = (not $ null xs) ==> head' xs == head xs

prop_last :: [TestType] -> Property
prop_last xs = (not $ null xs) ==> last' xs == last xs

prop_tail :: [TestType] -> Property
prop_tail xs = (not $ null xs) ==> tail' xs == tail xs

prop_init :: [TestType] -> Property
prop_init xs = (not $ null xs) ==> init' xs == init xs

prop_null :: [TestType] -> Bool
prop_null xs = null' xs == null xs

prop_pppp :: [TestType] -> [TestType] -> Bool
prop_pppp xs ys = (xs ++++ ys) == (xs ++ ys)

prop_map1 :: [TestType] -> Bool
prop_map1 xs = (map' (+1) xs) == (map (+1) xs)

prop_filter1 :: [TestType] -> Bool
prop_filter1 xs = (filter' (>3) xs) == (filter (>3) xs)

prop_concat :: [[TestType]] -> Bool
prop_concat xs = concat' xs == concat xs

prop_length :: [TestType] -> Bool
prop_length xs = length' xs == length xs

testcases :: [([TestType] -> Property)]
testcases = [prop_head, prop_last, prop_tail, prop_init]


prop_all xs = conjoin $ map (\f -> f xs) testcases