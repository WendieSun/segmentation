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

% size of the img
img_height = size(gray_scale, 1); % i
img_width = size(gray_scale, 2); % j

% set up some variables
sample_size = 100000;
border = 5;

output = 0;
for m = 1:sample_size
    % randomly select coordinates
    i = border + randi(img_height - 2 * border);
    j = border + randi(img_width - 2 * border);
    
    % alternate output between 1 and 0
    while binary(i, j) ~= output
        i = border + randi(img_height - 2 * border);
        j = border + randi(img_width - 2 * border);
    end
    output = (output == 0);
    
    % crop the image
    input = gray_scale(i - border : i + border, j - border : j + border);
    input = process(input);
    
    % get the pixel value range
    ran = range(input(:));
    
    % load inputs into x and y
    x(m) = ran;
    y(m) = binary(i, j);
end

%% Plot the surrounding pixel value range 
figure;
temp = zeros(size(x, 1), size(x,2));
gscatter(x, temp, y);
xlabel('Surrounding pixel value range');
ylabel(' ');
