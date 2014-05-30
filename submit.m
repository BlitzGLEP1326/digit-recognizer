
% load predictions
load('predictions.mat');

% get the number of training examples
m = size(y, 1);

% add a image id column
y = [[1:m]' y];

% write the header
fid = fopen('submission.csv', 'w');
fprintf(fid, 'ImageId,Label\n');
fclose(fid)

% and append the data
csvwrite('submission.csv', y, '-append');
