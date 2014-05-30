%% Initialization
clear ; close all; clc

num_labels = 10;          % 10 labels, from 1 to 10   

% load the test data
fprintf('Loading test data...')
data = load("data/test.csv");
%data = load("data/test_small.csv");
fprintf('done.\n');

% the test data it no labelled, it only contains features
X = data;

% get the number of training examples
m = size(X, 1);
% and the number of features
n = size(X, 2);

% load previously found theta
load('all_theta.mat');

fprintf('making predictions...')
y = predict_one_vs_all(all_theta, X, m, num_labels);
fprintf('done.\n');

% we now must convert the label 10 which is actually 0
y(y == 10) = 0;

save("predictions.mat", "y");
