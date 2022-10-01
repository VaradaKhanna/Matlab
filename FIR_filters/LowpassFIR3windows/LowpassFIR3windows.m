 % Write a program to design a low pass FIR filter using windowing method. Let pass band frequency be wp=0.375*pi rad ad stop band frequency be ws= 0.5*pi. Use hamming Window. Try using rectangular, blackman windows also.
clc;
clear all;
wp=0.375*pi
ws=0.5*pi
wc=wp+(ws-wp)/2
%taking k=2 for rectangular window
k1=2;
N1=(2*k1*pi)/(ws-wp);
bn1=fir1(N1,wc/pi, 'low');
w=0:0.01:pi;
h=freqz(bn1,1,w); %a=1
datacursormode on
 
figure
 
subplot(311)
plot(w/pi,20*log10(abs(h)))
 
title('LPF with rectangular window')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')
 
subplot(312)
k2=4;
N2=(2*k2*pi)/(ws-wp);
bn2=fir1(N2,wc/pi, 'low');
w=0:0.01:pi;
h=freqz(bn2,1,w); %a=1
%taking k=4 for hamming window
plot(w/pi,20*log10(abs(h)))
 
title('LPF with hamming window')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')
 
subplot(313)
k3=6;
N3=(2*k3*pi)/(ws-wp);
bn3=fir1(N3,wc/pi, 'low');
w=0:0.01:pi;
h=freqz(bn3,1,w); %a=1
%taking k=4 for blackman window
plot(w/pi,20*log10(abs(h)))
 
title('LPF with blackman window')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')
 

a= designfilt('lowpassfir','PassbandFrequency',0.375,'StopbandFrequency', 0.5,'PassbandRipple',0.5);
zplane(a)

