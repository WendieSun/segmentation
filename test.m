% try to experiement with some image processing techniques
% SIZE = 100;

IMAGE_SOURCE1 = '0.tif';
% IMAGE_SOURCE2 = '1_b.tif';

GS = imread(IMAGE_SOURCE1);
% BN = imread(IMAGE_SOURCE2);

% figure;
% imshow(GS);
% 
% figure;
% imshow(BN);


[I, rect] = imcrop(GS);
% figure;
% imshowpair(GS, BN, 'montage');
% 
% figure;
% imshowpair(process(GS), BN, 'montage');



