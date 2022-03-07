%Aaron Rosen - Fields & Waves II - Project II: Impedance Matching
%Part II
clear all;clc;close all;


f =2.4e9; %frequency
w = 2*pi*f; %angular frequency
c = 3e8; %speed of light
Zo = 50; %Line Impedance
Rl = 25 - 1j*5; %Load Impedance
Er = 2.7; %permittivity
fsweep = 0:10000000:f*5; %frequency sweep


up = c/sqrt(Er); %propagation velocity
B = w/up; %phase constant

nah

B2 = (2*pi*fsweep)/up;
lambda = (2.*pi)./B2; %lambda
l = lambda./4; %length of Quarter Wave transformer

Zin = Zo*((Rl + 1j.*Zo.*tan(B2.*l))./(Zo + 1j.*Rl.*tan(B2.*l))); %input impedance tline
Zt = sqrt(Zo*Rl); %matched impedance for quarter wave transformer

%figure;  plot(fsweep, abs(Zin),  'Linewidth', 3), title('Magnitude of Quarter Wave Transformer Impedance'), xlabel('Frequency'), ylabel('Magnitude'), legend('Zin');  %plotting magnitude
%figure; plot(fsweep, angle(Zin), 'Linewidth', 3), title('Phase of Quarter Wave Transformer Impedance'), xlabel('Frequency'), ylabel('Phase'), legend('Angle of Zin'); %plotting angle

Zin2 = Zt*((Rl+1j.*Zt*tan(B2.*l))./(Zt + 1j.*Rl*tan(B2.*l))); %input impedance qwt

s11 = (Zin2-Zo)./(Zin2+Zo);
ab = abs(s11);
ab = ab.^2;
s21 = sqrt(1-ab);

figure; plot((fsweep), (20*log(s11)), 'LineWidth',3), title('Scattering Parameter (S11)'), xlabel('Frequency'), ylabel('Reflection'); %plotting s11
figure; plot((fsweep), (20*log(s21)), 'LineWidth',3), title('Scattering Parameter (S21)'), xlabel('Frequency'), ylabel('Transmission'); %plotting s21


