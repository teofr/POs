-- 1. Definir un conjunto de funciones que contenga infinitos elementos, pero no todos

-- Empecemos por pensar el tipo, en principio, segun el enunciado sabemos que tiene que ser algo de la pinta

infinitos0 :: Conj (a -> b)
-- Donde a y b pueden ser cualquier tipo

-- cualquiera??? pensemos en Bool -> Bool, cuantas funciones hay que manden booleanos a booleanos.
-- No solo son finitas, sino que son muy pocas, las enumeramos.
b2b1 :: Bool -> Bool
b2b1 = const true

b2b2 :: Bool -> Bool
b2b1 = const true

b2b3 :: Bool -> Bool
b2b1 = id

b2b4 :: Bool -> Bool
b2b1 = not

-- Entonces, es claro que a y b no pueden ser cualquier tipo, intentemos resolver con algun tipo facil de usar
-- y que sea infinito, por ejemplo Int
infinitos :: Conj (Int -> Int)

-- Ahora, empecemos a programarla, y veamos que podemos hacer
infinitos f = 

-- Una opcion sería decir que siempre devuelve True, y omitir el argumento, pero en este
-- caso el conjunto tendría todos los elementos, y no cumpliría con lo pedid
infinitos f = True

-- Por lo general, con una función hay solo una cosa que podemos hacer, aplicarla, en este caso a un Int
-- Por ejemplo 0
infinitos f = f 0

-- Y, ahora, tenemos un Int, y tenemos que decidir algo sobre ese Int que me genere infinitos
-- Trues e infinitos Falses
-- Por ejemplo, podemos discernir utilizando la paridad de ese resultado

infinitos f = f 0 `mod` 2 == 0


-- 2. Adem ́as, demuestre (con ejemplos en Haskell) que tiene infinitas funciones pero no todas.

-- Demos primero una lista, con infinitos elementos presentes en el conjunto
-- Esta lista va a tener que ser una lista de funciones, distintas, que al ser
-- aplicadas a 0 retornen un número par
-- Para simplificarlo, podemos dar una lista de funciones que siempre den un
-- número par, de forma constante, por ejemplo:

infinitasFuncionesPresentes :: [Int -> Int]
infinitasFuncionesPresentes = map const [2,4..]

-- Ahora, es trivial dar una lista de infinitas funciones que no esten
-- presentes en el conjunto, simplemente cambiando los resultados que 
-- retornan por enteros impares

infinitasFuncionesNoPresentes :: [Int -> Int]
infinitasFuncionesNoPresentes = map const [1,3..]

-- En este punto es interesante discutir como el lazyness de Haskell le permite
-- manejar listas infinitas naturalmente, sin ningún tipo de burocracia extra

-- Extra
-- 3. La pertenencia a este conjunto, es decidible?

-- Veamos que no definiendo una función para la cual no se pueda definir si pertenece o no
-- Una opción es hacer una función que no termine nunca, por ejemplo

contraejemplo :: Int -> Int
contraejemplo x = contraejemplo $ x + 1

perteneceContraejemplo = infinitos contraejemplo

-- apenas infinitos intente obtener el resultado de contraejemplo 0 se va a colgar,
-- por lo que nunca va a retornar ni True ni False, en otras palabras, no podrá decidir
-- la pertenencia