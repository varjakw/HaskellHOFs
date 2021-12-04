{-We will prove length (xs++ys) = length xs + length ys

Lists are defined inductively as either [] or x:xs, where xs is a pre-existing list.

We do an inductive proof on xs

P(xs) ≙ length (xs++ys) = length xs + length ys

Why not do induction with ys instead?
-}

{-Base Case-}
P([])
  = "expand P"
 
length ([]++ys) = length [] + length ys
  = "Defs of ++ and length"
  
length ys = 0 + length ys
  = "arithmetic"
  
length ys = length ys
  = "reflexivity of ="
  
True

{-Inductive Step
Assume P(xs) i.e. kength (xs++ys) = length xs + length ys

Show P(x:xs)
-}

P(x:xs)
  = "expand P"
 
length ((x:xs)++ys) = length (x:xs) + length ys
  = "Defs of ++ and length"
  
length (x:(xs++ys)) = (1 + length xs) + length ys
  = "Defs of length, + is associative"
  
1 + length (xs++ys) = 1 + (length xs + length ys)
  = "arithmetic"
  
length (xs++ys) = length xs + length ys
  = "by induction hypothesis"
  
True

{-We can use prfchk to check induction proofs. See Theory file-}
