# HaskellHOFs
Higher-Order Functions in Haskell; capturing common behaviours among functions.

See https://github.com/varjakw/LaTeXNotes/blob/main/ThirdYear/FunctionalProgramming/Week%209.pdf

https://learnyouahaskell.com

# Introduction  
Haskell functions can take functions as parameters and return them as values. A function that does either of those is called a hgiher-order function (HOF). 

## Curried Functions  
Every function in Haskell officially onlt takes one parameter. In order to define and use functions that take more than one parameter, we have used curried functions.

Look at the ```max``` function. It looks like it takes two parameters and returns the one thats bigger. Doing ```max 4 5``` first creates a function that takes a parameter and returns either ```4``` or that parameter, depending on which is bigger. Then, ```5``` is applied to that function and that function produces our result.  

The following two calls are equivalent:
```
max 4 5
(max 4) 5
```

Examining the type of max:  
```
max :: (Ord a) => a -> a -> a.  
```  
Which can also be written as:  
```
max :: (Ord a) => a -> (a -> a)
```  
This could be read as: ```max``` takes an ```a``` and returns a function that takes an ```a``` and returns an ```a```. Thats why the return type and the parameters of functions are all simply seperated with arrows.

This is beneficial because we can call a function with too few parameters and get back a partially applied function, i.e. a function that takes as many parameters as we left out. Using partial application is a way to create functions on the fly so we cam pass them to another function.  
  
Take a look at this simple function:
```
multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z
```  
Realise that this function's type could also be written as:
```
multThree :: (Num a) => a -> (a -> (a -> a))
```  
So our function takes an ```a``` and returns a function of type ```(Num a) => a -> (a -> a)```. Similarly, this function takes an ```a``` and returns a function of type ```(Num a) => a -> a```. And this function, finally, just takes an ```a``` and returns an ```a```.

What actually happens when we do ```multThree 3 5 9```, is that firstly ```3``` is applied to ```multThree```,because they're seperated y a space. That creates a function that takes one parameter and returns a function. So then ```5``` is appleid to that, which creates a function that will take a parameter and multiply it by 15. ```9``` is applied to that function and the result is 135. 
  
  



