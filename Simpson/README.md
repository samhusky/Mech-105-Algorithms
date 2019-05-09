# Simpson.m

Created by: Sam Floyd\
Created on: 4.19.2019\
Created for: CSU Mech 105 Spring 2019

  Simpson performs 1/3 simpsons rule on a tabulated set of data

    This function takes an equally spaced set of tabulated data and applies the 1/3 simpsons
    rule in order to get a numerical estimate of its integral.  It also performs one iteration
    of the trapezoidal rule if the number of intervals in odd
    
  Variables:
  
    Inputs:
  
      x: Vector of independent data
      y: Vector of dependent data   
    
    Outputs:
  
      I: Numerical estimate of integral for tabulated data
