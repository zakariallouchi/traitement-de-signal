clear all 
close all 
clc

%% **********************Filtrage Analogique********************  %

%te = 0.0005 ;


%Definition des variables et de signal 
te = 1e-4 ;
fe = 1/te ;
t = 0:te:5-te ;
N = length(t);
f = (0:N-1)*(fe/N);
fshift = (-N/2:N/2-1)*fe/N;

%
%Definition de la fonction xt 
xt = sin(2*pi*500*t)+ sin(2*pi*400*t)+ sin(2*pi* 50*t) ;
 tansf = fft(xt);
plot(fshift,fftshift(abs(tansf)/N)*2)

%%
% la fonction de transmmitance 

K = 1 ;
fc1 = 150 ;
fc2 = 170 ;
fc3 = 10;

H1 = (K*1j*f/fc1)./(1+1j*f/fc1) ;
H2 = (K*1j*f/fc2)./(1+1j*f/fc2) ;
H3 = (K*1j*f/fc3)./(1+1j*f/fc3) ;

 
   plot(f,abs(H1))

G1 = 20*log(abs(H1));
G2 = 20*log(abs(H2));
G3 = 20*log(abs(H3));

phi1 = angle(H1);
phi2 = angle(H2);
phi3 = angle(H3);
hold on


subplot(2,1,1) 
semilogx(f,G1,'g',f,G2,'r',f,G3,'b')
ylabel('Gain (dB)')
title('Bode Diagram')
grid on 
% subplot(,1,2) 
% semilogx(f,phi1, 'g',f,phi2,'r',f,phi3,'b')
% ylabel('Phase (deg)')
% xlabel('Frequency (rad/s)')
% grid on 

%%
yt1 = tansf.*H1 ;
yt2 = tansf.*H2 ;
yt3 = tansf.*H3 ;
Yt1 = ifft(yt1,'symmetric');
Yt2 = ifft(yt2,'symmetric');
Yt3 = ifft(yt3,'symmetric');
% plot(t, Yt1)
% plot(t, Yt2)
% plot(t, Yt3)
% plot(t,xt)
% plot(t , xt-Yt1)
% plot(t , xt-Yt2)
% plot(t , xt-Yt3)

% plot(fshift,fftshift(abs(fft(Yt1))/N)*2)
% 
% plot(fshift,fftshift(abs(fft(Yt2))/N)*2)
subplot(2,1,2) 
plot(fshift,fftshift(abs(fft(Yt3))/N)*2)




