function I = Simpson(x,y)
% Created by: Sam Floyd
% Created on: 4.19.2019
% Created for: CSU Mech 105 Spring 2019
%--------------------------------------------------------------------------
% This function takes a set of tabulated data and applies the 1/3 simpsons
% rule get a numerical estimate, as well as one iteration of the
% trapezoidal rule if the number of intervals in odd
%   Inputs:
%       x: Vector of independent data
%       y: Vector of dependent data
%   Outputs:
%       I: Numerical estimate of integral for tabulated data

if nargin ~= 2  % check on number of inputs
    error('Function requires two inputs')
end

if length(x) ~= length(y)   % check of equal vector lengths
    error('Vectors must be of equal length')
end


% Setting up frequently used variables
len = length(x);
b = x(end);
a = x(1);

% Creating an "optimal" x vector with equal spacing to check input with
spacetest = linspace(x(1),x(end),length(x));

if isequal(x,spacetest) == 0    % Check that x is the same as the test vector
    error('Vector x must be equally spaced')
end

if rem(length(x),2) == 0    % Warning if number of intervals is odd that trap rule will be used for last interval
    warning('The trapezoidal rule will be used for the last interval due to an odd number of intervals')
end

% Variables for height and for loop summation 
h = (b-a)/(length(x)-1);
x4 = 0;
x2 = 0;

if rem(length(x),2) == 1    % Code runs without trap rule if # of intervals are even
    for j=2:2:len   % Sums up all numbers which need to be multiplied by four in the simpsons eq
        x4 = x4 + 4*y(j);
    end
    for i=3:2:len-1 % Sums up all numbers which need to be multiplied by two in the simpsons eq
        x2 = x2 + 2*y(i);
    end
    I = (h/3)*((y(1)+y(length(x))+x4+x2)); % Simpsons eq
end

if rem(length(x),2) == 0    % Code runs with trap rule if # of intervals are odd
    % Cuts off last term of x so simpsons rule can be used on everything but last interval
    % And creates new frequently used variables for it
    xnew = x;
    x(len) = [];
    lennew = length(xnew);
     for j=2:2:lennew-1 % Sums up all numbers which need to be multiplied by four in the simpsons eq
        x4 = x4 + 4*y(j);
    end
    for i=3:2:lennew-2  % Sums up all numbers which need to be multiplied by two in the simpsons eq
        x2 = x2 + 2*y(i);
    end
    I = (h/3)*((y(1)+y(length(x))+x4+x2)); % Simpsons eq
    trap = (y(len)+y(len-1))*h/2;   % Finds area of the last interval using trapezoid rule
    I = I + trap;   % Adds the area of the last interval to the rest found by simpsons
end