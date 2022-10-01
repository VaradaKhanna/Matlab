%Design a Filter to only extract 30hz
clear all;
 clc;
 fp1=29*2*pi
fp2=30*2*pi
fs1=28*2*pi
fs2=31*2*pi
Wp = [fp1 fp2];
Ws = [fs1 fs2];
Rp = 2;
Rs = 40;
fsample=2000
[N,Wn] = buttord(Wp,Ws,Rp,Rs,'s')
[z,p,k] = butter(N,Wn,'s');
[zd,pd,kd] = bilinear(z,p,k,fsample)
[b,a] = zp2tf(zd,pd,kd)
[hb,wb] = freqz(b,a);
figure
plot(wb*fsample/(2*pi),(abs(hb)))
xlim([0 60])
title('IIR butterworth bandpass filter')
xlabel('Frequency')
ylabel('Magnitude')

