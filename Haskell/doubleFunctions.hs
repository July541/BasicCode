-- double the paramater

doubleMe x = x + x

-- doubleUs x y = x * 2 + y * 2

doubleUs x y = doubleMe x + doubleMe y

-- make the number less than 100 doubled
doubleSmallNumber x = if x > 100 then x else x * 2