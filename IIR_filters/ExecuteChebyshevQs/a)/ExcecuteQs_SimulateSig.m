%Execute the following: 
% a. Simulate the signal having frequencies 10Hz, 30Hz and 50Hz. 
clear all;
 clc;
 n=linspace(0,3)
 y=sin(2*pi*10*n)
 y1=sin(2*pi*30*n)
 y2=sin(2*pi*50*n)
figure
subplot(211)
plot(n,y)
hold on
plot(n,y1)
hold on
plot(n,y2)
title('frequencies 10, 30 and 50 hz,(plotted separately)')
xlabel('n')
ylabel('amplitude')
subplot(212)
plot(n,y+y1+y2)
title('frequencies 10, 30 and 50 hz')
xlabel('n')
ylabel('amplitude')

