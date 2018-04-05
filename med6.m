%%%% Author: Eric Frankel
clc;
lb=input('Input the lower bound of the domain. ');
ub=input('Input the upper bound of the domain. ');
f=@(v) exp(-v.^2).*log(v).^2.+v.^2;
normalizer=integral(f,lb,ub);
f=@(v) f(v)/normalizer;
total_area=integral(f,lb,ub)
v_avg=integral(@(v) f(v).*v,lb,ub)
holder=integral(@(v) f(v).*v.^2,lb,ub);
v_rms=sqrt(holder)
fplot(f,[lb,ub])