# falsePosition.m

Created by: Sam Floyd\
Created for: Mech 105 Spring 2019

  falsePosition finds the root of a function uses the false position method
  
    This function uses the false position root finding method to find the
    root of any given function.  It requires two inputs which bracket the
    desired root.  It may also be given a stopping criteria and maximum 
    number of iterations, which by default are set to 0.0001% and 200 respectively  
 
  Variables:
  
    Inputs:
      func = name of function
      xl, xu = lower and upper guesses
      es = desired relative error (default = 0.0001%)
      maxiter = maximum allowable iterations (default = 200)
      
    Outputs:
      root = real root
      fx = function value at root
      ea = approximate relative error (%)
      iter = number of iterations
