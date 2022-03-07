clear all; clc; close all;
Zl = 25 -1j*5;
Zo = 50;

%find l
f =2.4e9; %frequency
w = 2*pi*f; %angular frequency
c = 3e8; %speed of light
fsweep = 0:15000000:f*5; 
Er = 2.7;
up = c/sqrt(Er); %propagation velocity
Er = 2.7; %permittivity
R = ((Zl-Zo)/(Zl+Zo)); %reflection coefficient 
lambda = up/f; %lambda
lt = lambda/4;
l = 0:0.0001:0.25;
l1 = 0.0016;
B = w/up; %phase constant
B2 = (2*pi*fsweep)/up;
Z1 = Zo.*(1+R.*exp(-2.*j.*B2.*l1)./(1-R.*exp(-2.*j.*B2.*l1)));
Z12 = Zo.*(1+R.*exp(-2.*j.*B.*l1)./(1-R.*exp(-2.*j.*B.*l1)));
Zt = sqrt(real(Z1)*Zo);
Zt2 = sqrt(real(Z12)*Zo);
%finding smallest imaginary value
%imagZ1 = imag(1+R.*exp(-2.*j.*B.*l)./(1-R.*exp(-2.*j.*B.*l)))
%limag = min(abs(imagZ1));
s11 = (real(Z1)-Zo)./(real(Z1)+Zo);
ab = abs(s11);
ab = ab.^2;
s21 = (sqrt(1-ab));
dbs21 = mag2db(s21);
figure;  plot(fsweep, abs(Z1),  'Linewidth', 3), title('Magnitude of Quarter Wave Transformer Impedance'), xlabel('Frequency (Hz)'), ylabel(['Magnitude (' char(0x2126) ')']), legend('Zin');  %plotting magnitude
figure; plot((fsweep), (20.*log10(s11)), 'LineWidth',3), title('Scattering Parameter (S11) with complex load'), xlabel('Frequency (Hz)'), ylabel('Reflection (dB)'); %plotting s11
 figure;  plot( (fsweep), (20*log10(s21)),  'LineWidth',3), title('Scattering Parameter (S21) with complex load'), xlabel('Frequency (Hz)'), ylabel('Transmission (dB)'); %plotting s21

