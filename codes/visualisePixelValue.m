%% Initialization
clear ; close all; clc

%% Set up the variables and constants
loadVariables;

%% Load Data 
GRAYSCALE_FILE = '0.tif';
BINARY_FILE = '0_b.tif';

% load the files;
gray_scale = imread(GRAYSCALE_FILE);
binary = imread(BINARY_FILE);
binary = imbinarize(binary);

% process inputs
gray_scale = process(gray_scale);
binary = (binary == 0);

% randomly select points
sample_size = 100000;

for m = 1:sample_size
    i = randi(size(gray_scale, 1));
    j = randi(size(gray_scale, 2));
    x(m) = gray_scale(i, j);
    y(m) = binary(i, j);
end

%% Visualise pixel values
figure;
temp = zeros(size(x, 1), size(x,2));
gscatter(x, temp, y);
xlabel('gray scale');
ylabel(' ');

