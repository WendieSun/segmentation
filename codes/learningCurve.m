
%% Initialization
clear ; close all; clc

%% Set up the variables and constants
loadVariables;

%% Load Data 

fprintf('\nLoading Data ...\n')

loadinputs;

%% Plot Learning Curve 

fprintf('\npreparing data for learning curve... \n');

training_size = size(X_training, 1);

test_size = size(X_test, 1);

options = optimset('MaxIter', max_runs);


% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction_MA(p, ...
                                   input_layer_size, ...
                                   hidden_layer1_size, ...
                                   output_layer_size, X_training, y_training, lambda);

% initialise performance evaluation matrices
f_score_train = zeros(training_size, 1);

f_score_test = zeros(training_size, 1);

accuracy_train = zeros(training_size, 1);

accuracy_test = zeros(training_size, 1);


% measure performance as training size increases 
for i = 1 : training_size
     
    X_training_i = X_training(1:i, :);
    y_training_i = y_training(1:i);
    
    initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer1_size);
    initial_Theta2 = randInitializeWeights(hidden_layer1_size, output_layer_size);

    initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];    

    % learn
    [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

    % Obtain Theta1, Theta2 back from nn_params
    Theta1_size = hidden_layer1_size * (input_layer_size + 1);

    Theta1 = reshape(nn_params(1:Theta1_size), ...
                     hidden_layer1_size, (input_layer_size + 1));

    Theta2 = reshape(nn_params((1 + Theta1_size): end), ...
                     output_layer_size, (hidden_layer1_size + 1));
    
    % evaluate training set 
    training_pred_i = predict_MA(Theta1, Theta2, X_training_i, threshold, y_training);
    
    training_pred_i = (training_pred_i >= threshold);
    
    [accuracy_train(i), train_precision_i, train_recall_i, f_score_train(i)] = errorAnalysis(training_pred_i, y_training_i);  

    
    % evaluate test set
    test_pred_i = predict_MA(Theta1, Theta2, X_test, threshold, y_test);
    
    test_pred_i = (test_pred_i >= threshold);
    
    [accuracy_test(i), test_precision_i, test_recall_i, f_score_test(i)] = errorAnalysis(test_pred_i, y_test);  
    
    
end

% plot f_score of training and test set
figure;
plot(1:training_size, f_score_train, 1:training_size, f_score_test);
title('Learning curve');
legend('Train', 'Test');
xlabel('Number of training examples');
ylabel('f_score');

% y start at 0
ylim([0 inf]);

% plot accuracy of training and test set
figure;
plot(1:training_size, accuracy_train, 1:training_size, accuracy_test);
title('Learning curve');
legend('Train', 'Test');
xlabel('Number of training examples');
ylabel('accuracy');

% y start at 0
ylim([0 inf]);
