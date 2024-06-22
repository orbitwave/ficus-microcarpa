module Assignment4 where
import Mooc.Todo

{-
In this assignment, you will define a tiny programming language for manipulating integer lists and implement an interpreter for it using the interpreter pattern and combinators in Haskell.

The language supports the following operations:

1. Constant: Represents a constant list literal.
2. Cons: Prepends an element to the front of a list.
3. Head: Returns the first element of a list.
4. Tail: Returns the list without the first element.
5. Append: Concatenates two lists.
6. Map: Applies a function to each element of a list.
7. Filter: Keeps only the elements of a list that satisfy a predicate.
-}

--Part 1: Defining the Language

-- Part 1.a : We are defining the data types representing the abstract syntax tree (AST) of the language.
-- names of Expressions are given you don't need to change anything. You just need to understand what each expression represents
-- you can refer to the lecture slides for such representation


data Expr
  = ConstExpr [Int]
  | ConsExpr Int Expr
  | HeadExpr Expr
  | TailExpr Expr
  | AppendExpr Expr Expr
  | MapExpr (Int -> Int) Expr
  | FilterExpr (Int -> Bool) Expr

-- Part 1.b : Implementing the Interpreter that evaluates an expression and returns the resulting list.
-- Your implementation should cover all Expression types defined above. 

-- For HeadExpr and TailExpr, you should return empty list ([]), if the given list is empty.
-- Normally head and tail of empty list should throw an error. To simplify we return only empty list.

-- Test case 1,2,3,4,5,6, and 7 covers the implementation of the interpreter for each expression type
interpret :: Expr -> [Int]
interpret = todo

{-
Part 2: Implementing Combinators

In this part, you will implement combinators that can be used to construct and manipulate the AST in a more concise and expressive way. 
You will define the following combinators:

1. `myConst`: Constructs a constant list expression.
2. `myCons`: Constructs a `ConsExpr`.
3. `myHead`: Constructs a `HeadExpr`.
4. `myTail`: Constructs a `TailExpr`.
5. `myAppend`: Constructs an `AppendExpr`.
6. `myMap`: Constructs a `MapExpr`.
7. `myFilter`: Constructs a `FilterExpr`.
-}

-- Test case 8
myConst :: [Int] -> Expr
myConst = todo

-- Test case 9
myCons :: Int -> Expr -> Expr
myCons = todo

-- Test case 10
myHead :: Expr -> Expr
myHead = todo

-- Test case 11
myTail :: Expr -> Expr
myTail = todo

-- Test case 12
myAppend :: Expr -> Expr -> Expr
myAppend = todo

-- Test case 13
myMap :: (Int -> Int) -> Expr -> Expr
myMap = todo

-- Test case 14
myFilter :: (Int -> Bool) -> Expr -> Expr
myFilter = todo

-- Example Usage to test your implementation
main :: IO ()
main = do
  -- Construct the list [1, 2, 3, 4, 5]
  let list1 = myCons 1 (myCons 2 (myCons 3 (myCons 4 (myCons 5 (myConst [])))))
  print (interpret list1)  -- Output: [1,2,3,4,5]

  -- Get the head and tail of the list
  print (interpret (myHead list1))  -- Output: [1]
  print (interpret (myTail list1))  -- Output: [2,3,4,5]

  -- Append two lists
  let list2 = myConst [6, 7, 8]
  let list3 = myAppend list1 list2
  print (interpret list3)  -- Output: [1,2,3,4,5,6,7,8]

  -- Map a function over a list
  let list4 = myMap (* 2) list1
  print (interpret list4)  -- Output: [2,4,6,8,10]

  -- Filter a list based on a predicate
  let list5 = myFilter even list1
  print (interpret list5)  -- Output: [2,4]

  -- Handle error case: taking the head of an empty list, will return empty list
  print (interpret (myHead (myConst [])))  -- Output: []

  -- Handle error case: taking the tail of an empty list, will return empty list
  print (interpret (myTail (myConst [])))  -- Output: []

-- Important note, normally head and tail of empty list should throw an error. To simplify we return only empty list