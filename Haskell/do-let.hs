import Data.Char(toUpper)

main = do
    putStrLn "What's your first name?"
    firstName <- getLine
    putStrLn "What's your last name?"
    lastName <- getLine

    let bigFirstName = map toUpper firstName
        bigLastName = map toUpper lastName
    
    putStrLn ("Hello " ++ bigFirstName ++ " " ++ bigLastName)