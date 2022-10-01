%Design an IIR Butterworth high-pass filter, given the following specifications. Also plot the frequency response. Specifications: rp = 10dB, rs = 40dB, fp = 3000Hz and fs = 1000Hz. Take sampling frequency as 10kHz.
clc;
clear all;
fs=1000
fp=3000
rp=10
rs=40
fsample=10000
wp=2*pi*fp;
ws=2*pi*fs;
[N, Wc]=buttord(wp,ws,rp,rs,'s')
[z,p,k] = butter(N,Wc,'high','s');
[zd,pd,kd] = bilinear(z,p,k,fsample)
[b,a] = zp2tf(zd,pd,kd)
[hb,wb] = freqz(b,a);
figure
plot(wb*fsample/(2*pi),abs(hb))
title('IIR butterworth high pass filter')
xlabel('Frequency')
ylabel('Magnitude')
 
hpFilt = designfilt('highpassiir','StopbandFrequency',0.1,'PassbandFrequency',0.3,'PassbandRipple',10,'SampleRate',10000);
zplane(hpFilt)
