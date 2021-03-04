% ECE210-A HW4
% Dan Mezhiborsky

clear
clc

v = [[2, 3, 4]; [1, 2, 1]; [9, 9, 12]];
isOrthonormal(v) % not yet!
g = gramSchmidt(v);
isOrthonormal(g) % should be!
g(:,3) = [9,9,12];
isOrthonormal(g) % now it won't be!


%% testing
% leftover testing / ignore

clear
clc

% more elements in each than number of vecs
randA = zeros(4, 5);
for z = 1:5
    randA(:,z) = rand(4,1) + 1i*rand(4,1);
end
randAg = gramSchmidt(randA)
isOrthonormal(randA)
isOrthonormal(randAg)

% equal number of elements in each to number of vecs
randB = zeros(4, 4);
for z = 1:4
    randB(:,z) = rand(4,1) + 1i*rand(4,1);
end
randBg = gramSchmidt(randB)
isOrthonormal(randB)
isOrthonormal(randBg)

%% last part
clear
clc

dx = 0.01;
x = 0:dx:2*pi;
s = sin(x);

num_mu = 5;

% make gaussians
g = @(u) (1/sqrt(2*pi))*exp(-(x-u).^2);
gs = zeros(length(x), num_mu);
for i = 1:num_mu
   gs(:,i) = g((i-1)*pi/2); 
end

% estimating sinusoid
gramgs = gramSchmidt(gs);
orthogs = zeros(length(x), num_mu);
for i = 1:num_mu
    orthogs(:,i) = orthoProj(s, gramgs(:,i));
end
orthog = sum(orthogs, 2);

% last part figure 1
figure
plot(x, s)
hold on
plot(x, gs)
title("sin(x) and Gaussians(x) for μ∈\{0,π/2,π,3π/2,2π\}")
xlabel("x")
ylabel("y")
axis padded

% last part figure 2
figure
subplot(2,1,1)
plot(x, s)
hold on
plot(x, orthog)
subtitle("Gram-Schmidt-orthonormalized Gaussians(x) projected onto sin(x)")
xlabel("x")
ylabel("y")
subplot(2,1,2)
plot(x, gramgs)
subtitle("Gram-Schmidt-orthonormalized Gaussians(x) for μ∈\{0,π/2,π,3π/2,2π\}")
xlabel("x")
ylabel("y")
