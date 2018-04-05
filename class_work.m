domain=linspace(0,200,10000);
f1 = @(x) cos(7*x); %period = pi/7
f2 = @(x) sin(x); %period = pi/1
f3 = @(x) cos(5*x); %period = pi/5
f4 = @(x) sin(11*x); %period = pi/11
sum = @(x) f1(x)+f2(x)+f3(x)+f4(x);
test = sum(domain);
tr=fft(test);
trr=abs(tr);
recip=linspace(0,200,10000);
for x=1:10000
    recip(x)=x/200;
end
hold on
plot(recip,trr);
xlim([0,10]);
hold off
disp(pi/7);
disp(pi/1);
disp(pi/5);
disp(pi/11);