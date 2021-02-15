% ECE210-A HW3
% Dan Mezhiborsky

clear();
clc();

%% Q1 --------------------------------------------
A = ones(100,100);
B = ones(100,100);
C = ones(100,100);

% side 2
[Tx, Ty] = meshgrid(1:100, 1:100);
temp1 = sqrt((Tx-25).^2 + (Ty-75).^2);
temp2 = sqrt((Ty-25).^2 + (Tx-75).^2);
A(temp1 < 10 | temp2 < 10) = 0;

% also side 2
temp1 = sqrt((Tx-25).^2 + (Ty-25).^2);
temp2 = sqrt((Tx-75).^2 + (Ty-75).^2);
B(temp1 < 10 | temp2 < 10) = 0;

% side 1
temp1 = sqrt((Tx-50).^2 + (Ty-50).^2);
C(temp1 > 10) = 0;

% side 3
D = ones(100,100);
D(A <= 0 | ~C <= 0) = 0;

% side 4
E = ones(100,100);
E((A <= 0) | (B <= 0)) = 0;

% side 5
F = ones(100,100);
F(A <= 0 | B <= 0 | ~C <= 0) = 0;

figure('Name', 'Die Sides');
tiledlayout(1,5);
nexttile
imshow(~C)
nexttile
imshow(A)
nexttile
imshow(D)
nexttile
imshow(E)
nexttile
imshow(F)

%% Q2 --------------------------------------------
[val,ind] = findThreshold(normpdf(linspace(0,5,100),0,1), 0.05);
fprintf("Q2: The threshold index below 0.05 is %d with value %f\n", ind, val);

%% Q3 --------------------------------------------

x = linspace(-5.25,5.25,9999);
y = sinc(x);
zerosAndExtrema(x,y); % the zero crossings happen at integer values of x
middle_extrema = find(x >= 0, 1);
next_zero = find(x <= 1, 1, 'last');
region = y(middle_extrema:next_zero);
[val, ind] = findThreshold(region, 0.2);

fprintf("Q3: The threshold index below 0.2 in the region is %d (x=%f) with value y=%f\n", ind + middle_extrema, x(ind+middle_extrema), y(ind+middle_extrema));
