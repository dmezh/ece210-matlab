% ECE210-A HW6
% Dan Mezhiborsky

%% #1

n = [2/5 1/4 1/7];
d = [1/3 0 -1/8 3/2];

zeros = roots(n);
poles = roots(d);

[nz, dz] = tf2zp(n, d);

figure
zplane(nz, dz)
title('Pole-zero plot for #1')

figure
impz(n,d, 50)

[in, ir] = impz(n,d, 50);
n2 = 0:50;
x = (-4/5).^n2;

xf = filter(n2,d,x);

figure
subplot(3,1,1)
stem(x)
title('x[n]')
xlim([0, 60])

subplot(3,1,2)
stem(xf)
title('x[n], filtered')
xlim([0, 60])

subplot(3,1,3)
im = conv(in, x);
stem(im(1:50))
title('x[n], filtered (w/ conv() and impulse response)')
xlim([0, 60])

%% #2
zeros = [-1; 1]
poles = [0.9*exp(j*pi/2); 0.9*exp(-j*pi/2); 0.95*exp(j*5*pi/12); 0.95*exp(-j*5*pi/12); 0.95*exp(j*7*pi/12); 0.95*exp(-j*7*pi/12)]

[n,d] = zp2tf(zeros, poles, 1);
figure
zplane(n,d)
title('Pole-zero plot for #2')

[h,w] = freqz(n,d,1024);

figure
subplot(2,1,1)
plot(w, 20*(log10(abs(h))))
xticks(0:(pi/8):pi)
xticklabels({'0', '\pi/8', '\pi/4', '3\pi/8', '\pi/2', '5\pi/8', '3\pi/4', '7\pi/8', '\pi'})
xlim([0, pi])
title('Gain of h vs \omega')
xlabel('\omega (rad)')
ylabel('h gain (dB)')

subplot(2,1,2)
plot(w, rad2deg(unwrap(angle(h))))
xticks(0:(pi/8):pi)
xticklabels({'0', '\pi/8', '\pi/4', '3\pi/8', '\pi/2', '5\pi/8', '3\pi/4', '7\pi/8', '\pi'})
xlim([0, pi])
title('Phase of h vs \omega')
xlabel('\omega (rad)')
ylabel('h phase (deg)')
