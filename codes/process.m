function img = process(img_before)
% process images

img = img_before;

img = medfilt2(img);

mu = mean(img(:));

img = (img - mu) * 10;

imadjust(img);

end