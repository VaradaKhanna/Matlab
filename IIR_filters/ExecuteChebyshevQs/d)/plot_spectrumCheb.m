%plot filter
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
fsample=1000
[N,Wn] = cheb1ord(Wp,Ws,Rp,Rs,'s')
[z,p,k] = cheby1(N,Rp,Wn,'s');
[zd,pd,kd] = bilinear(z,p,k,fsample)
[b,a] = zp2tf(zd,pd,kd)
[hb,wb] = freqz(b,a);
figure
plot(wb*fsample/(2*pi),(abs(hb)))
xlim([0 60])
title('IIR chebyshev bandpass filter')
xlabel('Frequency')
ylabel('Magnitude')
 
 n=linspace(0,1)
 y=sin(2*pi*10*n)
 y1=sin(2*pi*30*n)
 y2=sin(2*pi*50*n)
sig=y+y1+y2
figure 
plot(n,sig)
title('Signal of frequencies 10, 30 and 50 hz')
xlabel('n')
ylabel('amplitude')
 
yn=filter(hb,1,sig)
[h w]=freqz(yn,1);
figure
plot(w*fsample/(2*pi),(abs(hb)))
xlim([0 60])
title('Output filtered signal')
xlabel('Frequency')
ylabel('Magnitude')
 
bpFilt = designfilt('bandpassiir','FilterOrder',6,'HalfPowerFrequency1',29.5,'HalfPowerFrequency2',31.5, 'SampleRate',2000);
zplane(bpFilt)
