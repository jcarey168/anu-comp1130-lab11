module BinaryTree(
    BinaryTree(Null, Node),
    BSTree, 
    treeSize,       -- :: BinaryTree a -> Integer
    treeDepth,      -- :: BinaryTree a -> Integer
    flattenTree,    -- :: BinaryTree a -> [a]
    leavesTree,     -- :: BinaryTree a -> [a]
    treeMap,        -- :: (a -> b) -> (BinaryTree a) -> (BinaryTree b)
    elemBSTree,     -- :: (Ord a) => a -> (BSTree a) -> Bool
    treeBSMax,      -- :: (Ord a) => BSTree a -> a
    treeBSMin,      -- :: (Ord a) => BSTree a -> a
    isBSTree,       -- :: (Ord a) => BinaryTree a -> Bool
    treeInsert,     -- :: (Ord a) => BSTree a -> a -> BSTree a
    flattenTreeOrd, -- :: BSTree a -> [a]
    treeDelete,     -- :: (Ord a) => (BSTree a) -> a -> (BSTree a)
    treeBalance,    -- :: (Ord a) => BSTree a -> BSTree a
    printTree       -- :: (Show a) => BinaryTree a -> IO ()
) where

type BSTree a = BinaryTree a

data BinaryTree a = Null | Node (BinaryTree a) a (BinaryTree a)
    deriving Show


{-
Exercise 5

Copy in your solutiosn from Lab 09 and Lab 10
(or finish them off if you haven't)

State the complexity class of each function.
They should be written as efficently as possible.
-}

-- Copy in your solutions from Lab 09

-- O(?), Theta(?), Omega(?)
treeSize :: BinaryTree a -> Integer
treeSize = undefined

-- O(?), Theta(?), Omega(?)
treeDepth :: BinaryTree a -> Integer
treeDepth = undefined

-- O(?), Theta(?), Omega(?)
flattenTree :: BinaryTree a -> [a]
flattenTree = undefined

-- O(?), Theta(?), Omega(?)
leavesTree :: BinaryTree a -> [a]
leavesTree = undefined

-- O(?), Theta(?), Omega(?)
treeMap :: (a -> b) -> (BinaryTree a) -> (BinaryTree b)
treeMap = undefined


-- Copy in your solutions from Lab 10

-- O(?), Theta(?), Omega(?)
elemBSTree :: (Ord a) => a -> (BSTree a) -> Bool
elemBSTree = undefined

-- O(?), Theta(?), Omega(?)
treeBSMax :: (Ord a) => BSTree a -> a
treeBSMax = undefined

-- O(?), Theta(?), Omega(?)
treeBSMin :: (Ord a) => BSTree a -> a
treeBSMin = undefined

-- O(?), Theta(?), Omega(?)
isBSTree :: (Ord a) => BinaryTree a -> Bool
isBSTree = undefined

-- O(?), Theta(?), Omega(?)
treeInsert :: (Ord a) => BSTree a -> a -> BSTree a
treeInsert = undefined

-- O(?), Theta(?), Omega(?)
flattenTreeOrd :: BSTree a -> [a]
flattenTreeOrd = undefined


-- O(?), Theta(?), Omega(?)
treeDelete :: (Ord a) => (BSTree a) -> a -> (BSTree a)
treeDelete = undefined

-- This was an optional exercise, so if you haven't implemented treeBalance, 
-- don't worry about it.
-- O(?), Theta(?), Omega(?)
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
