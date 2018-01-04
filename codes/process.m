function img = process(img_before)

img = imcrop(img_before, [1 1 3000 3000]);
img = medfilt2(img);
mu = mean(img(:));
img = (img - mu) * 10;

% img = stdfilt(img);
% img = imgradient(img);
end