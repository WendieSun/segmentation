%% read in the input image

img = double(imread(strcat('0.tif')));
bn = imbinarize(imread('0_b.tif'));

% size of the img
img_height = size(img, 1); % i
img_width = size(img, 2); % j

% convert 0s to 1s and 1s to 0s
bn = (bn == 0);


%% randomly generate training set from the image

output = 0;

for m = 1 : training_size
    
    % randomly select a point from the image that has the desired output
    % value (1 or 0)
    i = border + randi(img_height - 2 * border);
    j = border + randi(img_width - 2 * border);
    
    % alternate output between 1 and 0
    while bn(i, j) ~= output
        i = border + randi(img_height - 2 * border);
        j = border + randi(img_width - 2 * border);
    end
    output = (output == 0);
    
    % get the surrounding pixels of the point and process them  
    input = img(i - border : i + border, j - border : j + border);
%     input = process(input);
    
    % put into X and y
    X_training(m, :) = input(:);
    y_training(m) = bn(i, j);
    
    
end 


%% randomly generate test set from the image

output = 0;

for m = 1 : test_size
    i = border + randi(img_height - 2 * border);
    j = border + randi(img_width - 2 * border);

    % alternate between 1 and 0
    output = (output == 0);
    while bn(i, j) ~= output
        i = border + randi(img_height - 2 * border);
        j = border + randi(img_width - 2 * border);
    end

    input = img(i - border : i + border, j - border : j + border);
%     input = process(input);
    
    X_test(m, :) = input(:);
    y_test(m) = bn(i, j);
    
end 







