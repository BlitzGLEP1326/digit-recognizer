%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, m, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

function [J, grad] = lr_cost_function(theta, X, y, m, lambda)

	h0 = sigmoid(theta' * X');
	nonRegCost = ((-y' * log(h0)') - (1 - y)' * log(1 - h0)') / m;
	nonRegGrad = ((h0 - y') * X) / m;

	thetaReg = theta;
	thetaReg(1) = 0;

	J = nonRegCost + ((thetaReg' * thetaReg) * (lambda / (2*m)));
	grad = nonRegGrad + (thetaReg * (lambda / m))';

	grad = grad(:);

end
