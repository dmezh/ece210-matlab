function processfilter(fobj, sig, name)
    Fs = 100000;

    [H, f] = freqz(fobj, 1024, Fs);
    figure
    sgtitle(sprintf('%s Filter', name))
    
    subplot(3,1,1)
    plot(f, 20*(log10(abs(H))))
    ax = gca;
    ax.XLim = [0 50000];
    ax.YLim = [-300 5];
    ax.XTick = 0:5000:50000;
    ylabel('Magnitude of H (db)')
    xlabel('Frequency (Hz)')
    title('Frequency response of filter')

    subplot(3,1,2)
    plot(f, unwrap(angle(H)))
    ylabel('Phase of H (deg)')
    xlabel('Frequency (Hz)')
    title('Phase response of filter')

    fsig = filter(fobj, sig);
    sfft = fft(fsig, 4096);
    sfft = fftshift(abs(sfft)) / 4096;
    fftf =  Fs*(-2048:2047)/4096;
    
    subplot(3,1,3)
    plot(fftf, 20*log10(abs(sfft)))
    ylabel('Magnitude (db)')
    xlabel('Frequency (Hz)')
    ax = gca;
    ax.YAxisLocation = 'origin';
    title('FFT of filter applied to signal')
end
