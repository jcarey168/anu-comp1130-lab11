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
-- O(?), Theta(?), Omega(?)
storage :: Set a -> [a]
storage (Set list) = list

-- | Checks if the underlying data structure is a set (no duplicates)
-- O(?), Theta(?), Omega(?)
isLegalSet :: (Eq a) => Set a -> Bool
isLegalSet (Set list) = list == nub list

-- | Returns the definition for the empty set for this data structure
-- O(?), Theta(?), Omega(?)
emptySet :: Set a
emptySet = Set []

-- | Constructs the set containing one element
-- O(?), Theta(?), Omega(?)
singletonSet :: a -> Set a
singletonSet element = Set [element]

-- | The number of elements in a set.
-- O(?), Theta(?), Omega(?)
setSize :: Integral b => Set a -> b
setSize (Set list) = case list of
  []    -> 0
  _: xs -> 1 + setSize (Set xs)


-- | Equality on sets (as lists could be in different order, we want [1,2,3]
-- | to represent the same set as [3,2,1])
-- O(?), Theta(?), Omega(?)  
setEquals :: (Eq a) => Set a -> Set a -> Bool
setEquals setA setB = case (storage setA, storage setB) of
  ([], []) -> True
  ([], _ ) -> False
  (_,  []) -> False
  (x: xs, _) -> (containsElement setB x) && (Set xs) `setEquals` (removeElement x setB)
  

-- | Checks if an element is present in a set
-- O(?), Theta(?), Omega(?)
containsElement :: (Eq a) => Set a -> a -> Bool
containsElement (Set list) element = element `elem` list

-- | Adds an element to a set, if it does not already exist
-- O(?), Theta(?), Omega(?)
addElement :: (Eq a) => a -> Set a -> Set a
addElement element set = Set (element: (storage (removeElement element set)))

-- | Removes an element from a set, if it is present
-- O(?), Theta(?), Omega(?)
removeElement :: (Eq a) => a -> Set a -> Set a
removeElement element (Set list) = Set (delete element list)
  
-- | Computes the union of two sets (all the elements in at least one of the two sets)
-- O(?), Theta(?), Omega(?)
setUnion :: (Eq a) => Set a -> Set a -> Set a
setUnion (Set listA) (Set listB) = Set (union listA listB)

-- | Computes the intersection of two sets (all the elements in both sets)
-- O(?), Theta(?), Omega(?)
setIntersection :: (Eq a) => Set a -> Set a -> Set a
setIntersection (Set listA) (Set listB) = Set (listA `intersect` listB)

-- | Computes the set difference (all the elements in the first set, but not the second)
-- O(?), Theta(?), Omega(?)
setDifference :: (Eq a) => Set a -> Set a -> Set a
setDifference (Set listA) (Set listB) = Set (listA \\ listB)

-- | Applies a function to each element in the set
-- O(?), Theta(?), Omega(?)
setMap :: (Eq b) => (a -> b) -> Set a -> Set b
setMap f (Set list) = Set (nub (map f list))

-- | Keeps only those elements in the set that satisfy f.
-- O(?), Theta(?), Omega(?)
setFilter :: (a -> Bool) -> Set a -> Set a
setFilter f (Set list) = Set (filter f list)