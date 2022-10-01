 %d. Plot the spectrum of the input and the filtered signal.
 clc;
clear all;
fs=500;
wlp=2*pi*29/fs;
wls=2*pi*28/fs;
wup=2*pi*31/fs;
wus=2*pi*32/fs;
wlc=wls+(wlp-wls)/2;
wuc=wup+(wus-wup)/2;
k=4;% for hamming window
N=(2*k*pi/(wus-wup));
N1=ceil(N)
bn=fir1(N1,[wlc/pi wuc/pi]);
w=0:0.01:pi;
h=freqz(bn,1,w); %a=1
figure
plot(w/pi,20*log10(abs(h)))
title('Bandpass filter using hamming window to only pass 30hz')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')
 n=linspace(0,1,350)
 y=sin(2*pi*10*n)
 y1=sin(2*pi*30*n)
 y2=sin(2*pi*50*n)
 sig=y+y1+y2
yn = filter(bn,1,sig);
h=freqz(yn,1,w);
figure
plot(w/pi,20*log10(abs(h)))
title('The filtered frequency of 30hz')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')
 subplot(211)
dft=fft(sig)
plot(abs(dft))
title('Plot of Input Spectrum')
xlabel('Time period')
ylabel('Magnitude')
subplot(212)
plot(abs(h))
title('Plot of Output')
xlabel('Time period')
ylabel('Magnitude')

