% ECE210-A HW4
% Dan Mezhiborsky

maxerr = 10^-12;

v = [[2, 3, 4]; [1, 2, 1]; [9, 9, 12]];
g = gramSchmidt(v);
isOrthonormal(g) % should be!
g(:,3) = [9,9,12];
isOrthonormal(g) % now it won't be!

