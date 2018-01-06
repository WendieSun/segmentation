function [accuracy, precision, recall, F_score] = errorAnalysis(pred, actual)
% pred and actual only contains 0s and 1s

% m = size(actual, 1);
m = size(actual, 2);
% 
% accuracy = 0;
% precision = 0;
% recall = 0;
% F_score = 0;


% accuracy
accuracy = sum(pred == actual)/m;

% precision
true_positive = sum((actual + pred) == 2);
pred_positive = sum(pred == 1);
precision = true_positive / pred_positive;

% recall
actual_positive = sum(actual == 1);
recall = true_positive / actual_positive;

% F_score
F_score = 2 * precision * recall / (precision + recall);

% for i = 1 : m
%     actual_i = actual(i, :);
%     pred_i = pred(i, :);
    
%     % convert 0s and 1s so black is 1
%     actual_i = (actual_i == 0);
%     pred_i = (pred_i == 0);
%     
%     % accuracy
%     accuracy_i = sum(actual_i == pred_i) / n;
%     accuracy = accuracy + accuracy_i;
%     fprintf('example %d accuracy: %f\n', i, accuracy_i * 100);
%     
%     % precision
%     true_positive = sum((actual_i+ pred_i) == 2);
%     pred_positive = sum(pred_i == 1);
%     precision_i = true_positive / pred_positive;
%     precision = precision + precision_i;
% 
%     % recall 
%     actual_positive = sum(actual_i == 1);
%     recall_i = true_positive / actual_positive;
%     recall = recall + recall_i;
% 
%     % F_score
%     F_score_i = 2 * precision_i * recall_i / (precision_i + recall_i);
%     F_score = F_score + F_score_i;

% end
% 
% accuracy = accuracy / m;
% precision = precision / m;
% recall = recall / m;
% F_score = F_score / m;

end 
