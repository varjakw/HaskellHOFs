{-We will prove length (1:2:3:[]) == 3

To do so, we will need the definiton of length, and some laws about equality.
-}

{-length of empty list is 0-}
length [] = 0                     -- length.1

{-length of list with head and tail is 1 + length of tail-}
length (_:xs) = 1 + length xs     -- length.2

{-Equality Laws-}
x == x = True                      -- ==-refl    (exitivity)
x == y = y == x                    -- ==-comm    (utativity)
x == y && y == z ==> x == z        -- ==-trans   (itivity)

{-Each definition clause and law gets a "name" seen on the right.

We also need a proof strategy, the simplest of which is "Reduce to True" i.e.
the use of laws/defs to transform the initial predicate to True

We are relying on Referential Transparency here, and matching. Given law lhs == rhs,
we have three options:

1: match whole law against some sub-expression and replace that by True
2: match lhs against some sub-expression and replace that by rhs
3: match rhs against some sub-expression and replace that by lhs

For proofs, we use a more general form of matching similar to pattern-matching

We match one expression (law) against another expression (goal). The structure
of the goal expr must match that of the law.

A proof is a series of expressions, seperated by a comment identifying which law
or definition clause was used, the (sub-)expression to which it was applied and
if the lhs of a law is used, then we note that we applied the law left-to-right.
Vice versa for rhs of a law.
-}

length (1:2:3:[]) == 3
  = "length.2, left2right, at 1st occurrence of length"
  
1 + length (2:3:[]) == 3
  = "length.2, left2right, at 1st occurence of length"
  
1 + (1 + length (3:[])) == 3
  = "length.2, left2right, at 1st occurence of length"
  
1 + (1 + (1 + length [])) == 3
  = "length.1, left2right, at 1st occurence of length"
  
1 + (1 + (1 + 0)) == 3
  = "simplify"
 
3 == 3
  = "==-refl"

True


{-
We have other proof strategies when our goal has the form smth = smthElse:

1: Reduce Left to Right: start with the left side (smth) and transform it into
the right side (smthElse)
2: Reduce Right to Left: start with the right side (smthElse) and transform it into
the left side (smth)

Revisiting our proof, using Reduce Left to Right:
-}

length (1:2:3:[])
  = "length.2, left2right, at 1st occurrence of length"
  
1 + length (2:3:[])
  = "length.2, left2right, at 1st occurence of length"
  
1 + (1 + length (3:[]))
  = "length.2, left2right, at 1st occurence of length"
  
1 + (1 + (1 + length []))
  = "length.1, left2right, at 1st occurence of length"
  
1 + (1 + (1 + 0))
  = "simplify"
 
3 

{-Can also be done using Reduce Right to Left:-}

3
  = "complexify"
 
1 + (1 + (1 + 0))
  = "length.1, left2right, at 1st occurence of 0"
  
1 + (1 + (1 + length []))
  = "length.2, left2right, at 1st occurence of +"
  
1 + (1 + length (3:[]))
  = "length.2, left2right, at 1st occurence of +"
  
1 + length (2:3:[])
  = "length.2, left2right, at 1st occurence of +"
  
length (1:2:3:[])
