%Design and plot the frequency response of a band-stop filter whose specifications are as follows: Lower pass band edge = 200Hz, upper pass-band edge = 700Hz, lower stop- band edge = 300Hz and upper stop-band edge = 600Hz, stop band attenuation = 50dB. The sampling frequency is 2kHz. Use the built-in function fir1.
clc;
clear all;
fs=2000;
wlp=2*pi*200/fs;
wls=2*pi*300/fs;
wup=2*pi*700/fs;
wus=2*pi*600/fs;
stopattenuation=50;
wlc=wls+(wlp-wls)/2;
wuc=wup+(wus-wup)/2;
k=2;% for rectangular window
N=(2*k*pi/(wup-wus));
bn=fir1(N,[wlc/pi wuc/pi], 'stop');
w=0:0.01:pi;
h=freqz(bn,1,w); %a=1
figure
datacursormode on
subplot(3,1,1);
plot(w/pi,20*log10(abs(h)))
title('Bandstop filter using rectangular window')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')
subplot(312)
k=4;% for hamming window
N=(2*k*pi/(wup-wus));
bn=fir1(N,[wlc/pi wuc/pi], 'stop');
w=0:0.01:pi;
h=freqz(bn,1,w); %a=1
plot(w/pi,20*log10(abs(h)))
title('Bandstop filter using hamming window')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')
subplot(313)
k=6;% for blackman window
N=(2*k*pi/(wup-wus));
bn=fir1(N,[wlc/pi wuc/pi], 'stop');
w=0:0.01:pi;
h=freqz(bn,1,w); %a=1
plot(w/pi,20*log10(abs(h)))
title('Bandstop filter using blackman window')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')
rectBSF = designfilt('bandstopfir','FilterOrder',40,'CutoffFrequency1',0.35,'CutoffFrequency2',0.75,'SampleRate',2000);
zplane(rectBSF)
hamBSF = designfilt('bandstopfir','FilterOrder',80,'CutoffFrequency1',0.35,'CutoffFrequency2',0.75,'SampleRate',2000);
zplane(hamBSF)
BlackmanBSF = designfilt('bandstopfir','FilterOrder',120,'CutoffFrequency1',0.35,'CutoffFrequency2',0.75,'SampleRate',2000);
zplane(BlackmanBSF)

