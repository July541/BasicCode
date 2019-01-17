type Node = Char
type Arc  = (Node, Node)

solveGraphLocal :: Node -> Node -> [Node] -> [Arc] -> Bool
solveGraphLocal s e vis arcs
  | s == e = True
  | null [snd i | i <- arcs, fst i == s, notElem (snd i) vis] = False
  | otherwise = and $ (map (\x -> (solveGraphLocal x e (s:vis) arcs)) [snd i | i <- arcs, fst i == s, notElem (snd i) vis])

solveGraph :: Node -> Node -> [Arc] -> Bool
solveGraph s e arcs = solveGraphLocal s e [] arcs