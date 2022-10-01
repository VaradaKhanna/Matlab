%Design an analog IIR low pass chebyshev filter and convert it into digital using Bilinear transformation. Plot the frequency response. Specifications: rp = 1dB, rs = 80dB, fp = 100Hz, fs = 2000Hz & Sampling frequency=10kHz.

 clc;
clear all;
fs=2000
fp=100
rp=1
rs=80
fsample=10000
wp=2*pi*fp;
ws=2*pi*fs;
[N, Wc]=cheb1ord(wp,ws,rp,rs,'s') 
[z,p,k] = cheby1(N,rp,Wc,'s');
[zd,pd,kd] = bilinear(z,p,k,fsample)
[b,a] = zp2tf(zd,pd,kd)
[hb,wb] = freqz(b,a);
figure
plot(wb*fsample/(2*pi),(abs(hb)))
xlim([0 2000])
title('IIR chebeshev low pass filter')
xlabel('Frequency')
ylabel('Magnitude')
lpFilt=designfilt('lowpassiir','FilterOrder',3,'PassbandFrequency',100, 'PassbandRipple',1,'SampleRate',10000);
zplane(lpFilt)
