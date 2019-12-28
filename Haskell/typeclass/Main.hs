module Main where

import Data.Functor.Identity
import Data.Functor.Const
    
data Pos = Pos { pX :: Double, pY :: Double } deriving Show

data Line = Line { lineStart :: Pos, lineEnd :: Pos } deriving Show

-- type Lens b a = Functor f => (a -> f a) -> b -> f a

xLens :: Functor f => (Double -> f Double) -> Pos -> f Pos
xLens f p = fmap (\x' -> p { pX = x'}) $ f (pX p)

changeY :: Functor f => (Double -> f Double) -> Pos -> f Pos
changeY f p = fmap (\y' -> Pos (pX p) y') (f (pY p))

changeX :: Functor f => (Double -> f Double) -> Pos -> f Pos
changeX f p = fmap (\x' -> Pos x' (pY p)) $ f (pX p)

over :: ((a -> Identity a) -> b -> Identity b) -> (a -> a) -> b -> b
over change f l = runIdentity $ change (\x -> Identity (f x)) l

view :: ((a -> Const a a) -> b -> Const a b) -> b -> a
view change = getConst . (change Const)

set :: ((a -> Identity a) -> b -> Identity b) -> a -> b -> b
set change = over change . const 

changeY' :: (Double -> Double) -> Pos -> Pos
changeY' f p = Pos (pX p) (f (pY p))

changeX' :: (Double -> Double) -> Pos -> Pos
changeX' f p = Pos (f (pX p)) (pY p)

over' :: ((Double -> Double) -> Pos -> Pos) -> (Double -> Double) -> Pos -> Pos
over' change f p = change f p

delivery :: Num a => Maybe a -> a -> Maybe a
delivery (Just x) n = Just (x + n)
delivery Nothing _ = Nothing

addN :: Num a => [a] -> a -> [a]
addN [] _ = []
addN (x:xs) n = (x + n) : (addN xs n)

main :: IO()
main = undefined
