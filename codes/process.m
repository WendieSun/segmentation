function img = process(img_before)

img = imcrop(img_before, [1 1 3000 3000]);

img = medfilt2(img);
% img = rangefilt(img);
mu = mean(img(:));
% img = img * 10;
img = (img - mu) * 10;
imadjust(img);
% img = (img == 0);
% img = stdfilt(img);
% img = imgradient(img);
end