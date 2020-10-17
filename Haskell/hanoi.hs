import Text.Printf
hanoi :: Int -> Char -> Char -> Char -> [String]
hanoi 1 a b c = [printf "Move disk 1 from %c to %c" a c]
hanoi n a b c = (hanoi (n - 1) a c b) ++ [printf "Move disk %d from %c to %c" n a c] ++ (hanoi (n - 1) b a c)

test = mapM_ putStrLn $ hanoi 3 'a' 'b' 'c'