
plot(1:142, f_score_train(1:142), 1:142, f_score_test(1:142));
title('Learning curve');
legend('Train', 'Test');
xlabel('Number of training examples');
ylabel('f_score');
% 
% pred_img = reshape(test_img_pred, img_height, img_width);
% % figure;
% % imshow(pred_img);
% 
% actual_img = test_bin(padding + 1 : padding + img_height, padding + 1 : padding + img_width);
% figure;
% imshowpair(pred_img, actual_img, 'montage');


save('f_score learning curve (m = 142)', 'f_score_train', 'f_score_test');