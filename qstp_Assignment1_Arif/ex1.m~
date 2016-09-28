%% qSTP Exercise 1: Linear Regression
%  Instructions
%  ------------------------------------------------------------------
%  This file contains code that helps you get started on the
%  linear exercise. You will need to complete the following functions 
%  in this exercise:
%
%     warmUp_1.m
%     warmUp_2.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%
% DO NOT EDIT/ADD THIS FILE (ex1.m)
% THIS IS A COMPLETE FILE AND IS THERE JUST FOR YOUR REFERNECE
% HOWEVER YOU NEED TO EDIT THE REST 4 FILES (MENTIONED ABOVE)
%
% x refers to the population size in 10,000s
% y refers to the profit in $10,000s
%

%% Initialization
clear all; close all; clc

%% ==================== Part 1: Basic Function ====================
% Complete warmUpExercise.m 
fprintf('Running warmUp_1 ... \n');
warmUp_1(2,3)

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('Running warmUp_2 ... \n');
warmUp_2()

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ======================= Part 2: Plotting =======================
fprintf('Plotting Data ...\n')
data = csvread('ex1data1.txt');
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples

% Plot Data
% Note: You have to complete the code in plotData.m
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 3: Gradient descent ===================
fprintf('Running Gradient Descent ...\n')

X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
iterations = 1000;
alpha = 0.01;

% compute and display initial cost
computeCost(X, y, theta) % Note: You have to complete the code in ComputeCost.m

% run gradient descent
theta = gradientDescent(X, y, theta, alpha, iterations); % Note: You have to complete the code in gradientDescent.m

% print theta to screen
fprintf('Theta found by gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;
