% Design an IIR Butterworth band-stop filter, given the following specifications. Also plot the frequency response. Specifications: Stop-band of 600Hz to 2000Hz, pass-band till 450Hz and then 2300Hz onwards, rp = 10dB, rs = 40dB and sampling frequency is 10kHz.

clc;
clear all;
fs1=600*2*pi
fs2=2000*2*pi
fp1=450*2*pi
fp2=2300*2*pi
Wp = [fp1 fp2];
Ws = [fs1 fs2];
Rp = 10;
Rs = 40;
fsample=5000*2%if i let it be 5000 it gives an exact plot
[n,Wn] = buttord(Wp,Ws,Rp,Rs,'s')
[z,p,k] = butter(n,Wn,'stop','s');
[zd,pd,kd] = bilinear(z,p,k,fsample)
[b,a] = zp2tf(zd,pd,kd)
[hb,wb] = freqz(b,a);
figure
plot(wb*fsample/(2*pi),abs(hb))
 
title('IIR butterworth bandstop filter')
xlabel('Frequency')
ylabel('Magnitude')
bsFilt = designfilt('bandstopiir','FilterOrder',15,'HalfPowerFrequency1',675,'HalfPowerFrequency2',2450,'SampleRate',10000);
zplane(bsFilt)
