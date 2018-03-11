%% Initialization
clear ; close all; clc;

%% Load data
mito_grayscale = load('mito_image.mat');
mito_binary = load('mito_binary.mat');

mito_grayscale = mito_grayscale.mito_image;
mito_binary = mito_binary.mito_binary;

%% Set up parameters and constants
threshold = 14287;
border = 25;

% size of image
[m, n] = size(mito_grayscale);

% initialise prediction
pred = zeros(m, n);


%% Predict 
for i = (border + 1) : (m - border)
    for j = (border + 1) : (n - border)
        surrounding = mito_grayscale(i - border : i + border, j - border : j + border);
        mu = mean(surrounding(:));
        
        if (mu > threshold)
            pred(i, j) = 1;
        else
            pred(i, j) = 0;
        end
    end
end

%% Compare prediction with the actual image
figure;
imshowpair(mito_binary, pred, 'montage');
title('actual v.s. prediction');

figure;
imshowpair(mito_grayscale, pred, 'montage');
title('input v.s. prediction');


