%%% Author: Eric Frankel
%%% Monty Carlo simulation for Rutherford Scattering for a gold atom
clear
clc
disp('Test cases to check: 7.76')
proj_num = input('Input the number of alpha particles to shoot at the target atom: (Test Case: 100)');
ke = input('Input the kinetic energy of an individual alpha particle: (Test Case: 7.7e2 * 1.6e-19)');
beam_size = input('Input the diameter of the beam: (Test Case: 1e-9)');

m_au = 3.27e-25; %3.27e-25 is the mass of a gold nucleus (kg)
m_alpha = 6.644e-27; %Fill in mass of an alpha particle
k = 8.987e9; %Fill in value of k
q_alpha = 2*1.6e-19; %Fill in charge of alpha particle
q_gold = 79*1.6e-19; %Fill in charge of gold nucleus
e_0=8.854e-12; %Permissivity
h_bar=3.1612-26; %H_bar


r_m = k*q_alpha*q_gold/(ke);
v_proj = sqrt(2*ke/m_alpha);

b = beam_size*rand(proj_num,1);
for i=1:proj_num
    if b(i,1) == 0
        b(i,1) = abs(max(b))/10;
    end
    num = b(i,1)*m_alpha*v_proj^2;
    denom = k*q_alpha*q_gold;
    phi = acot(num/denom);
    theta = phi/2
    t = linspace(-20*pi,20*pi,10000);
    X = r_m*cot(theta)*sinh(t)*cos(theta)+r_m*cosh(t)*sin(theta);
    Y = r_m*cot(theta)*sinh(t)*sin(theta)+r_m*cosh(t)*cos(theta)+b(i,1);
    plot(X,Y);
    plot(X,-Y);
    hold on
end

xlim([-3*beam_size 3*beam_size])
ylim([-3*beam_size 3*beam_size])
disp('Radius of closest approach: ');
disp(r_m);
disp('Approximate cross-sectional area of atom: ');
disp(pi*r_m^2);