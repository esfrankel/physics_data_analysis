% Eric Frankel
clear
clc
m = input('Input the mass of the object: ');
ke = input('Input the kinetic energy of the object in Joules: ');
c=29979245; %Precise Speed of Light
h=6.62607004e-34; %Precise Planck's Constant
pc = sqrt(ke^2+2*ke*m*c^2);
wl = h*c/pc;
disp('De Broglie Wavelength: ');
disp(wl);