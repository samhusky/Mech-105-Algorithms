function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
if nargin < 3   %Error for not entering minimum inputs
    error('This function requires 3-5 inputs')
end
if nargin < 4   %Auto sets es as 0.0001% if not specified  
    es = 0.0001;
end
if nargin < 5   %Auto sets maxiter to 200 if not specified
    maxiter = 200;
end

iter = 0;   %Starting count for iterations
fxl = func(xl); %Function value at lower bound
fxu = func(xu); %Function value at upper bound
rootsv = [];    %Empty vector to store all root guesses
ea = 100;   %Starting value for error check

if (fxl*fxu) > 0    %Error for not bracketing a root
    error('The bounds must bracket a root')
end

while ea > es   %Loop to keep running until error% is less than specified
    if iter >= maxiter  %Break while loop if # of iterations exceeds maxiter
        break
    end
   iter = iter + 1; %Count iterations
   root = xu - ((fxu*(xl-xu))/(fxl-fxu));   %Calculate new root using lower and upper bound
   rootsv(iter) = root; %Put new root into vector
   if iter > 1  %Calculate approximate relative error
    ea = abs((rootsv(iter) - rootsv(iter-1))/rootsv(iter)) * 100;
   end
   fx = func(root); %Function value at root guess
   
   if (fxl*fx) < 0  %Check to see is xl and root are bracketing root
       xu = root;   %If true replace xu with root
   elseif (fxu*fx) < 0  %%Check to see is xu and root are bracketing root
       xl = root;   %If true replace xl with root
   end 
end
%Print outputs
fprintf('Estimated root: %f\nFunction value at root: %f\nApproximate relative error: %f\nNumber of iterations: %f\n',root,fx,ea,iter)
end

