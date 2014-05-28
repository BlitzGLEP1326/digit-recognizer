%ONEVSALL trains multiple logistic regression classifiers and returns all
%the classifiers in a matrix all_theta, where the i-th row of all_theta 
%corresponds to the classifier for label i
%   [all_theta] = ONEVSALL(X, y, num_labels, lambda) trains num_labels
%   logisitc regression classifiers and returns each of these classifiers
%   in a matrix all_theta, where the i-th row of all_theta corresponds 
%   to the classifier for label i


function [all_theta] = one_vs_all(X, y, m, n, num_labels, lambda, n_iterations)

	% Add ones to the X data matrix
	X = [ones(m, 1) X];

	% Set Initial theta
	initial_theta = zeros(n + 1, 1);
     
	% Set options for fminunc
	options = optimset('GradObj', 'on', 'MaxIter', n_iterations);

	for c = 1:num_labels
		all_theta(c,:) = fmincg (@(t)(lr_cost_function(t, X, (y == c), m, lambda)), initial_theta, options);	
	endfor
end
