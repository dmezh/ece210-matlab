function Hd = cheby2
%CHEBY2 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.9 and Signal Processing Toolbox 8.5.
% Generated on: 04-Apr-2021 23:19:58

% Chebyshev Type II Highpass filter designed using FDESIGN.HIGHPASS.

% All frequency values are in Hz.
Fs = 100000;  % Sampling Frequency

Fstop = 25000;       % Stopband Frequency
Fpass = 45000;       % Passband Frequency
Astop = 40;          % Stopband Attenuation (dB)
Apass = 2;           % Passband Ripple (dB)
match = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its CHEBY2 method.
h  = fdesign.highpass(Fstop, Fpass, Astop, Apass, Fs);
Hd = design(h, 'cheby2', 'MatchExactly', match);

% [EOF]
