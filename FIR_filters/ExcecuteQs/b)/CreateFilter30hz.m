% b. Design suitable FIR filter to select only 30Hz component (Use Hamming window). 

clc;
clear all;
fs=100;
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
hamwinBPF = designfilt('bandpassfir','FilterOrder',80,'CutoffFrequency1',0.57,'CutoffFrequency2',0.610,'SampleRate',100);
zplane(hamwinBPF)
 
