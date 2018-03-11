function pred = predict(Theta1, Theta2, X, threshold, y)
%PREDICT Predict the label of an input given a trained neural network

% useful information
m = size(X, 1);
num_labels = size(Theta2, 1);

% hidden layer 
a1 = double([ones(m, 1) X]);
a1 = double(a1');
z2 = Theta1 * a1;
a2 = sigmoid(z2);

% predicted output
a2 = [ones(1, size(a2,2)); a2];
z3 = Theta2 * a2;
a3 = sigmoid(z3);

pred = a3;


% print out prediction 
% for i = 1 : m
%     fprintf('example %d: pred: %f -> %d, actual %d\n', i, pred(i), (pred(i)>=0.5), y(i));




end
