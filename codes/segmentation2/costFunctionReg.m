function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
% fprintf('grad dimensions: %d, %d', size(grad,1),size(grad,2));
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% first part is the same as non-regularised cost function
[J, grad] = costFunction(theta, X, y);
% here!!!!! 

% add the additional terms to cost and gradient
J = J + sum(theta(2:size(theta),:).^2) * lambda / 2 / m;

% grad(1) and the rest has to be treated differently
grad1 = grad + theta * lambda / m;
grad = vertcat(grad(1,:), grad1(2:size(theta),:));

% =============================================================

end
