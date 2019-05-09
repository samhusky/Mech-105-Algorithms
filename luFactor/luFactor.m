function [L,U,P] = luFactor(A)
% Created by Sam Floyd
% Created on April 3, 2019
% Created for Mech 105 spring 2019
% -------------------------------------------------------------------------
% luFactor applies the LU decomposition method on a square matrix of any size greater than 1x1
%
    % luFactor applies the LU decomposition method on a square matrix
    % of any size greater than 1x1.  The purpose of the function is to take 
    % A, a matrix consisting of all the coefficients of a system of equations, 
    % and break it up into a correspondent upper triangular matrix U, lower triangular
    % matrix L, and the pivot matrix p, which keeps track of the partial
    % pivoting included in the process.  This matrices can then be used to
    % solve the system of equations using a vector containing the other
    % side of the system of equations to solve for the unknowns.
%
%Variables:
%
    % Inputs:
        % A: A square matrix at least 2x2 big, consisting of the
        % coefficients of a system of equations
        %
    % Outputs:
        % L: The lower triangular matrix
        % U: The upper triangular matrix
        % P: The pivot matrix
 
[M,N] = size(A);

% errors to check the number of inputs, and if the input is a square matrix
% at least 2x2 big
if nargin ~= 1
   error('The function requires exactly one input')
end

if M < 2 || N < 2
    error('The imputed matrix must be at least 2 by 2')
end

if M ~= N
    error('The input must be a square matrix (same number of rows and columns)')
end

 
L = eye(M); % Sets L equal to an identity matrix which is the same size as A
P = eye(M); % Creates a pivot matrix equal to an identity matrix which is the same size as A
U = A;  % Creates a matrix for U which starts out identical to A
j = 1;  % An index variable for modifying a for loop
for i = j:M % Loops entire process the same number of times as the A matrix is big
    for k = j:M % Loops the pivot process 
        if abs(U(i,1)) < abs(U(k,1)) % Checks if the current pivot element is the largest in its column         
            temprow = U(i,:); % Creates a temporary row so the other can be replaced
            U(i,:) = U(k,:); % Switches rows of pivot element and greatest coefficient
            U(k,:) = temprow; % Switches rows of pivot element and greatest coefficient
            
            temprow = P(i,:); % Same as above but for the pivot matrix
            P(i,:) = P(k,:); %                   |
            P(k,:) = temprow; %                  V
        end
    end
    for p = i+1:M % Loops ratio and elimination step for required rows only
        L(p,i) = U(p,i) / U(i,i); % Finds the required factors the current columns coefficients and places it into its proper L element
        U(p,:) = U(p,:) - L(p,i) * U(i,:); % Eliminates / changes the current coefficients of U in question
    end
j = j + 1; % Adds one to the index variable used in multiple for loops
end