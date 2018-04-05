clear
clc
length = input('Please input the length of the well: ');
num = input('Please input the quantum number of interest: ');
ub = input('Please input the upper bound of the interval (less than the length): ');
lb = input('Please input the lower bound of the interval (greater than zero): ');
x = linspace(0, length);
wave = sqrt(2/length).*sin(num.*pi.*x/length);
wave_sq = wave.^2;
wave_func = @(x) sqrt(2/length).*sin(num.*pi.*x/length);
wave_sq_func = @(x) wave_func(x).^2;
area1=integral(wave_sq_func,lb,ub);
disp('Probability of being within region of interest: ')
disp(area1);
stupid_eric = linspace(lb, ub);
stupid_wave = sqrt(2/length).*sin(num.*pi.*stupid_eric/length);
stupid_wave_sq = stupid_wave.^2;
hold on
subplot(2,1,1);
plot(x, wave);
hold on
area(stupid_eric, stupid_wave);
xlim([0 length])
ylim([-sqrt(3/length) sqrt(3/length)])
xlabel('x'); 
ylabel('\psi'); 
title('\psi Within the Well');
subplot(2,1,2);
plot(x, wave_sq);
hold on
area(stupid_eric, stupid_wave_sq);
xlim([0 length]);
ylim([0 (3/length)])
xlabel('x'); 
ylabel('\psi^2'); 
title('\psi^2 Within the Well');
hold off