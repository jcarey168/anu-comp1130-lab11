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

Complete all these functions, and state their complexity class
-}

storage :: Set a -> BSTree a
storage = undefined

isLegalSet :: (Eq a) => Set a -> Bool
isLegalSet = undefined

emptySet :: Set a
emptySet = undefined

singletonSet :: a -> Set a
singletonSet = undefined

setSize :: Integral b => Set a -> b
setSize = undefined
  
setEquals :: (Eq a) => Set a -> Set a -> Bool
setEquals = undefined
  
containsElement :: (Eq a) => Set a -> a -> Bool
containsElement = undefined

addElement :: (Eq a) => a -> Set a -> Set a
addElement = undefined
  
setUnion :: (Eq a) => Set a -> Set a -> Set a
setUnion = undefined

setIntersection :: (Eq a) => Set a -> Set a -> Set a
setIntersection = undefined

setDifference :: (Eq a) => Set a -> Set a -> Set a
setDifference = undefined

setMap :: (Eq b) => (a -> b) -> Set a -> Set b
setMap = undefined

setFilter :: (a -> Bool) -> Set a -> Set a
setFilter = undefined

-- removeElement required only for COMP1130

removeElement :: (Eq a) => a -> Set a -> Set a
removeElement = undefined