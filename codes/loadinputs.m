
% DATASET_SIZE = 841;

TRAINING_START = 100;
NUM_OF_TRAINING = 35;
NUM_OF_TEST =15;

height = 3000;
y_interval = 101;

width = 3000;
x_interval = 101;

mid_point = 51;

n = 1;
% num_blocks = 4*4;

for i = TRAINING_START : TRAINING_START + NUM_OF_TRAINING - 1
    source1 = strcat(num2str(i), '.tif');
    source2 = strcat(num2str(i), '_b.tif');
    
    img = imread(source1);
    img = process(img);
    seg = imread(source2);
%     fprintf('image source1: %s\n', source1);
%     fprintf('image source2: %s\n', source2);
%     sizeOf(img);
    X(n,:) = img(:);
    y(n) = seg(mid_point, mid_point);
    
    n = n + 1;

end

          


n = 1;

for i = NUM_OF_TRAINING + 1 : NUM_OF_TRAINING + NUM_OF_TEST
    source1 = strcat(num2str(i), '.tif');
    source2 = strcat(num2str(i), '_b.tif');
    
    img = imread(source1);
    img = process(img);
    seg = imread(source2);
%     fprintf('image source1: %s\n', source1);
%     fprintf('image source2: %s\n', source2);
%     sizeOf(img);
    X_test(n,:) = img(:);
    y_test(n) = seg(mid_point, mid_point);
    
    n = n + 1;

end



