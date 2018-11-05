-- Se cuenta con la siguiente representacion de conjuntos type Conj a = (a->Bool)
-- caracterizados por su funcion de pertenencia. De este modo, si c es un conjunto 
-- y e un elemento, la expresi´on c e devuelve True sii e pertenece a c.
-- 
-- i. Definir la constante vacıo :: Conj a, y la funcion agregar :: Eq a => a -> Conj a -> Conj a.
--
-- ii. Definir la funcion singleton :: Eq a => a -> Conj a, que dado un valor genere un conjunto con ese
--     valor como ´unico elemento.
--
-- iii. Definir la funcion deLista :: Eq a => [a] -> Conj a, que dada una lista de a, genere 
--      el conjunto cuyos elementos son los elementos de la lista.
--
-- iv. Definir un conjunto de funciones que contenga infinitos elementos, pero no todos,
--     y dar su tipo.
--
-- v. ¿Puede definirse un map para esta estructura? ¿De qu´e manera, o por qu´e no?


type Conj a = a -> Bool

-- i

vacio :: Conj a
-- vacio = \x -> False
-- vacio x = False
-- vacio _ = False
vacio = const False -- Parece que lo hicieran a proposito!!

agregar :: Eq a => a -> Conj a -> Conj a
-- agregar a p b | b == a = True
--			  | otherwise = p b
agregar a p b = b == a || p b -- LAZY EVALUATION!!!

-- ii

singleton :: Eq a => a -> Conj a
-- singleton a b = a == b
-- singleton a b = (==) a b
singleton = (==)

-- iii

deLista :: Eq a => [a] -> Conj a
-- deLista l a = elem a l
deLista = flip elem

-- iv

infinitos :: Conj (Int -> Int)
infinitos f = (f 0) `mod` 2 == 0

-- a demostrar que tiene inf elems
-- b se puede hacer Conj (a -> b)
-- c este conjunto, es computablemente enumerable
-- d puedo agregarle a este conjunto?

-- infinitosLista = [a -> Int]

infinitos2 :: Conj (a -> Int)
infinitos2 f = f undefined == 0


f1 :: Int -> Int
f1 x = 1

f2 :: a -> Int
f2 _ = 0

-- infinitos2 :: Conj (a -> b)
--            (a -> b) -> Bool
-- infinitos2 f = 