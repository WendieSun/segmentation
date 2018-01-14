%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise

padding = 100;
width = 2 * padding + 1;

lambda = 2;
max_runs = 200;
threshold = 0.5;

input_layer_size  = width * width; 
hidden_layer1_size = 25;  
output_layer_size = 1;

%% Loading Data 

loadInput;

%% Plot Learning Curve 

fprintf('\npreparing data for learning curve... \n');

training_size = size(X_training, 1);
test_size = size(X_test, 1);

options = optimset('MaxIter', max_runs);

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction_MA(p, ...
                                   input_layer_size, ...
                                   hidden_layer1_size, ...
                                   output_layer_size, ...
                                   X_training, y_training, lambda);
                               

f_score_train = zeros(training_size, 1);

f_score_test = zeros(training_size, 1);

for i = 1 : training_size
    X_training_i = X_training(1:i, :);
    y_training_i = y_training(1:i);
    
    initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer1_size);
    initial_Theta2 = randInitializeWeights(hidden_layer1_size, output_layer_size);


    initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];    

    [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

    % Obtain Theta1, Theta2 back from nn_params
    Theta1_size = hidden_layer1_size * (input_layer_size + 1);

    Theta1 = reshape(nn_params(1:Theta1_size), ...
                     hidden_layer1_size, (input_layer_size + 1));

    Theta2 = reshape(nn_params((1 + Theta1_size): end), ...
                     output_layer_size, (hidden_layer1_size + 1));
    
                 
    % predict training set and analyse result
    training_pred_i = predict(Theta1, Theta2, X_training_i, threshold);
    
    training_pred_i = (training_pred_i >= threshold);
    
    [train_accuracy_i, train_precision_i, train_recall_i, train_F_score_i] = analyseResult(training_pred_i, y_training_i);  
    
    f_score_train(i) = train_F_score_i;
    
    
    % predict test set and analyse result
    test_pred_i = predict(Theta1, Theta2, X_test, threshold);
    
    test_pred_i = (test_pred_i >= threshold);
    
    [test_accuracy_i, test_precision_i, test_recall_i, test_F_score_i] = analyseResult(test_pred_i, y_test);  
    
    f_score_test(i) = test_F_score_i;
    
end

% plot result
plot(1:training_size, f_score_train, 1:training_size, f_score_test);
title('Learning curve');
legend('Train', 'Test');
xlabel('Number of training examples');
ylabel('f_score');



