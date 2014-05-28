%% Initialization
clear ; close all; clc

% load the test data
data = load("data/test.csv");

% the test data it no labelled, it only contains features
X = data;

% get the number of training examples
m = size(X, 1);
% and the number of features
n = size(X, 2);

% load previously found theta
load('all_theta.mat');

predictions = predict_one_vs_all(all_theta, X, m, num_labels);
