module SetsWithTrees ( 
   Set,             -- Set a = BSTree a
   storage,         -- :: Set a -> BSTree a
   isLegalSet,      -- :: (Eq a) => Set a -> Bool
   emptySet,        -- :: Set a
   singletonSet,    -- :: a -> Set a
   setSize,         -- :: Integral b => Set a -> b
   setEquals,       -- :: (Eq a) => Set a -> Set a -> Bool
   containsElement, -- :: (Eq a) => Set a -> a -> Bool
   addElement,      -- :: (Eq a) => a -> Set a -> Set a
   removeElement,   -- :: (Eq a) => a -> Set a -> Set a
   setUnion,        -- :: (Eq a) => Set a -> Set a -> Set a
   setIntersection, -- :: (Eq a) => Set a -> Set a -> Set a
   setDifference,   -- :: (Eq a) => Set a -> Set a -> Set a
   setMap,          -- :: (Eq b) => (a -> b) -> Set a -> Set b
   setFilter        -- :: (a -> Bool) -> Set a -> Set a
) where

import BinaryTree

data Set a = Set (BSTree a)
   deriving Show

{-
Exercise 6

Complete all these functions, and state their complexity class.
-}


-- | Extracts the underlying data structure for the set
-- best O(?), worst O(?), average O(?)
storage :: Set a -> BSTree a
storage = undefined

-- | Checks if the underlying data structure is a set (no duplicates)
-- best O(?), worst O(?), average O(?)
isLegalSet :: (Eq a) => Set a -> Bool
isLegalSet = undefined

-- | Returns the definition for the empty set for this data structure
-- best O(?), worst O(?), average O(?)
emptySet :: Set a
emptySet = undefined

-- | Constructs the set containing one element
-- best O(?), worst O(?), average O(?)
singletonSet :: a -> Set a
singletonSet = undefined

-- | The number of elements in a set.
-- best O(?), worst O(?), average O(?)
setSize :: Integral b => Set a -> b
setSize = undefined

-- | Equality on sets (as lists could be in different order, we want [1,2,3]
-- | to represent the same set as [3,2,1])
-- best O(?), worst O(?), average O(?)    
setEquals :: (Eq a) => Set a -> Set a -> Bool
setEquals = undefined

-- | Checks if an element is present in a set
-- best O(?), worst O(?), average O(?)
containsElement :: (Eq a) => Set a -> a -> Bool
containsElement = undefined

-- | Adds an element to a set, if it does not already exist
-- best O(?), worst O(?), average O(?)
addElement :: (Eq a) => a -> Set a -> Set a
addElement = undefined
  
-- | Removes an element from a set, if it is present
-- best O(?), worst O(?), average O(?)
removeElement :: (Eq a) => a -> Set a -> Set a
removeElement = undefined

-- | Computes the union of two sets (all the elements in at least one of the two sets)
-- best O(?), worst O(?), average O(?)
setUnion :: (Eq a) => Set a -> Set a -> Set a
setUnion = undefined

-- | Computes the intersection of two sets (all the elements in both sets)
-- best O(?), worst O(?), average O(?)
setIntersection :: (Eq a) => Set a -> Set a -> Set a
setIntersection = undefined

-- | Computes the set difference (all the elements in the first set, but not the second)
-- best O(?), worst O(?), average O(?)
setDifference :: (Eq a) => Set a -> Set a -> Set a
setDifference = undefined

-- | Applies a function to each element in the set
-- best O(?), worst O(?), average O(?)
setMap :: (Eq b) => (a -> b) -> Set a -> Set b
setMap = undefined

-- | Keeps only those elements in the set that satisfy f.
-- best O(?), worst O(?), average O(?)
setFilter :: (a -> Bool) -> Set a -> Set a
setFilter = undefined  









