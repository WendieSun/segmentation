function [J grad] = nnCostFunction_MA(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer1_size, ...
                                   output_layer_size, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1, Theta2, Theta3, the weight matrices
% for our 3 layer neural network
Theta1_size = hidden_layer1_size * (input_layer_size + 1);

Theta1 = reshape(nn_params(1:Theta1_size), ...
                 hidden_layer1_size, (input_layer_size + 1));
             
Theta2 = reshape(nn_params((1 + Theta1_size): end), ...
                 output_layer_size, (hidden_layer1_size + 1));

% number of examples
m = size(X, 1);
         
% initialise return values
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% hidden layer 
a1 = [ones(m, 1) X];
a1 = double(a1');

z2 = Theta1 * a1;
a2 = sigmoid(z2);

% output layer
a2 = [ones(1, size(a2,2)); a2];
z3 = Theta2 * a2;
a3 = sigmoid(z3);
h = a3;

% use a for loop over the examples to compute the cost
s = 0;

for i = 1:m
    h_i = h(i);
    y_i = y(i);
    
    % to compute unregularised cost
    s = s + sum(-y_i .* log(h_i') - (1 - y_i) .* log(1 - h_i'));
    
end 

% regularise cost
J = s/m;
J = J + (lambda / (2 * m)) * ...
    (sum(sum(Theta1(:, 2:end) .^ 2)) ...
    + sum(sum(Theta2(:, 2:end) .^ 2)));



% The backpropagation algorithm to compute the gradients Theta1_grad and 
% Theta2_grad. Return the partial derivatives of the cost function with 
% respect to Theta1 and Theta2 in Theta1_grad and Theta2_grad, respectively. 

% delta_3: num_labels x m
% y: num_labels x m
delta_3 = a3 - y;

% 25 x 10 = (T(25 x 26) * (25 x 10))(2:end, :)
temp = Theta2' * delta_3;
delta_2 = temp(2:end, :) .* sigmoidGradient(z2);

% d_2: 25 x 26 | delta_3: 25 x 10 | a2: 26 x 10
d_2 = delta_3 * a2';

% d_1: 25 x 901 | delta_2: 25 x 10 | a1: 901 x 10
d_1 = delta_2 * a1';
 
Theta1_grad = d_1 ./ m;
Theta2_grad = d_2 ./ m;



% Implement regularization with the cost function and gradients.

% regularise the gradients for theta 1
reg_theta1_grad = Theta1_grad + (lambda / m) * Theta1;
Theta1_grad = [Theta1_grad(:,1) reg_theta1_grad(:, 2:end)];

% regularise the gradients for theta 2
reg_theta2_grad = Theta2_grad + (lambda / m) * Theta2;
Theta2_grad = [Theta2_grad(:,1) reg_theta2_grad(:, 2:end)];

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
