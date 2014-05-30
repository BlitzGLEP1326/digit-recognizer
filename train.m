%% Initialization
clear ; close all; clc

pixel_height = 28;
pixel_width = 28;
num_labels = 10;          % 10 labels, from 1 to 10   
					
% Load Training Data
%fprintf('Loading data ...\n')
%data = load("data/small_train.csv");
data = load("data/train.csv");

% first column are the labels
y = data(:, 1);
% (note that we have mapped "0" to label 10)
y(y == 0) = 10;

% from the second until the end are the features
X = data(:, 2:end);

% get the number of training examples
m = size(X, 1);
% and the number of features
n = size(X, 2);

% Randomly select 100 data points to display
%rand_indices = randperm(m);
%sel = X(rand_indices(1:100), :);

%fprintf('Visualizing data ...\n')
%display_digits(sel);

% parameters for one vs all
lambda = 0.1;
n_iterations = 50;

% find theta
[all_theta] = one_vs_all(X, y, m, n, num_labels, lambda, n_iterations);
% and save it for future use
save("all_theta.mat", "all_theta");
