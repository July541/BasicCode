main = do
    putStrLn "hello world"
    name <- getLine
    putStrLn ("Hello " ++ name)