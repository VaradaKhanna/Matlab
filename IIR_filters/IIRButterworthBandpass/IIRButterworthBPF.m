%Design an IIR Butterworth band-pass filter, given the following specifications. Also plot the frequency response. Specifications: Pass-band of 600Hz to 2000Hz, stop-band till 450Hz and then 2300Hz onwards, rp = 10dB, rs = 40dB and sampling frequency is 10kHz.
clc;
clear all;
fp1=600*2*pi
fp2=2000*2*pi
fs1=450*2*pi
fs2=2300*2*pi
Wp = [fp1 fp2];
Ws = [fs1 fs2];
Rp = 10;
Rs = 40;
fsample=10000
[n,Wn] = buttord(Wp,Ws,Rp,Rs,'s')
[z,p,k] = butter(n,Wn,'s');
[zd,pd,kd] = bilinear(z,p,k,fsample)
[b,a] = zp2tf(zd,pd,kd)
%[sos,g] = zp2sos(zd,pd,kd)
%fvtool(sos)
%freqz(sos,n, fsample)
[hb,wb] = freqz(b,a);
figure
plot(wb*fsample/(2*pi),abs(hb))
 
title('IIR butterworth bandpass filter')
xlabel('Frequency')
ylabel('Magnitude')
bpFilt = designfilt('bandpassiir','FilterOrder',16,'HalfPowerFrequency1',675,'HalfPowerFrequency2',2450,'SampleRate',10000);
zplane(bpFilt)
