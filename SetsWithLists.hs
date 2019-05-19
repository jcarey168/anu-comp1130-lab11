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


-- | Extracts the underlying data structure for the set
-- best O(?), worst O(?), average O(?)
storage :: Set a -> [a]
storage (Set list) = list


-- | Checks if an element is present in a set
-- best O(1), worst O(n), average O(n)
containsElement :: (Eq a) => Set a -> a -> Bool
containsElement (Set list) element = elem element list


-- | Equality on sets (as lists could be in different order, we want [1,2,3]
-- | to represent the same set as [3,2,1])
-- best O(?), worst O(?), average O(?)  
setEquals :: (Eq a) => Set a -> Set a -> Bool
setEquals = undefined --TODO


-- | Adds an element to a set, if it does not already exist
-- best O(?), worst O(?), average O(?)
addElement :: (Eq a) => a -> Set a -> Set a
addElement = undefined

  
-- | Computes the union of two sets (all the elements in at least one of the two sets)
-- best O(1), worst O(?), average O(?)
setUnion :: (Eq a) => Set a -> Set a -> Set a
setUnion = undefined

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