% ECE210-A HW1
% Dan Mezhiborsky

clear();
clc();

% Q1 --------------------------------------------
pr1_a = log10(34);
pr1_b = 6*exp(1j * 3*pi/4);
pr1_c = atan(sqrt(65)) + 24;
pr1_d = sqrt(3)/2 + 1j/2;
pr1_col = [pr1_a; pr1_b; pr1_c; pr1_d;];

% Q2 --------------------------------------------
pr2_mul = pr1_b * pr1_d;
pr2_real = real(pr2_mul);
pr2_cplx = imag(pr2_mul);
pr2_rho = norm(pr2_mul);
pr2_theta = angle(pr2_mul);
pr2_row = [pr2_real, pr2_cplx, pr2_rho, pr2_theta];

% Q3 --------------------------------------------
pr3_a = pr1_col * pr2_row;
pr3_b = repmat(transpose(pr1_col).*pr2_row, 4, 1);

% Q4 --------------------------------------------
pr4_a = pr3_a + pr3_b/2;
pr4_b = pr3_a .* pr3_b;
pr4_c = pr3_a - 2;
pr4_d = ctranspose(pr3_a);
pr4_e = pr3_b + diag([3,3,3,3]);

% Q5 --------------------------------------------
n = rad2deg(pr2_theta);
pr5_a = linspace(1, n, 1500);
pr5_b = 1:0.4:n;