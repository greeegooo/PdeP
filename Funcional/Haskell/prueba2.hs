sumaList :: [a] -> num
sumaList [] = 0
sumaList x:xs = x + sumaList xs