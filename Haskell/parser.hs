import Data.Char

newtype Parser a = Parser (String -> [(a, String)])

instance Functor Parser where
    fmap f (Parser p) = Parser (\x -> map (\(m, n) -> (f m, n)) $ p x)

instance Applicative Parser where
    pure x = Parser (\s -> [(x, s)])
    (Parser f) <*> (Parser p) = Parser (\s -> [(a1 a2, b1) | (a1, b1) <- f s, (a2, b2) <- p s])

instance Monad Parser where
    return x = Parser (\s -> [(x, s)])
    p >>= q = Parser (\s -> [(y, s'') | (x, s') <- apply p s, (y, s'') <- apply (q x) s'])

apply :: Parser a -> String -> [(a, String)]
apply (Parser p) s = p s

parse :: Parser a -> String -> a
parse p = fst . head . apply p

getc :: Parser Char
getc = Parser f
    where
        f [] = []
        f (c:cs) = [(c, cs)]

failParser :: Parser a
failParser = Parser (\_ -> [])

guard :: Bool -> Parser ()
guard True = return ()
guard False = failParser

sat :: (Char -> Bool) -> Parser Char
sat p = do
    c <- getc
    guard (p c)
    return c

char :: Char -> Parser ()
char x = do
    sat (== x)
    return ()

string :: String -> Parser ()
string [] = return ()
string (x:xs) = do
    char x
    string xs
    return ()

lower :: Parser Char
lower = sat isLower

digit :: Parser Int
digit = do
    d <- sat isDigit
    return (cvt d)
    where
        cvt d = fromEnum d - fromEnum '0'

(<|>) :: Parser a -> Parser a -> Parser a
p <|> q = Parser f
    where
        f s = let ps = apply p s in
            if null ps then apply q s else ps

lowerString :: Parser String
lowerString = (do
    c <- lower;
    cs <- lowerString;
    return (c:cs))
    <|> return ""

many :: Parser a -> Parser [a]
many p = (do
    x <- p
    xs <- many p
    return (x:xs))
    <|> return []

space :: Parser ()
space = many (sat isSpace) >> return ()

symbol :: String -> Parser ()
symbol xs = space >> string xs

token :: Parser a -> Parser a
token p = space >> p

some :: Parser a -> Parser [a]
some p = do
    x <- p
    xs <- many p
    return (x:xs)

natural :: Parser Int
natural = token nat
        
nat :: Parser Int
nat = do
    ds <- some digit
    return (foldl1 shift1 ds)
        where
            shift1 m n = 10 * m + n

int :: Parser Int
int = do
    space
    minus
    n <- nat
    return (-n)
    where
        minus = (char '-' >> return negate) <|> return id

