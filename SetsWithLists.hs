module SetsWithLists where

import Data.List

data Set a = Set [a]
   deriving Show


{-
Exercise 4

Complete the functions setEquals, addElement, setUnion.

We have given you the complexity class that your functions should meet.

-}


-- | Returns the definition for the empty set for this data structure
-- best O(1), worst O(1), average O(1)
emptySet :: Set a
emptySet = Set []


-- | The number of elements in a set.
-- best O(n), worst O(n), average O(n)
setSize :: Integral b => Set a -> b
setSize (Set list) = case list of
  []    -> 0
  _: xs -> 1 + setSize (Set xs)


-- | Checks if an element is present in a set
-- best O(1), worst O(n), average O(n)
containsElement :: (Eq a) => Set a -> a -> Bool
containsElement (Set list) element = elem element list


-- | Equality on sets (as lists could be in different order, we want [1,2,3]
-- | to represent the same set as [3,2,1])
-- >>> setEquals (Set [1,2,3]) (Set [3,2,1])
-- True
-- >>> setEquals (Set [1,2,3]) (Set [3,2,1,0])
-- False

-- best O(n), worst O(n^2), average O(n^2)
setEquals :: (Eq a) => Set a -> Set a -> Bool
setEquals (Set xs) (Set ys)
    | xs == ys = True -- Ordered the same or empty
    | otherwise = (isSubSet (Set xs) (Set ys)) && (isSubSet (Set ys)(Set xs))

-- | Determine if set1 is a subset of set2
-- >>> isSubSet (Set [1,2,3]) (Set [3,2,1,0])
-- True
-- >>> isSubSet (Set [1,2,3,0]) (Set [3,2,1])
-- False

-- best O(n), worst O(n), average O(n)
isSubSet:: (Eq a) => Set a -> Set a -> Bool
isSubSet set1 set2 = case set1 of
    Set [] -> True
    Set (x:xs) -> (containsElement set2 x) && (isSubSet (Set xs) set2)

-- | Adds an element to a set, if it does not already exist
-- best O(n), worst O(n), average O(n)
addElement :: (Eq a) => a -> Set a -> Set a
addElement elem set
    | set `containsElement` elem = set
    | otherwise = case set of
        Set xs -> Set (elem:xs)

  
-- | Computes the union of two sets (all the elements in at least one of the two sets)
-- >>> sumSet (setUnion (Set [1,2,3]) (Set [4,5,6]))
-- 21
-- >>> sumSet (setUnion (Set [1,2,3]) (Set [1,2,3,4,5,6]))
-- 21
-- >>> sumSet (setUnion (Set [1,2,3]) (Set [1,2,4,5,6]))
-- 21

-- best O(n), worst O(n^2), average O(n^2)
setUnion :: (Eq a) => Set a -> Set a -> Set a
setUnion set1 set2
    | set1 `isSubSet` set2 = set2
    | set2 `isSubSet` set1 = set1
    | otherwise = case (set1, set2) of
        (Set (x:xs), Set ys)
            | set2 `containsElement` x -> setUnion (Set xs) set2
            | otherwise -> setUnion (Set xs) (Set (x:ys))

-- | Sum numerical elements of a set
sumSet :: (Num a) => Set a -> a
sumSet (Set xs) = foldr (+) 0 xs


-- ==================================
--  Functions below are COMP1130 Only
-- ==================================


-- | Removes an element from a set, if it is present
-- best O(?), worst O(?), average O(?)
removeElement :: (Eq a) => a -> Set a -> Set a --1130 
removeElement = undefined

-- | Computes the intersection of two sets (all the elements in both sets)
-- best O(?), worst O(?), average O(?)
setIntersection :: (Eq a) => Set a -> Set a -> Set a --1130
setIntersection = undefined
-- | Computes the set difference (all the elements in the first set, but not the second)
-- best O(?), worst O(?), average O(?)
setDifference :: (Eq a) => Set a -> Set a -> Set a --1130
setDifference = undefined