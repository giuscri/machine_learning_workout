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

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
h = @(theta, x) (sigmoid(transpose(theta) * x));

cost = @(x, y) ( ...
	-1 * y * log(h(theta, x)) - (1 - y) * log(1 - h(theta, x)) ...
);

costs = [];
for i = 1:m
	costs = [costs, cost(transpose(X(i, :)), y(i))];
end

J = 0;
for j = 2:length(theta)
	J += theta(j) ^ 2;
end
J *= lambda / (2 * m);
J += sum(costs) / m;

for i = 1:m
	grad(1) += 1 / m * (h(theta, transpose(X(i, :))) - y(i)) * X(i, 1);
end

for j = 2:length(theta)
	grad(j) = lambda / m * theta(j);

	for i = 1:m
		grad(j) += 1 / m * (h(theta, transpose(X(i, :))) - y(i)) * X(i, j);
	end
end

% =============================================================

end
