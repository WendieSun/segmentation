%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
% height = 3000;
% width = 3000;
x_width = 251;
y_width = 251;
lambda = 2;
max_runs = 200;
threshold = 0.5;

% 
% TRAINING_START = 1;
% NUM_OF_TRAINING = 35;
% TEST_START = 36;
% NUM_OF_TEST = 15;


input_layer_size  = x_width * y_width; 
hidden_layer1_size = 30;   % 25 hidden units
% output_layer_size = input_layer_size;
output_layer_size = 1;

%% =========== Part 0: Loading Data =============

% fprintf('\nLoading Data ...\n')
preprocess;
% loadinputs;

% 
% X_training = X(TRAINING_START : TRAINING_START + NUM_OF_TRAINING - 1, :);
% y_training = y(TRAINING_START : TRAINING_START + NUM_OF_TRAINING - 1);
% 
% X_test = X(TEST_START : TEST_START + NUM_OF_TEST - 1, :);
% y_test = y(TEST_START : TEST_START + NUM_OF_TEST - 1);

% pause;

%% ================ Part 1: Initializing Pameters ================
%  In this part of the exercise, you will be starting to implment a two
%  layer neural network that classifies digits. You will start by
%  implementing a function to initialize the weights of the neural network
%  (randInitializeWeights.m)

fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer1_size);
initial_Theta2 = randInitializeWeights(hidden_layer1_size, output_layer_size);


% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];



%% =============== Part 2: Gradient checking ===============
%  Once your backpropagation implementation is correct, you should now
%  continue to implement the regularization with the cost and gradient.
% %
% 
% fprintf('\nChecking Backpropagation (w/ Regularization) ... \n')
% 
% % Check gradients by running checkNNGradients
% lambda = 0.05;
% checkNNGradients_MA(lambda);
%  
% fprintf('Program paused. Press enter to continue.\n');
% % pause;

%% =================== Part 3: Training NN ===================
%  You have now implemented all the code necessary to train a neural 
%  network. To train your neural network, we will now use "fmincg", which
%  is a function which works similarly to "fminunc". Recall that these
%  advanced optimizers are able to train our cost functions efficiently as
%  long as we provide them with the gradient computations.
%
fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', max_runs);

%  You should also try different values of lambda
% lambda = 3;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction_MA(p, ...
                                   input_layer_size, ...
                                   hidden_layer1_size, ...
                                   output_layer_size, X_training, y_training, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);


% Obtain Theta1, Theta2 back from nn_params
Theta1_size = hidden_layer1_size * (input_layer_size + 1);

Theta1 = reshape(nn_params(1:Theta1_size), ...
                 hidden_layer1_size, (input_layer_size + 1));
             
Theta2 = reshape(nn_params((1 + Theta1_size): end), ...
                 output_layer_size, (hidden_layer1_size + 1));

fprintf('Program paused. Press enter to continue.\n');
% pause;


%% ================= Part 4: results =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

% predict 
fprintf('\npredict training dataset: \n');
training_pred = predict_MA(Theta1, Theta2, X_training, threshold);
compare_result(training_pred, y_training, threshold);

fprintf('\npredict new dataset: \n');
test_pred = predict_MA(Theta1, Theta2, X_test, threshold);
compare_result(test_pred, y_test, threshold);

% analysis
training_pred = (training_pred >= threshold);
test_pred = (test_pred >= threshold);
[training_accuracy, training_precision, training_recall, training_F_score] = errorAnalysis(training_pred, y_training);
[test_accuracy, test_precision, test_recall, test_F_score] = errorAnalysis(test_pred, y_test);

% dispay results
fprintf('\nTraining, test set accuracy, precision, recall, F_score: \n');
fprintf('%f\n', training_accuracy * 100);
fprintf('%f\n', training_precision * 100);
fprintf('%f\n', training_recall * 100);
fprintf('%f\n', training_F_score * 100);
fprintf('\n');
fprintf('%f\n', test_accuracy * 100);
fprintf('%f\n', test_precision * 100);
fprintf('%f\n', test_recall * 100);
fprintf('%f\n', test_F_score * 100);


%% ================= Part 5: predict whole image =================
% img_width = 100;
% img_height = 100;
% 
% x_padding = 125;
% y_padding = 125;
% 
% test_img = imread('0.tif');
% test_img = process(test_img);
% test_bin = imread('0_b.tif');
% 
% test_img = test_img(1 : 2 * y_padding + img_height, 1 : 2 * x_padding + img_width);
% test_bin = test_bin(1 : 2 * y_padding + img_height, 1 : 2 * x_padding + img_width);
% 
% n = 1;
% 
% for i = x_padding + 1 : x_padding + img_width
%     for j = y_padding + 1 : y_padding + img_height
%         
%         input = test_img(j - y_padding : j + y_padding, i - x_padding : i + x_padding);
% 
%         test_img_X(n, :) = input(:);
% 
%         n = n + 1;
%         
%     end
% end
%         
% test_pred = predict_MA(Theta1, Theta2, test_img_X, threshold);
% actual_img = test_bin(y_padding + 1 : y_padding + img_height, x_padding + 1 : x_padding + img_width);
% pred_img = reshape(test_pred, img_height, img_width);
% 
% [test_accuracy, test_precision, test_recall, test_F_score] = errorAnalysis(test_pred, actual_img(:));
% 
% fprintf('\n');
% fprintf('%f\n', test_accuracy * 100);
% fprintf('%f\n', test_precision * 100);
% fprintf('%f\n', test_recall * 100);
% fprintf('%f\n', test_F_score * 100);
% 
% 
% figure;
% imshowpair(pred_img, actual_img, 'montage');
% 



%  not equal amount of 1s and 0s in the training sample, will tend to
%  predict everything as 1



