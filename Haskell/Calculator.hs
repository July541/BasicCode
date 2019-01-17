import Data.Char

isHighPriority :: String -> String -> Bool
isHighPriority a b
    | or [a == "*", a == "/"] = and [b /= "*", b /= "/"]
    | otherwise = False

eval :: Double -> Double -> String -> Double
eval b a s
    | s == "+" = a + b
    | s == "-" = a - b
    | s == "*" = a * b
    | s == "/" = a / b

parse :: [String] -> [Double] -> [String] ->  Double
parse [] datas [] = head datas
parse [] datas symbol = parse [] ((eval (head datas) (head $ tail datas) (head symbol)) : (tail $ tail datas)) (tail symbol)
parse (x:xs) datas symbol   
    | isDigit (x !! 0) = parse xs ((read x :: Double) : datas) symbol
    | null symbol = parse xs datas (x : symbol)
    | isHighPriority x (head symbol) = parse xs datas (x : symbol)
    | otherwise = parse (x:xs) ((eval (head datas) (head $ tail datas) (head symbol)) : (tail $ tail datas)) (tail symbol)

evaluate :: String -> Double
evaluate str = parse (words str) [] []