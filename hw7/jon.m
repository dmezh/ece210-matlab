t = 1:0.001:2;
f = 1:50000;

[F, T] = meshgrid(f, t);

signal = sin(2*pi.*F.*T);
signal = sum(signal);

Problem 2 - Butterworth
[H, f] = freqz(butterworth, 1024, 100000);

figure;
subplot(2,1,1)
plot(f, 20*log10(abs(H)));
title("Butterworth filter magnitude response");
ylabel("Magnitude of H (dB)")
xlabel("f (10's of kHz)");

subplot(2,1,2)
plot(f, rad2deg(unwrap(angle(H))));
title("Butterworth filter phase response");
ylabel("Phase of H (degrees)");
xlabel("f (10's of kHz)");

sgtitle('Butterworth filter frequency response')

y = filter(H, 1, signal);
S = fft(y, 1024);
S = fftshift(abs(S))/1024;

figure;
plot(f, 20*log10(S));