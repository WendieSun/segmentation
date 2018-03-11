%% Initialization
clear ; close all; clc

%% Set border
border = 30;

%% Load data -- from a given cropped image of mitochondrion

% load image
mito_grayscale = load('mito_image.mat');
mito_binary = load('mito_binary.mat');

mito_grayscale = mito_grayscale.mito_image;
mito_binary = mito_binary.mito_binary;

% size of image
[m, n] = size(mito_grayscale);

% initialise x and y
x = zeros(m, n);
y = zeros(m, n);

% load pixel values into x
for i = (border + 1) : (m - border)
    for j = (border + 1) : (n - border)
        % crop image
        surrounding = mito_grayscale(i - border : i + border, j - border : j + border);
        mu = mean(surrounding(:));
        
        % put pixel values
        x(i, j) = mu;
        y(i, j) = mito_binary(i, j);
    end
end

x = x(:);
y = y(:);

%% Plot the surrounding pixel value ranges 
figure;
temp = zeros(size(x, 1), size(x, 2));
gscatter(x, temp, y);
xlabel('Surrounding pixel value mean');
ylabel(' ');

