% Eric Frankel
clear
clc
n=input('Input the number of terms to calculate to: ');
func=input('Input the desired function in function handle form (exp: @(x) x.^2): ');
ub=input('Input the upper bound of the boundary: ');
lb=input('Input the lower bound of the boundary: ');
domain=linspace(lb,ub,10000);
range=zeros(1,10000);
P=ub-lb;
a_0=(2/P)*integral(func,lb,ub);
range=range+a_0*0.5;
for i=1:n
    a_n=(2/P)*integral(@(x) func(x).*cos(2.*pi.*i.*x/P),lb,ub);
    b_n=(2/P)*integral(@(x) func(x).*sin(2.*pi.*i.*x/P),lb,ub);
    range=range+a_n.*cos(2.*pi.*i.*domain/P)+b_n.*sin(2.*pi.*i.*domain/P);
end
hold on
fplot(func,[lb ub]);
plot(domain,range);
title('Original Function vs. Fourier Series Approximation');
legend('User Input Function','Fourier Series Approx')
hold off