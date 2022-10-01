%design chebyshev IIR
clear all;
 clc;
fp1=29*2*pi
fp2=30*2*pi
fs1=28*2*pi
fs2=31*2*pi
Wp = [29*2*pi 30*2*pi];
Ws = [28*2*pi 31*2*pi];
Rp = 2;
Rs = 40;
fsample=100
[n,Wn] = cheb1ord(Wp,Ws,Rp,Rs,'s')
[z,p,k] = cheby1(n,Rp,Wn,'s');
[zd,pd,kd] = bilinear(z,p,k,fsample)
[b,a] = zp2tf(zd,pd,kd)
[hb,wb] = freqz(b,a);
figure
plot(wb*fsample/(2*pi),mag2db(abs(hb)))
title('IIR chebyshev bandpass filter')
xlabel('Frequency')
ylabel('Magnitude')
 

