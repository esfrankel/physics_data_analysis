%%%Author: Eric Frankel
clear all;
v_object=input('Please input the velocity of the object in m/s: ');
mass=input('Please input the mass of the object in kg: ');
v_frame=input('Please input the relative velocity of the reference frame in m/s: ');
c=3e8;
gamma_object=1/sqrt(1-(v_object^2/c^2));
gamma_frame=1/sqrt(1-(v_frame^2/c^2));
momentum_init=gamma_object*mass*v_object;
kin_energy_init=(gamma_object-1)*mass*c^2;
energy_init=(gamma_object)*mass*c^2;
momentum_fin=gamma_frame*(momentum_init+(v_frame*energy_init)/(c^2));
energy_fin=gamma_frame*(energy_init+v_frame*momentum_init);
kin_energy_fin=energy_fin-(mass*c^2);
disp(momentum_fin);
disp(kin_energy_fin);
disp(energy_fin);