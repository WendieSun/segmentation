%% Set up the parameters and constants

% input information
border = 30;
input_width = 2 * border + 1;
input_layer_size = input_width^2;

% parameters for training 
lambda = 2;
max_runs = 200;

% threshold for predicting positive
threshold = 0.5;

% neural network structure
hidden_layer1_size = 25;  
output_layer_size = 1;

% training_size
training_size = 60;
test_size = 5;
