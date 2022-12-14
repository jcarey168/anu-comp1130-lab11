module BinaryTree where

type BSTree a = BinaryTree a

data BinaryTree a = Null | Node (BinaryTree a) a (BinaryTree a)
    deriving Show


{-
Exercise 5

Copy in your solutions from Lab 09 and Lab 10
(or finish them off if you haven't)

State the complexity class of each function.
They should be written as efficently as possible.
-}

-- Copy in your solutions from Lab 09

-- best O(?), worst O(?), average O(?)
treeSize :: BinaryTree a -> Integer
treeSize = undefined

-- best O(?), worst O(?), average O(?)
treeDepth :: BinaryTree a -> Integer
treeDepth = undefined

-- best O(?), worst O(?), average O(?)
flattenTree :: BinaryTree a -> [a]
flattenTree = undefined

-- best O(?), worst O(?), average O(?)
leavesTree :: BinaryTree a -> [a]
leavesTree = undefined

-- best O(?), worst O(?), average O(?)
treeMap :: (a -> b) -> (BinaryTree a) -> (BinaryTree b)
treeMap = undefined


-- Copy in your solutions from Lab 10

-- best O(?), worst O(?), average O(?)
elemBSTree :: (Ord a) => a -> (BSTree a) -> Bool
elemBSTree = undefined

-- best O(?), worst O(?), average O(?)
treeBSMax :: (Ord a) => BSTree a -> a
treeBSMax = undefined

-- best O(?), worst O(?), average O(?)
treeBSMin :: (Ord a) => BSTree a -> a
treeBSMin = undefined

-- best O(?), worst O(?), average O(?)
isBSTree :: (Ord a) => BinaryTree a -> Bool
isBSTree = undefined

-- best O(?), worst O(?), average O(?)
treeInsert :: (Ord a) => BSTree a -> a -> BSTree a
treeInsert = undefined

-- best O(?), worst O(?), average O(?)
flattenTreeOrd :: BSTree a -> [a]
flattenTreeOrd = undefined 


-- =================================
-- Functions below are COMP1130 only
-- =================================

-- best O(?), worst O(?), average O(?)
treeDelete :: (Ord a) => (BSTree a) -> a -> (BSTree a)
treeDelete = undefined

-- This was an optional exercise, so if you haven't implemented treeBalance, 
-- don't worry about it.
-- best O(?), worst O(?), average O(?)
treeBalance :: (Ord a) => BSTree a -> BSTree a
treeBalance = undefined


{-
Module for drawing nice looking trees
David Quarel 13/02/2019

Don't worry too much about how this works,
or the types of these functions.
It's beyond the scope of this course.

Code modified from
http://hackage.haskell.org/package/containers-0.5.7.1/docs/src/Data.Tree.html#drawTree
-}

printTree :: (Show a) => BinaryTree a -> IO ()
printTree = putStr.unlines.draw

draw :: (Show a) => BinaryTree a -> [String]
draw Null = ["Null"]
draw (Node left x right) = (show x) : drawSubTrees [right,left]
  where
    drawSubTrees [] = []
    drawSubTrees [t] =
        "|" : shift "`- " "   " (draw t)
    drawSubTrees (t:ts) =
        "|" : shift "+- " "|  " (draw t) ++ drawSubTrees ts

    shift first other = zipWith (++) (first : repeat other)


notBSTree :: BinaryTree Integer
notBSTree = Node (Node (Node Null 1 Null) 3 (Node Null 2 Null))
                    5
                 (Node (Node Null 6 Null) 7 (Node Null 9 Null))

-- I've tried my best to textually display the tree in a nice way
-- Sorry if it's more confusing now

goodTree :: BSTree Integer
goodTree =  Node 
                (Node
                    (Node 
                        (Node 
                                Null 
                            1 
                                Null) 
                    3 
                        (Node 
                                Null 
                            5 
                                Null))
                7
                    (Node   
                        (Node 
                                Null 
                            10 
                                Null) 
                    12 
                        (Node 
                                Null 
                            13 
                                Null)))
            15

                (Node 
                    (Node
                        (Node 
                                Null 
                            16 
                                Null) 
                    17 
                        (Node 
                                Null 
                            18 
                                Null))
                23
                    (Node
                        (Node 
                                Null 
                            25 
                                Null) 
                    26 
                        (Node 
                                Null 
                            31 
                                Null)))

badTree :: BSTree Integer
badTree = Node (Node Null 1 Null) 3
            (Node (Node Null 5 Null) 7
                (Node (Node Null 10 Null) 12
                    (Node (Node Null 13 Null) 15
                        (Node (Node Null 16 Null) 17
                            (Node (Node Null 18 Null) 23
                                (Node (Node Null 25 Null) 26
                                        (Node Null 31 Null)))))))

smallTree :: BSTree Integer
smallTree = Node (Node Null 1 Null) 5 (Node Null 10 Null)
