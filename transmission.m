%Eric Frankel
clear
clc
a=input('Input the width of the barrier (m): ');
E=input('Input the energy of the particle (J): ');
V=input('Input the energy of the barrier (J): ');
m=input('Input the mass of the particle (kg): ');
hbar=1.0546e-34;
beta=sqrt(2*m*(V-E))/hbar;
T=(1+(sinh(beta*a)^2)/(4*(E/V)*(1-E/V)))^(-1);
disp(T);