function[X,Y]=warmUp_3()
% A= warmUp_2 is an exercise wherein we need to find & return the greatest of two numbers 
% ========= BEGIN YOUR CODE HERE ===========
A=[1 2 3; 4 5 6; 7 8 9]; %DEFINE A MATRIX BY ENTERING VALUES WITHIN THE SQUARED BRACKETS
X= A.^2;  %WRITE THE CODE TO SQUARE THE CONTENTS OF THE MATRIX A
Y= pinv(A) %WRITE THE CODE TO FIND THE INVERSE THE MATRIX A
% ============== END ========================
end
