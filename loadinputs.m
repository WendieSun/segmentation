
DATASET_SIZE = 50;
NUM_OF_TRAINING =35;

height = 3000;
y_interval = 251;

width = 3000;
x_interval = 251;

n = 1;
% num_blocks = 4*4;

for i = 1 : NUM_OF_TRAINING
    source1 = strcat(num2str(i), '.tif');
    source2 = strcat(num2str(i), '_b.tif');
    
    img = imread(source1);
    img = process(img);
    seg = imread(source2);
%     fprintf('image source1: %s\n', source1);
%     fprintf('image source2: %s\n', source2);
%     sizeOf(img);
    X(n,:) = img(:);
    y(n) = seg(126, 126);
    
    n = n + 1;

end

          


n = 1;

for i = NUM_OF_TRAINING+1 : DATASET_SIZE
    source1 = strcat(num2str(i), '.tif');
    source2 = strcat(num2str(i), '_b.tif');
    
    img = imread(source1);
    img = process(img);
    seg = imread(source2);
%     fprintf('image source1: %s\n', source1);
%     fprintf('image source2: %s\n', source2);
%     sizeOf(img);
    X_test(n,:) = img(:);
    y_test(n) = seg(126, 126);
    
    n = n + 1;

end



