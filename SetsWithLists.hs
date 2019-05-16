module SetsWithLists ( 
   Set,             -- Set a = Set [a]
   storage,         -- :: Set a -> [a]
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

import Data.List

data Set a = Set [a]
   deriving Show

-- | Extracts the underlying data structure for the set
-- best O(?), worst O(?), average O(?)
storage :: Set a -> [a]
storage (Set list) = list

-- | Checks if the underlying data structure is a set (no duplicates)
-- best O(?), worst O(?), average O(?)
isLegalSet :: (Eq a) => Set a -> Bool
isLegalSet (Set list) = list == nub list

-- | Returns the definition for the empty set for this data structure
-- best O(?), worst O(?), average O(?)
emptySet :: Set a
emptySet = Set []

-- | Constructs the set containing one element
-- best O(?), worst O(?), average O(?)
singletonSet :: a -> Set a
singletonSet element = Set [element]

-- | The number of elements in a set.
-- best O(?), worst O(?), average O(?)
setSize :: Integral b => Set a -> b
setSize (Set list) = case list of
  []    -> 0
  _: xs -> 1 + setSize (Set xs)


-- | Equality on sets (as lists could be in different order, we want [1,2,3]
-- | to represent the same set as [3,2,1])
-- best O(?), worst O(?), average O(?)  
setEquals :: (Eq a) => Set a -> Set a -> Bool
setEquals setA setB = case (storage setA, storage setB) of
  ([], []) -> True
  ([], _ ) -> False
  (_,  []) -> False
  (x: xs, _) -> (containsElement setB x) && setEquals (Set xs) (removeElement x setB)
  

-- | Checks if an element is present in a set
-- best O(?), worst O(?), average O(?)
containsElement :: (Eq a) => Set a -> a -> Bool
containsElement (Set list) element = element `elem` list

-- | Adds an element to a set, if it does not already exist
-- best O(?), worst O(?), average O(?)
addElement :: (Eq a) => a -> Set a -> Set a
addElement element set = Set (element: (storage (removeElement element set)))

-- | Removes an element from a set, if it is present
-- best O(?), worst O(?), average O(?)
removeElement :: (Eq a) => a -> Set a -> Set a
removeElement element (Set list) = Set (delete element list)
  
-- | Computes the union of two sets (all the elements in at least one of the two sets)
-- best O(?), worst O(?), average O(?)
setUnion :: (Eq a) => Set a -> Set a -> Set a
setUnion (Set listA) (Set listB) = Set (union listA listB)

-- | Computes the intersection of two sets (all the elements in both sets)
-- best O(?), worst O(?), average O(?)
setIntersection :: (Eq a) => Set a -> Set a -> Set a
setIntersection (Set listA) (Set listB) = Set (intersect listA listB)

-- | Computes the set difference (all the elements in the first set, but not the second)
-- best O(?), worst O(?), average O(?)
setDifference :: (Eq a) => Set a -> Set a -> Set a
setDifference (Set listA) (Set listB) = Set (listA \\ listB)

-- | Applies a function to each element in the set
-- best O(?), worst O(?), average O(?)
setMap :: (Eq b) => (a -> b) -> Set a -> Set b
setMap f (Set list) = Set (nub (map f list))

-- | Keeps only those elements in the set that satisfy f.
-- best O(?), worst O(?), average O(?)
setFilter :: (a -> Bool) -> Set a -> Set a
setFilter f (Set list) = Set (filter f list)