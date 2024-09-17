% name = [a, c, ec, C11, C12, C44]

% W2B5-P6_3-mmc
my_W2B5_mmc = [4.16169617768615, 21.6674143708623, -0.4487794933659, 444.348012210103, 137.296926854993, 93.4338761832];
expected_W2B5_mmc = [3.01685, 15.70759, -8.19208, 59.23117, 159.25029, 212.5896];

% WB5-P6_3-mmc
my_WB5_mmc = [4.31844582470451, 20.0861313174549, -0.539097278685913, -19917.4364993498, -193517.76091125, 238318.833881224];
expected_WB5_mmc = [2.92617, 7.75361, -8.51499, 596.52515, 146.46399, 237.75151];

% Values for W2B5_P63/mmc
my_W2B5_mm = [1.90127944088075, 41.0933254758161, -1583.424039, -18338.418770, -52747.16438, 18066.493013];
expected_W2B5_mm = [3.01685, 15.70759, -8.19208, 559.23117, 159.25029, 212.5896];

% Values for W2B5_R3m
% my_W2B5_R3m = [2.52451371, 13.181492, -610.339260, -880.749024, 3.37961670, 20050.764896];
% expected_W2B5_R3m = [2.92304, 25.89293, -8.2252, 556.61827, 146.95591, 277.558];

% Compute relative percentage errors
relative_error_WB2 = 100 * abs((my_WB2 - expected_WB2) ./ expected_WB2);
relative_error_W2B5_mm = 100 * abs((my_W2B5_mm - expected_W2B5_mm) ./ expected_W2B5_mm);
relative_error_W2B5_R3m = 100 * abs((my_W2B5_R3m - expected_W2B5_R3m) ./ expected_W2B5_R3m);

% RMSE
% rmse_WB2_a = sqrt(mean((my_WB2(:, 1) - expected_WB2(:, 1)).^2));
% rmse_W2B5_c = sqrt(mean((my_W2B5_mm(:, 2) - expected_W2B5_mm(:, 2)).^2));
% rmse_W2B5_ec = sqrt(mean((my_W2B5_R3m(:, 3) - expected_W2B5_R3m(:, 3)).^2));

rmse_WB2_a = sqrt(mean((my_WB2(:, 1) - expected_WB2(:, 1)).^2));
rmse_WB2_b = sqrt(mean((my_WB2(:, 2) - expected_WB2(:, 2)).^2));
rmse_WB2_c = sqrt(mean((my_WB2(:, 3) - expected_WB2(:, 3)).^2));

rmse_W2B5_mm_a = sqrt(mean((my_W2B5_mm(:, 1) - expected_W2B5_mm(:, 1)).^2));
rmse_W2B5_mm_b = sqrt(mean((my_W2B5_mm(:, 2) - expected_W2B5_mm(:, 2)).^2));
rmse_W2B5_mm_c = sqrt(mean((my_W2B5_mm(:, 3) - expected_W2B5_mm(:, 3)).^2));

rmse_W2B5_R3m_a = sqrt(mean((my_W2B5_R3m(:, 1) - expected_W2B5_R3m(:, 1)).^2));
rmse_W2B5_R3m_b = sqrt(mean((my_W2B5_R3m(:, 2) - expected_W2B5_R3m(:, 2)).^2));
rmse_W2B5_R3m_c = sqrt(mean((my_W2B5_R3m(:, 3) - expected_W2B5_R3m(:, 3)).^2));

rmse_a = rmse_WB2_a + rmse_WB2_a +rmse_W2B5_mm_a + rmse_W2B5_R3m_a;

% RMSE for Elastic_C
Elastic_C_WB2 = my_WB2(4:6) - expected_WB2(4:6);
Elastic_C_W2B5_mm = my_W2B5_mm(4:6) - expected_W2B5_mm(4:6);
Elastic_C_W2B5_R3m = my_W2B5_R3m(4:6) - expected_W2B5_R3m(4:6);

rmse_elastic_WB2 = sqrt(mean(Elastic_C_WB2.^2));
rmse_elastic_W2B5_mm = sqrt(mean(Elastic_C_W2B5_mm.^2));
rmse_elastic_W2B5_R3m = sqrt(mean(Elastic_C_W2B5_R3m.^2));

% Plotting
polymorphs = {'WB2\_P63/mmc', 'W2B5\_P63/mmc', 'W2B5\_R3m'};

% Relative percentage error for (a, c, ec)
figure;
%subplot(2,1,1);
hold on;
plot(1, relative_error_WB2(1), 'bo', 'MarkerSize', 8);
plot(1, relative_error_WB2(2), 'rx', 'MarkerSize', 8);
plot(1, relative_error_WB2(3), 'gs', 'MarkerSize', 8);
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
%subplot(2,1,2);
figure;
hold on;
plot(1, relative_error_WB2(4), 'bo', 'MarkerSize', 8);
plot(1, relative_error_WB2(5), 'rx', 'MarkerSize', 8);
plot(1, relative_error_WB2(6), 'gs', 'MarkerSize', 8);
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

% Values for WB2_P63/mmc
my_WB2 = [4.3229957, 14.287963, -13018.65004, 433.0400275, 18447.18093, -1257.859305];
expected_WB2 = [2.92617, 7.75361, -8.51499, 591.31143, 174.59357, 283.89235];

% Values for W2B5_P63/mmc
my_W2B5_mm = [1.90127944088075, 41.0933254758161, -1583.424039, -18338.418770, -52747.16438, 18066.493013];
expected_W2B5_mm = [3.01685, 15.70759, -8.19208, 559.23117, 159.25029, 212.5896];

% Values for W2B5_R3m
my_W2B5_R3m = [2.52451371, 13.181492, -610.339260, -880.749024, 3.37961670, 20050.764896];
expected_W2B5_R3m = [2.92304, 25.89293, -8.2252, 556.61827, 146.95591, 277.558];

% Calculate RMSE for a, c, and ec
rmse_a = sqrt(mean(([my_WB2(1), my_W2B5_mm(1), my_W2B5_R3m(1)] - [expected_WB2(1), expected_W2B5_mm(1), expected_W2B5_R3m(1)]).^2));
rmse_c = sqrt(mean(([my_WB2(2), my_W2B5_mm(2), my_W2B5_R3m(2)] - [expected_WB2(2), expected_W2B5_mm(2), expected_W2B5_R3m(2)]).^2));
rmse_ec = sqrt(mean(([my_WB2(3), my_W2B5_mm(3), my_W2B5_R3m(3)] - [expected_WB2(3), expected_W2B5_mm(3), expected_W2B5_R3m(3)]).^2));

% Calculate RMSE for C11, C12, and C44
rmse_C11 = sqrt(mean(([my_WB2(4), my_W2B5_mm(4), my_W2B5_R3m(4)] - [expected_WB2(4), expected_W2B5_mm(4), expected_W2B5_R3m(4)]).^2));
rmse_C12 = sqrt(mean(([my_WB2(5), my_W2B5_mm(5), my_W2B5_R3m(5)] - [expected_WB2(5), expected_W2B5_mm(5), expected_W2B5_R3m(5)]).^2));
rmse_C44 = sqrt(mean(([my_WB2(6), my_W2B5_mm(6), my_W2B5_R3m(6)] - [expected_WB2(6), expected_W2B5_mm(6), expected_W2B5_R3m(6)]).^2));

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
