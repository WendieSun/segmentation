% try to experiement with some image processing techniques
% SIZE = 100;

IMAGE_SOURCE1 = '0.tif';
IMAGE_SOURCE2 = '0_b.tif';

GS = imread(IMAGE_SOURCE1);
BN = imread(IMAGE_SOURCE2);


img = process(GS);
figure;
imshow(img);

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



