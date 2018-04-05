% Author: Eric Frankel
% Planck's Law Plots
clear
clc
t1 = input('Input a temperature for the blackbody: (Test case: 3000K) ');
t2 = input('Input a temperature for the blackbody: (Test case: 4000K) ');
t3 = input('Input a temperature for the blackbody: (Test case: 5000K) ');
wl = linspace(0.0000001,3e-6); %value range for wavelength
c = 3e8; %speed light m/s
h = 6.626e-34; %Planck's constant
k = 1.381e-23; %Boltzmann constant
b_wl1 = (2.*h.*c^2)./((wl.^5).*(exp(h.*c./(wl.*k.*t1))-1));
b_wl2 = (2.*h.*c^2)./((wl.^5).*(exp(h.*c./(wl.*k.*t2))-1));
b_wl3 = (2.*h.*c^2)./((wl.^5).*(exp(h.*c./(wl.*k.*t3))-1));
hold on
plot(wl, b_wl1, wl, b_wl2, wl, b_wl3);
legend(sprintf('Temp1 = %f K', t1),sprintf('Temp2 = %f K', t2),sprintf('Temp3 = %f K', t3));
xlabel('Wavelength'); 
ylabel('Spectral Radiance'); 
title('Planck''s Law In Visible Light Wavelength Range');
hold off