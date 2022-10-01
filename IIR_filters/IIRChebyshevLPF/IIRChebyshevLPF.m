%Design and plot the frequency response of an IIR low pass Chebyshev filter that loses no more than 1dB in the pass-band and at least 80dB of attenuation in the stop-band. The pass-band and stop-band edge frequencies are 100Hz and 2 kHz respectively. Assume a sampling rate of 10 kHz.

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
title('IIR chebyshev low pass filter')
xlabel('Frequency')
ylabel('Magnitude')
lpFilt=designfilt('lowpassiir','FilterOrder',3,'PassbandFrequency',100,'PassbandRipple',1,'SampleRate',10000);
zplane(lpFilt)
