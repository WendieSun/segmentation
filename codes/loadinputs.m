
%% ============ process the images to fit into the memory ============ 

% set up some constants
img_size = 3000;
padding = 10;
training_size = 100;
test_size = 10;

% read in images
img = double(imread(strcat('0.tif')));
bn = imbinarize(imread('0_b.tif'));

% convert 0s to 1s and 1s to 0s
bn = (bn == 0);


n = 1;


%% randomly generate training set from the image

output = 0;
for m = 1 : training_size
    i = padding + randi(img_size - 2 * padding - 1);
    j = padding + randi(img_size - 2 * padding - 1);
    
%     alternate between 1 and 0
    while bn(i, j) ~= output
        i = padding + randi(img_size - 2 * padding - 1);
        j = padding + randi(img_size - 2 * padding - 1);
    end
    output = (output == 0);
    
    input = img(i - padding : i + padding, j - padding : j + padding);
    input = process(input);
    
    X_training(m, :) = input(:);
    y_training(m) = bn(i, j);
    
    
end 


%% randomly generate test set from the image
output = 0;
for m = 1 : test_size
    i = padding + randi(img_size - 2 * padding - 1);
    j = padding + randi(img_size - 2 * padding - 1);

% %     alternate between 1 and 0
%     output = (output == 0);
%     while bn(i, j) ~= output
%         i = padding + randi(img_size - 2 * padding - 1);
%         j = padding + randi(img_size - 2 * padding - 1);
%     end

    input = img(i - padding : i + padding, j - padding : j + padding);
    input = process(input);
    
    X_test(m, :) = input(:);
    y_test(m) = bn(i, j);
    
    
    
end 







