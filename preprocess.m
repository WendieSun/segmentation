%% process the images to fit into the memory

img = imread(strcat('0.tif'));
bn = imbinarize(imread('0_b.tif'));


height = 3000;
y_interval = 251;

width = 3000;
x_interval = 251;

n = 1;

x_start = 1;
y_start = 1;

for i = 1 : width/x_interval
    for j = 1 : height/y_interval
        I = img(x_start:x_start+x_interval-1, y_start:y_start+y_interval-1);
        B = bn(x_start:x_start+x_interval-1, y_start:y_start+y_interval-1);
        
        imwrite(I, strcat(num2str(n), '.tif'));
        imwrite(B, strcat(num2str(n), '_b.tif'));
        
        y_start = y_start + y_interval;
        n = n + 1;
    end
    x_start = x_start + x_interval;
    y_start = 1;

end

