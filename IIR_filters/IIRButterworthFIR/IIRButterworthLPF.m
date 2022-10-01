%. Design an IIR Butterworth low-pass filter, given the following specifications. Also plot the frequency response. Specifications: rp = 1dB, rs = 40dB, fp = 100Hz and fs = 500Hz. Take sampling frequency as 10kHz.
clc;
clear all;
fs=500
fp=100
rp=1
rs=40
fsample=10000
wp=2*pi*fp;
ws=2*pi*fs;
[N, Wc]=buttord(wp,ws,rp,rs,'s')
[z,p,k] = butter(N,Wc,'s');
[zd,pd,kd] = bilinear(z,p,k,fsample)
[b,a] = zp2tf(zd,pd,kd)
[hb,wb] = freqz(b,a);
figure
plot(wb*fsample/(2*pi),abs(hb))
title('IIR butterworth low pass filter')
xlabel('Frequency')
ylabel('Magnitude')
lpFilt = designfilt('lowpassiir','FilterOrder',4,'PassbandFrequency',0.01,'PassbandRipple',1,'SampleRate',10000)
zplane(lpFilt)
