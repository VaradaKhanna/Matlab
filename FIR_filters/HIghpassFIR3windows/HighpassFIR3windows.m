%Design, using window based approach, a high-pass FIR filter whose desired specifications are: 𝜔𝑠 = 0.2𝜋 𝑟𝑎𝑑, 𝜔𝑝 = 0.3𝜋 𝑟𝑎𝑑. Use hamming window. Hint: Use the built-in function fir1. Try using rectangular & blackman windows

clc;
clear all;
wp=0.3*pi
ws=0.2*pi
wc=ws+(wp-ws)/2
%taking k=2 for rectangular window
k=2;
N=(2*k*pi)/(wp-ws);
bn=fir1(N,wc/pi, 'high');
w=0:0.01:pi;
h=freqz(bn,1,w); %a=1
figure
datacursormode on
 
figure
 
subplot(311)
plot(w/pi,20*log10(abs(h)))
 
title('HPF with rectangular window')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')
 
subplot(312)
k=4;
N=(2*k*pi)/(wp-ws);
bn=fir1(N,wc/pi, 'high');
w=0:0.01:pi;
h=freqz(bn,1,w); %a=1
%taking k=4 for hamming window
plot(w/pi,20*log10(abs(h)))
 
title('HPF with hamming window')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')
 
subplot(313)
k=6;
N=(2*k*pi)/(wp-ws);
bn=fir1(N,wc/pi, 'high');
w=0:0.01:pi;
h=freqz(bn,1,w); %a=1
%taking k=4 for blackman window
plot(w/pi,20*log10(abs(h)))
 
title('HPF with blackman window')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('magnitude')

a= designfilt('highpassfir','PassbandFrequency',0.3,'StopbandFrequency',0.2,'PassbandRipple',0.5);
zplane(a)
