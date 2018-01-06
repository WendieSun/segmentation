

pred_img = reshape(test_img_pred, img_height, img_width);
% figure;
% imshow(pred_img);

actual_img = test_bin(padding + 1 : padding + img_height, padding + 1 : padding + img_width);
figure;
imshowpair(pred_img, actual_img, 'montage');