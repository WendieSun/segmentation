function pred = predict_MA(Theta1, Theta2, X, y, threshold)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% size of the image
WIDTH = 251;
HEIGHT = 251;

% m: number of samples
m = size(X, 1);

num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
% size of X: 900 * 10

% hidden layer 1
a1 = double([ones(m, 1) X]);
a1 = double(a1');
z2 = Theta1 * a1;
a2 = sigmoid(z2);

% hidden layer 2
a2 = [ones(1, size(a2,2)); a2];
z3 = Theta2 * a2;
a3 = sigmoid(z3);


pred = (a3 >= threshold);
% pred = pred';

for i = 1 : m
    fprintf('example %d: pred: %f -> %d, actual %d\n', i, a3(i), pred(i), y(i));
% display images
% for i = 1 :4
%     original = imread(strcat(num2str(i), '.tif'));
%     prediction = reshape(pred(i, :), WIDTH, HEIGHT);
%     actual = reshape(y(i, :), WIDTH, HEIGHT);
%     
%     prediction = reshape(pred(i, :), WIDTH, HEIGHT);
%     actual = reshape(y(i, :), WIDTH, HEIGHT);
%     
%     figure;
%     imshow(original);
%     title('grayscale');
%     
%     figure;
%     imshow(prediction);
%     title('prediction');
% 
%     figure;
%     imshow(actual);
%     title('actual');
    
% end


end
