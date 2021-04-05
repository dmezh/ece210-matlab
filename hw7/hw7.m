% ECE210 HW7
% Dan Mezhiborsky
clc
clear
close all

sigt = 0:0.001:2;
sigf = 1000:50000;
[t, f] = meshgrid(sigt, sigf);
sig = sum(sin(2.*pi.*f.*t));

% Butterworth
processfilter(butterworth(), sig, 'Butterworth');
% Cheb. I
processfilter(cheby1(), sig, 'Chebychev I');
% Cheb. II
processfilter(cheby2(), sig, 'Chebychev II');
% Elliptic
processfilter(elliptic(), sig, 'Elliptic');
