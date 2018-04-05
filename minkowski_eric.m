clear all
v = input('Please input the relative velocity of the moving reference frame: ');
x=linspace(-100,100);
beta = (v/(3e8));
if v<0
    light=-x;
else
    light=x;
end
x_p=beta * x;
hold on
ct = 1/beta * x;
plot(x,light,x,x_p,x,ct,linspace(-100,100), zeros(100,1),zeros(100,1), linspace(-100,100));
legend('Light','x''','ct''','x-axis','y-axis');
xlim([-100 100]);
ylim([-100 100]);
title('Minkowski Diagram');
xlabel('x');
ylabel('ct');
hold off