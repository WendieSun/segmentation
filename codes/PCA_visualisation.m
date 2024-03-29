%% Initialization
clear ; close all; clc

%% Set up the variables and constants
loadVariables;

%% Load Data 
loadinputs;

%% PCA

X = X_training;

% mean normalisation
[X_norm, mu, sigma] = featureNormalize(X);

% run pca 
[U, S] = pca(X_norm);

%% choose the number of principle component (K)

% number of features
n = size(X, 2);

% pick the smallest k that retains 99% of variance in the original set
for k = 1 : n
    variance_retained = sum(diag(S(1:k, 1:k))) / sum(diag(S));
    if (variance_retained >= 0.99)
        break;
    end
end

% report the k found
fprintf('the smallest k found: %d\n', k);


%% reduce data dimension 

% reduce dimension to the k found
K = k;
Z = projectData(X_norm, U, K);


%% reconstruct and display 

X_rec  = recoverData(Z, U, K);

% for the first 6 images, compare the reduced and the original ones
for i = 1:6
    original = reshape(X_training(i,:), input_width, input_width);
    reduced = reshape(X_rec(i, :), input_width, input_width);
    figure;
    imshowpair(original, reduced, 'montage');
end
    






