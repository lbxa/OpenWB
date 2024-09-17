% Declare data for WB5_P63/mmc, W2B5_P63/mmc, and W2B5_R3m polymorphs
% Values for WB5_P63/mmc
my_WB5_mmc = [4.31844582470451, 20.0861313174549, -0.539097278685913, -19917.4364993498, -193517.76091125, 238318.833881224];
expected_WB5_mmc = [2.92617, 7.75361, -8.51499, 596.52515, 146.46399, 237.75151];

% Values for W2B5_P63/mmc
my_W2B5_mm = [1.90127944088075, 41.0933254758161, -1583.424039, -18338.418770, -52747.16438, 18066.493013];
expected_W2B5_mm = [3.01685, 15.70759, -8.19208, 559.23117, 159.25029, 212.5896];

% Values for W2B5_R3m
my_W2B5_R3m = [2.52451371, 13.181492, -610.339260, -880.749024, 3.37961670, 20050.764896];
expected_W2B5_R3m = [2.92304, 25.89293, -8.2252, 556.61827, 146.95591, 277.558];

% Compute relative percentage errors
relative_error_WB5_mmc = 100 * abs((my_WB5_mmc - expected_WB5_mmc) ./ expected_WB5_mmc);
relative_error_W2B5_mm = 100 * abs((my_W2B5_mm - expected_W2B5_mm) ./ expected_W2B5_mm);
relative_error_W2B5_R3m = 100 * abs((my_W2B5_R3m - expected_W2B5_R3m) ./ expected_W2B5_R3m);

% RMSE calculation for a, c, and ec
rmse_a = sqrt(mean(([my_WB5_mmc(1), my_W2B5_mm(1), my_W2B5_R3m(1)] - [expected_WB5_mmc(1), expected_W2B5_mm(1), expected_W2B5_R3m(1)]).^2));
rmse_c = sqrt(mean(([my_WB5_mmc(2), my_W2B5_mm(2), my_W2B5_R3m(2)] - [expected_WB5_mmc(2), expected_W2B5_mm(2), expected_W2B5_R3m(2)]).^2));
rmse_ec = sqrt(mean(([my_WB5_mmc(3), my_W2B5_mm(3), my_W2B5_R3m(3)] - [expected_WB5_mmc(3), expected_W2B5_mm(3), expected_W2B5_R3m(3)]).^2));

% RMSE calculation for Elastic Constants (C11, C12, C44)
rmse_C11 = sqrt(mean(([my_WB5_mmc(4), my_W2B5_mm(4), my_W2B5_R3m(4)] - [expected_WB5_mmc(4), expected_W2B5_mm(4), expected_W2B5_R3m(4)]).^2));
rmse_C12 = sqrt(mean(([my_WB5_mmc(5), my_W2B5_mm(5), my_W2B5_R3m(5)] - [expected_WB5_mmc(5), expected_W2B5_mm(5), expected_W2B5_R3m(5)]).^2));
rmse_C44 = sqrt(mean(([my_WB5_mmc(6), my_W2B5_mm(6), my_W2B5_R3m(6)] - [expected_WB5_mmc(6), expected_W2B5_mm(6), expected_W2B5_R3m(6)]).^2));

% Plotting
polymorphs = {'WB5\_P63/mmc', 'W2B5\_P63/mmc', 'W2B5\_R3m'};

% Relative percentage error for (a, c, ec)
figure;
hold on;
plot(1, relative_error_WB5_mmc(1), 'bo', 'MarkerSize', 8);
plot(1, relative_error_WB5_mmc(2), 'rx', 'MarkerSize', 8);
plot(1, relative_error_WB5_mmc(3), 'gs', 'MarkerSize', 8);
plot(2, relative_error_W2B5_mm(1), 'bo', 'MarkerSize', 8);
plot(2, relative_error_W2B5_mm(2), 'rx', 'MarkerSize', 8);
plot(2, relative_error_W2B5_mm(3), 'gs', 'MarkerSize', 8);
plot(3, relative_error_W2B5_R3m(1), 'bo', 'MarkerSize', 8);
plot(3, relative_error_W2B5_R3m(2), 'rx', 'MarkerSize', 8);
plot(3, relative_error_W2B5_R3m(3), 'gs', 'MarkerSize', 8);
xticks([1 2 3]);
xticklabels(polymorphs);
ylabel('Relative Error (%)');
legend({'a', 'c', 'ec'}, 'Location', 'Best');
title('Relative Error for (a, c, ec)');
hold off;

% Relative percentage error for Elastic Constants (C11, C12, C44)
figure;
hold on;
plot(1, relative_error_WB5_mmc(4), 'bo', 'MarkerSize', 8);
plot(1, relative_error_WB5_mmc(5), 'rx', 'MarkerSize', 8);
plot(1, relative_error_WB5_mmc(6), 'gs', 'MarkerSize', 8);
plot(2, relative_error_W2B5_mm(4), 'bo', 'MarkerSize', 8);
plot(2, relative_error_W2B5_mm(5), 'rx', 'MarkerSize', 8);
plot(2, relative_error_W2B5_mm(6), 'gs', 'MarkerSize', 8);
plot(3, relative_error_W2B5_R3m(4), 'bo', 'MarkerSize', 8);
plot(3, relative_error_W2B5_R3m(5), 'rx', 'MarkerSize', 8);
plot(3, relative_error_W2B5_R3m(6), 'gs', 'MarkerSize', 8);
xticks([1 2 3]);
xticklabels(polymorphs);
ylabel('Relative Error (%)');
legend({'C11', 'C12', 'C44'}, 'Location', 'Best');
title('Relative Error for Elastic Constants');
hold off;

% Plot RMSE for a, c, ec
figure;
bar([rmse_a, rmse_c, rmse_ec]);
title('RMSE for a, c, and ec');
xlabel('Property');
ylabel('RMSE');
xticks([1 2 3]);
xticklabels({'a', 'c', 'ec'});
set(gca, 'Box', 'on', 'GridLineStyle', 'none', 'XColor', 'k', 'YColor', 'k');

% Plot RMSE for C11, C12, and C44
figure;
bar([rmse_C11, rmse_C12, rmse_C44]);
title('RMSE for Elastic Constants');
xlabel('Elastic Constant');
ylabel('RMSE');
xticks([1 2 3]);
xticklabels({'C11', 'C12', 'C44'});
set(gca, 'Box', 'on', 'GridLineStyle', 'none', 'XColor', 'k', 'YColor', 'k');
