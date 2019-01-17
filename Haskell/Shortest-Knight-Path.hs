import Data.Char(ord)

makePos :: String -> (Int, Int)
makePos xs = ((ord (head xs) - 96), ord (last xs) - 48)

dir :: [(Int, Int)]
dir = [(-2, -1), (-1, -2), (1, -2), (2, -1), (-1, 2), (-2, 1), (1, 2), (2, 1)]

canMove :: Int -> Int -> Bool
canMove x y = and [x > 0, x < 9, y > 0, y < 9]

move :: (Int, Int) -> [(Int, Int)] -> [(Int, Int)]
move _ [] = []
move s (x:xs) = if canMove xx yy then (xx, yy) : move s xs else move s xs
  where xx = fst s + fst x
        yy = snd s + snd x

knightLocal :: (Int, Int) -> (Int, Int) -> [(Int, Int)] -> Int
knightLocal s e vis
  | and [fst s == fst e, snd s == snd e] = 0
  | otherwise = minimum $ (foldl (\acc x -> (1 + (knightLocal x e (s:vis))) : acc) [10000] (filter (\x -> (notElem x vis)) (move s dir)))

knight :: String -> String -> Int
knight p1 p2 = knightLocal (makePos p1) (makePos p2) []