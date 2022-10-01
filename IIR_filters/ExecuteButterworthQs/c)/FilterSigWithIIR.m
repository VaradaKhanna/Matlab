%. Filter the signal using the designed filter, 
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
[n,Wn] = buttord(Wp,Ws,Rp,Rs,'s')
[z,p,k] = butter(n,Wn,'s');
[zd,pd,kd] = bilinear(z,p,k,fsample)
[b,a] = zp2tf(zd,pd,kd)
[hb,wb] = freqz(b,a);
figure
plot(wb*fsample/(2*pi),mag2db(abs(hb)))
title('IIR butterworth bandpass filter')
xlabel('Frequency')
ylabel('Magnitude')
 
 n=linspace(0,1)
 y=sin(2*pi*10*n)
 y1=sin(2*pi*30*n)
 y2=sin(2*pi*50*n)
sig=y+y1+y2
yn=filter(hb,1,sig)
[h w]=freqz(yn,1);
figure
plot(w*fsample/(2*pi),mag2db(abs(hb)))

