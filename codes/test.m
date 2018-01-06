% try to experiement with some image processing techniques
% SIZE = 100;
clear ; close all; clc

IMAGE_SOURCE1 = '0.tif';
IMAGE_SOURCE2 = '0_b.tif';

GS = imread(IMAGE_SOURCE1);
BN = imbinarize(imread(IMAGE_SOURCE2));

img = process(GS);
img_ = imcrop(GS, [1264, 1114, 1618, 1887]);
I = imcrop(img, [1264, 1114, 1618, 1887]);
output = imcrop(BN, [1264, 1114, 1618, 1887]);

% figure;
% imshow(img);


% figure;
% imshow(GS);
% 
% figure;
% imshow(BN);


% % [I, rect] = imcrop(GS);
% figure;
% imshowpair(GS(126:226, 126:226), BN(126:226, 126:226), 'montage');
% 
% figure;
% imshowpair(process(GS), BN, 'montage');

% [1264.51000000000]
% [1114.51000000000]
% [1618.98000000000]
% [1886.98000000000]
% 
% I = imcrop(img, [1264, 1114, 1618, 1887]);
% output = imcrop(BN, [1264, 1114, 1618, 1887]);
figure;
imshowpair(img_, I, 'montage');