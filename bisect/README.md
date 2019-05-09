# bisect.m

Created by: Sam Floyd\
Created for: Mech 105 Spring 2019

  bisect finds the root of a function uses the bisection method
  
    This function uses the bisection root finding method to find the
    root of any given function.  It requires two inputs which bracket the
    desired root.  It may also be given a stopping criteria and maximum 
    number of iterations, which by default are set to 0.0001% and 50 respectively  
 
  Variables:
  
    Inputs:
      func = name of function
      xl, xu = lower and upper guesses
      es = desired relative error (default = 0.0001%)
      maxit = maximum allowable iterations (default = 50)
      p1,p2,... = additional parameters used by func
      
    Outputs:
      root = real root
      fx = function value at root
      ea = approximate relative error (%)
      iter = number of iterations
