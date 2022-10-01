% Design and plot the frequency response of a band-pass FIR filter whose specifications are as follows: Lower pass band edge = 300Hz, upper pass-band edge = 600Hz, lower stop- band edge = 200Hz and upper stop-band edge = 700Hz, stop band attenuation = 50dB. The sampling frequency is 2kHz. Use the built-in function fir1. Try using rectangular, blackman windows also.
clc;
clear all;
fs=2000;
wlp=2*pi*300/fs;
wls=2*pi*200/fs;
wup=2*pi*600/fs;
wus=2*pi*700/fs;
stopattenuation=50;
wlc=wls+(wlp-wls)/2;
wuc=wup+(wus-wup)/2;
k=2;% for rectangular window
N1=(2*k*pi/(wus-wup));
bn=fir1(N1,[wlc/pi wuc/pi]);
w=0:0.01:pi;
h=freqz(bn,1,w); %a=1
figure
datacursormode on
subplot(3,1,1);
plot(w/pi,20*log10(abs(h)))
title('Bandpass filter using rectangular window')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')
subplot(312)
k=4;% for hamming window
N2=(2*k*pi/(wus-wup));
bn=fir1(N2,[wlc/pi wuc/pi]);
w=0:0.01:pi;
h=freqz(bn,1,w); %a=1
plot(w/pi,20*log10(abs(h)))
title('Bandpass filter using hamming window')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')
subplot(313)
k=6;% for blackman window
N3=(2*k*pi/(wus-wup));
bn=fir1(N3,[wlc/pi wuc/pi]);
w=0:0.01:pi;
h=freqz(bn,1,w); %a=1
plot(w/pi,20*log10(abs(h)))
title('Bandpass filter using blackman window')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')
 
 
recwinBPF= designfilt('bandpassfir','FilterOrder',40,'CutoffFrequency1',0.4,'CutoffFrequency2',0.650,'SampleRate',2000);
zplane(recwinBPF)
hamwinBPF = designfilt('bandpassfir','FilterOrder',80,'CutoffFrequency1',0.400,'CutoffFrequency2',0.650,'SampleRate',2000);
zplane(hamwinBPF)
blackmanBPF = designfilt('bandpassfir','FilterOrder',120,'CutoffFrequency1',0.400,'CutoffFrequency2',0.650,'SampleRate',2000);
zplane(blackmanBPF)


