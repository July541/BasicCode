module Geometry
(
    sphereVolume,
    sphereArea,
    cubeVolume,
    cubeArea,
    cuboidArea,
    cuboidVolume
) where

sphereVolume :: Float -> Float
sphereVolume radius = (4.0 / 3.0) * pi * (radius ^ 3)

sphereArea :: Float -> Float
sphereArea radius = 4 * pi * (radius ^ 3)

cubeVolume :: Float -> Float
cubeVolume side = side * side * side

cubeArea :: Float -> Float
cubeArea side = 6 * side * side

cuboidVolume :: Float -> Float -> Float -> Float
cuboidVolume a b c = a * b * c

cuboidArea :: Float -> Float -> Float -> Float
cuboidArea a b c = a * b * 2 + a * c * 2 + b * c * 2