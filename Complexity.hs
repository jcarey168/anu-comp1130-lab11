module Complexity where

import Prelude hiding (elem, length, head, tail, (++), nub)
-- Note that we will be defining many functions that already
-- exist in the Prelude. This flag prevents Haskell from
-- importing them from the Prelude, so we don't need to worry about
-- names clashing, and we can use the same names that the Prelude
-- uses.


{-
Exercise 1

Describe the complexity class of these functions in the best,
worse and average cases.
The first has already been done for you.
-}

-- | Checks if an element is present in a list.
-- best O(1), worst O(n), average O(n)
elem :: (Eq a) => a -> [a] -> Bool
elem e list = case list of
    [] -> False
    x:xs
        |e == x -> True
        |otherwise -> elem e xs

-- | Computes the length of the input list
-- best O(?), worst O(?), average O(?)
length :: [a] -> Integer
length list = case list of
    [] -> 0
    _:xs -> 1 + length xs

-- | Takes in a list, and throws the list away, and returns zero.
-- best O(?), worst O(?), average O(?)
zero :: [a] -> Integer
zero list = case list of
    [] -> 0
    _:xs -> zero xs

-- | Returns the first element in a list
-- best O(?), worst O(?), average O(?)
head :: [a] -> a
head list = case list of
    [] -> error "head: Empty list has no first element"
    x:_ -> x

-- | Returns the last element in a list
-- best O(?), worst O(?), average O(?)
tail :: [a] -> a
tail list = case list of
    [] -> error "tail: Empty list has no last element"
    [x] -> x
    x:xs -> tail xs

-- | Takes a list, and removes the duplicate elements
-- best O(?), worst O(?), average O(?)
nub :: (Eq a) => [a] -> [a]
nub list = case list of
    [] -> []
    x:xs
        |elem x xs ->  nub xs
        |otherwise -> x : nub xs

-- | Concatenates two lists together
-- best O(?), worst O(?), average O(?)
(++) :: [a] -> [a] -> [a]
[]      ++ ys = ys
(x:xs)  ++ ys = x:(xs ++ ys)

-- | Reverses a list
-- best O(?), worst O(?), average O(?)
rev1 :: [a] -> [a]
rev1 list = case list of
    [] -> []
    x:xs -> (rev1 xs) ++ [x]

-- | Reverses a list
-- best O(?), worst O(?), average O(?)
rev2 :: [a] -> [a]
rev2 list = revHelper list []
    where
    revHelper list acc = case list of
        [] -> acc
        x:xs -> revHelper xs (x:acc) 

{-
Exercise 2

Work out the complexity for these functions: fib1, fib2, power.
-}

-- | Computes 2^n deliberately inefficiently
-- O(2^n), Theta(2^n), Omega(2^n)
exp2 :: Integer -> Integer
exp2 n
    |n < 0  = error "exp2: undefined for negative arguments"
    |n == 0 = 1
    |n > 0  = exp2 (n - 1) + exp2 (n - 1) 

-- | Computes the fibonacci function
-- best O(?), worst O(?), average O(?)
fib1 :: Integer -> Integer
fib1 n
    |n < 0  = error "fib: undefined for negative arguments"
    |n == 0 = 0
    |otherwise = fib1 (n-1) + fib1 (n-2)

-- | Computes the fibonacci function
-- best O(?), worst O(?), average O(?)
fib2 :: Integer -> Integer
fib2 n 
    |n < 0      = error "fib2: undefined for negative arguments"
    |otherwise  = fibHelper 0 0 1
        where
        fibHelper 0 curr prev = curr
        fibHelper n curr prev = fibHelper (n-1) (curr + prev) curr

-- | Computes exponentiation via repeated multiplication
-- best O(?), worst O(?), average O(?)
power :: (Num a) => a -> Integer -> a
power base index
    |index < 0 = error "power: negative exponent"
    |index == 0 = 1
    |otherwise = base * (power base (index - 1))

{-
Exericse 3

The power function can be optimised to be faster. 
Use the fact that x^(2n) = (x^n)^2 and x^(2n+1) = (x^n)^2 * x
to write a faster version.

Do not use (**) or (^) to solve this problem.
-}

-- | Optimised exponentiation
-- best O(?), worst O(?), average O(?)
powerFast :: (Num a) => a -> Integer -> a
powerFast = undefined

-- | A useful helper function that squares a number.
square :: (Num a) => a -> a
square x = x * x





