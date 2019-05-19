module SetsWithTrees where

import BinaryTree

data Set a = Set (BSTree a)
   deriving Show

{-
Exercise 6

Complete all these functions, and state their complexity class.

COMP1100:   setEquals, 
            addElement, 
            setUnion

COMP1130:   setEquals, 
            addElement, 
            setUnion, 
            removeElement, 
            setIntersection, 
            setDifference
-}



-- | Returns the definition for the empty set for this data structure
-- best O(?), worst O(?), average O(?)
emptySet :: Set a
emptySet = Set Null


-- | The number of elements in a set.
-- best O(?), worst O(?), average O(?)
setSize :: Integral b => Set a -> b
setSize (Set tree) = treeSize tree 


-- | Checks if an element is present in a set
-- best O(?), worst O(?), average O(?)
containsElement :: (Eq a) => Set a -> a -> Bool
containsElement (Set tree) = treeElem tree


-- | Equality on sets (as lists could be in different order, we want [1,2,3]
-- | to represent the same set as [3,2,1])
-- best O(?), worst O(?), average O(?)    
setEquals :: (Eq a) => Set a -> Set a -> Bool
setEquals = undefined


-- | Adds an element to a set, if it does not already exist
-- best O(?), worst O(?), average O(?)
addElement :: (Eq a) => a -> Set a -> Set a
addElement = undefined
  

-- | Computes the union of two sets (all the elements in at least one of the two sets)
-- best O(?), worst O(?), average O(?)
setUnion :: (Eq a) => Set a -> Set a -> Set a
setUnion = undefined

-- =================================
-- Functions below are COMP1130 Only
-- =================================

-- | Removes an element from a set, if it is present
-- best O(?), worst O(?), average O(?)
removeElement :: (Eq a) => a -> Set a -> Set a
removeElement = undefined

-- | Computes the intersection of two sets (all the elements in both sets)
-- best O(?), worst O(?), average O(?)
setIntersection :: (Eq a) => Set a -> Set a -> Set a
setIntersection = undefined

-- | Computes the set difference (all the elements in the first set, but not the second)
-- best O(?), worst O(?), average O(?)
setDifference :: (Eq a) => Set a -> Set a -> Set a
setDifference = undefined





