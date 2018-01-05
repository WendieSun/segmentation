function compare_result(pred, y, threshold)
pred_y = (pred >= threshold);
m = size(y, 2);

for i = 1 : m
    fprintf('example %d: pred: %f -> %d, actual %d\n', i, pred(i), pred_y(i), y(i));
end

end