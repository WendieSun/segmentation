

%% ============ process the images to fit into the memory ============ 

img = imread(strcat('0.tif'));
bn = imbinarize(imread('0_b.tif'));


img_size = 3000;

padding = 125;

training_size = 50;

test_size = 15;

n = 1;

% randomly select x,y points from the image
% ensure equal number of 0s and 1s

for m = 1 : training_size/2
    i = padding + randi(img_size);
    j = padding + randi(img_size);
    
    while bn(i, j) ~= 1
        i = padding + randi(img_size);
        j = padding + randi(img_size);
    end
    
    input = img(i - padding : i + padding, j - padding : j + padding);
    input = process(input);
    
    X_training(n, :) = input(:);
    y_training(n) = bn(i, j);
    
    n = n + 1;
end 
    
n = size(X_training, 1) + 1;

for m = training_size/2 + 1: training_size
    
    i = padding + randi(img_size);
    j = padding + randi(img_size);
    
    while bn(i, j) ~= 0
        i = padding + randi(img_size);
        j = padding + randi(img_size);
    end
    
    input = img(i - padding : i + padding, j - padding : j + padding);
    input = process(input);
    
    X_training(n, :) = input(:);
    y_training(n) = bn(i, j);
    
    n = n + 1;
end 


for m = 1 : test_size
    i = padding + randi(img_size);
    j = padding + randi(img_size);

%     while bn(i, j) ~= 1
%         i = padding + randi(img_size);
%         j = padding + randi(img_size);
%     end
    
    input = img(i - padding : i + padding, j - padding : j + padding);
    input = process(input);
    
    X_test(m, :) = input(:);
    y_test(m) = bn(i, j);
    
%     n = n + 1;
end 


% y = y';



% height = 3000;
% y_interval = 101;

% width = 3000;
% x_interval = 101;


% x_start = 1;
% y_start = 1;
% 
% for i = 1 : width/x_interval
%     for j = 1 : height/y_interval
%         I = img(x_start:x_start+x_interval-1, y_start:y_start+y_interval-1);
%         B = bn(x_start:x_start+x_interval-1, y_start:y_start+y_interval-1);
%         
%         imwrite(I, strcat(num2str(n), '.tif'));
%         imwrite(B, strcat(num2str(n), '_b.tif'));
%         
%         y_start = y_start + y_interval;
%         n = n + 1;
%     end
%     x_start = x_start + x_interval;
%     y_start = 1;
% 
% end




