% Author: Eric Frankel
% Photoelectric Effect Matlab Code

clear
clc
disp('This code functions as follows: the user will input three different temperatures, and Planck''s Law');
disp('distributions will be made accordingly. The code will generate 10,000 wavelengths from each');
disp('distribution weighted by the distribution using an altered pdf function. These wavelengths are then');
disp('converted to frequencies, and are scatterplotted to see whether they release a photoelectron.');
t1 = input('Input a temperature for the blackbody: (Test case: 3000K) ');
t2 = input('Input a temperature for the blackbody: (Test case: 4000K) ');
t3 = input('Input a temperature for the blackbody: (Test case: 5000K) ');
wl = linspace(0.0000001,3e-6);
c = 3e8; %speed light m/s
freq = wl/c;
h = 6.626e-34; %Planck's constant
k = 1.381e-23; %Boltzmann constant
wf = 4.33 * 1.6e-19;
b_wl1 = (2.*h.*c^2)./((wl.^5).*(exp(h.*c./(wl.*k.*t1))-1));
b_wl2 = (2.*h.*c^2)./((wl.^5).*(exp(h.*c./(wl.*k.*t2))-1));
b_wl3 = (2.*h.*c^2)./((wl.^5).*(exp(h.*c./(wl.*k.*t3))-1));


p=b_wl1;
dim=[10000 1];
wl=wl(:);
p=p(:)./trapz(wl,p(:));

% interpolation of the input pdf for better integration
pxi=[linspace(min(wl),max(wl),10000)]';
pi=interp1(wl,p,pxi,'linear');

% computing the cumulative distribution function for input pdf
cdfp = cumtrapz(pxi,pi);

% finding the parts of cdf parallel to the X axis 
ind=[true; not(diff(cdfp)==0)];

% and cut out the parts
cdfp=cdfp(ind);
pi=pi(ind);
pxi=pxi(ind);

% generating the uniform distributed random numbers
uniformDistNum=rand(dim);

% and distributing the numbers using cdf from input pdf
dist1=interp1(cdfp,pxi,uniformDistNum(:)','linear');

% ----------

p=b_wl2;
dim=[10000 1];
wl=wl(:);
p=p(:)./trapz(wl,p(:));

% interpolation of the input pdf for better integration
pxi=[linspace(min(wl),max(wl),10000)]';
pi=interp1(wl,p,pxi,'linear');

% computing the cumulative distribution function for input pdf
cdfp = cumtrapz(pxi,pi);

% finding the parts of cdf parallel to the X axis 
ind=[true; not(diff(cdfp)==0)];

% and cut out the parts
cdfp=cdfp(ind);
pi=pi(ind);
pxi=pxi(ind);

% generating the uniform distributed random numbers
uniformDistNum=rand(dim);

% and distributing the numbers using cdf from input pdf
dist2=interp1(cdfp,pxi,uniformDistNum(:)','linear');

% -----------

p=b_wl3;
dim=[10000 1];
wl=wl(:);
p=p(:)./trapz(wl,p(:));

% interpolation of the input pdf for better integration
pxi=[linspace(min(wl),max(wl),10000)]';
pi=interp1(wl,p,pxi,'linear');

% computing the cumulative distribution function for input pdf
cdfp = cumtrapz(pxi,pi);

% finding the parts of cdf parallel to the X axis 
ind=[true; not(diff(cdfp)==0)];

% and cut out the parts
cdfp=cdfp(ind);
pi=pi(ind);
pxi=pxi(ind);

% generating the uniform distributed random numbers
uniformDistNum=rand(dim);

% and distributing the numbers using cdf from input pdf
dist3=interp1(cdfp,pxi,uniformDistNum(:)','linear');
count1=0;count2=0;count3=0;
freq_dist1=zeros(1,10000);
ke_1=zeros(1,10000);
freq_dist2=zeros(1,10000);
ke_2=zeros(1,10000);
freq_dist3=zeros(1,10000);
ke_3=zeros(1,10000);
for i=1:10000
    freq_dist1(i) = c/dist1(i);
    holder = h*freq_dist1(i);
    if holder >= wf
        count1=count1+1;
        ke_1(i) = holder - wf;
    else
        ke_1(i) = 0;
    end
end

for i=1:10000
    freq_dist2(i) = c/dist2(i);
    holder = h*freq_dist2(i);
    if holder >= wf
        count2=count2+1;
        ke_2(i) = holder - wf;
    else
        ke_2(i) = 0;
    end
end

for i=1:10000
    freq_dist3(i) = c/dist3(i);
    holder = h*freq_dist3(i);
    if holder >= wf
        count3=count3+1;
        ke_3(i) = holder - wf;
    else
        ke_3(i) = 0;
    end
end

y = @(x) h*x-wf;

disp('Number of Photoelectrons from Distribution 1');
disp(count1);
disp('Number of Photoelectrons from Distribution 2');
disp(count2);
disp('Number of Photoelectrons from Distribution 3');
disp(count3);

hold on
subplot(4,2,1);
plot(wl, b_wl1, wl, b_wl2, wl, b_wl3);
xlim([1e-8 3e-6])
xlabel('Wavelength'); 
ylabel('Spectral Radiance'); 
title('Planck''s Law');
subplot(4,2,2);
plot(wl, b_wl1, wl, b_wl2, wl, b_wl3);
xlim([390e-9 700e-9]);
legend(sprintf('%fK', t1),sprintf('%fK', t2),sprintf('%fK', t3));
xlabel('Wavelength'); 
ylabel('Spectral Radiance'); 
title('Planck''s Law In Visible Light Wavelength Range');
subplot(4,2,[3 4]);
scatter(freq_dist1,ke_1);
refline([h -wf]);
refline([0 0]);
xlabel('Frequency')
ylabel('Photoelectron KE');
title(sprintf('Photoelectric Effect at %fK', t1));
ylim([-10e-19 10e-19]);
subplot(4,2,[5 6]);
scatter(freq_dist2,ke_2);
refline([h -wf]);
refline([0 0]);
xlabel('Frequency')
ylabel('Photoelectron KE');
title(sprintf('Photoelectric Effect at %fK', t2));
ylim([-10e-19 10e-19]);
subplot(4,2,[7 8]);
scatter(freq_dist3,ke_3);
refline([h -wf]);
refline([0 0]);
xlabel('Frequency')
ylabel('Photoelectron KE');
title(sprintf('Photoelectric Effect at %fK', t3));
ylim([-10e-19 10e-19]);
hold off