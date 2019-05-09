# luFactor.m

Created by Sam Floyd\
Created on April 3, 2019\
Created for Mech 105 spring 2019

luFactor applies the LU decomposition method on a square matrix of any size greater than 1x1

    luFactor applies the LU decomposition method on a square matrix
    of any size greater than 1x1.  The purpose of the function is to take
    A, a matrix consisting of all the coefficients of a system of equations,
    and break it up into a correspondent upper triangular matrix U, lower triangular
    matrix L, and the pivot matrix p, which keeps track of the partial
    pivoting included in the process.  This matrices can then be used to
    solve the system of equations using a vector containing the other
    side of the system of equations to solve for the unknowns.

Variables:

    Inputs:
        A: A square matrix at least 2x2 big, consisting of the
        coefficients of a system of equations
        
    Outputs:
        L: The lower triangular matrix
        U: The upper triangular matrix
        P: The pivot matrix
 
