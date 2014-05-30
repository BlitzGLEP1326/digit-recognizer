
% load predictions
y = load('predictions.mat');

m = size(y, 1);

% add a image id column
y = [[1:m]' y];

csvwrite("submission.csv", y);
