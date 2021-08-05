{-# LANGUAGE  ParallelListComp #-}
{-# LANGUAGE TransformListComp #-}

import GHC.Exts

table =
    [ ("Hangzhou", "MP4", 255)
    , ("Beijing", "MP4", 23)
    , ("Hangzhou", "CD", 123)
    , ("Beijing", "CD", 222)
    ]

analysis = [ (the product, sum cost) |
                (city, product, cost) <- table,
                then group by product using groupWith,
                then sortWith by sum cost]