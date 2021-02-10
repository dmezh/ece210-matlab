% ECE210-A HW2
% Dan Mezhiborsky

clear();
clc();

%% Q1 --------------------------------------------
% derivative part
p1_v1x = linspace(0, 2*pi, 100);
p1_v2x = linspace(0, 2*pi, 1000);

p1_v1c = cos(p1_v1x / 2);
p1_v2c = cos(p1_v2x / 2);
p1_v1d = diff(p1_v1c) ./ diff(p1_v1x);
p1_v2d = diff(p1_v2c) ./ diff(p1_v2x);

p1_v1d_o = -1/2 * sin(p1_v1x / 2); % the function is -1/2*sin(x/2)
p1_v2d_o = -1/2 * sin(p1_v2x / 2);
p1_v1d_o = p1_v1d_o(1:end-1);
p1_v2d_o = p1_v2d_o(1:end-1);

p1_v1_err = max(abs(p1_v1d - p1_v1d_o))
p1_v2_err = max(abs(p1_v2d - p1_v2d_o)) % more accurate
disp("The second approximation (length 1000) is more accurate.")
disp("--------------------------------------------------------")
% integral part
p1_v1i_s = cumsum(p1_v1c*2*pi/100);
p1_v2i_s = cumsum(p1_v2c*2*pi/1000);
p1_v1i_t = cumtrapz(p1_v1c*2*pi/100);
p1_v2i_t = cumtrapz(p1_v2c*2*pi/1000);

p1_v1i_o = 2 * sin(p1_v1x / 2);
p1_v2i_o = 2 * sin(p1_v2x / 2);

p1_v1i_s_e = max(abs(p1_v1i_s - p1_v1i_o))
p1_v2i_s_e = max(abs(p1_v2i_s - p1_v2i_o))
p1_v1i_t_e = max(abs(p1_v1i_t - p1_v1i_o))
p1_v2i_t_e = max(abs(p1_v2i_t - p1_v2i_o)) % most accurate
disp("The fourth approximation (trapezoidal, length 1000) is more accurate.")
disp("---------------------------------------------------------------------")
figure;
plot(p1_v2x, p1_v2i_t);
title("Trapezoidal Approximation of 2sin(x/2), 1000 points")

%% Q2 --------------------------------------------
A = 100:-1:1;
A = reshape(A,[10,10])
A = flip(A)
A(4,:) = fliplr(A(4,:))
B = sum(A,1)
C = prod(A,2)
D = diag(A)
A(7,:) = []

%% Q3 --------------------------------------------

format long

tic
    B1 = [];
    for i = 1:300
            for j = 1:300
                B1(i,j) = 1/(2*pi) * 10/(((i-150)^2 + (j-150)^2 + 10^2)^(3/2));
            end
    end
toc

tic
    B2 = zeros(300,300);
    for i = 1:300
            for j = 1:300
                B2(i,j) = 1/(2*pi) * 10/(((i-150)^2 + (j-150)^2 + 10^2)^(3/2));
            end
    end
toc


tic
    i = 1:300;
    j = 1:300;
    [ic, jc] = meshgrid(i,j);
    B3 = 1/(2*pi) * 10./(((ic-150).^2 + (jc-150).^2 + 10.^2).^(3/2));
toc