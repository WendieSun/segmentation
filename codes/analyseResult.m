function [accuracy, precision, recall, F_score] = analyseResult(pred, actual)
% pred and actual only contains 0s and 1s


m = size(actual, 2);


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


end 
