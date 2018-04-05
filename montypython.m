%%%%%%%%%% Eric Frankel
clear all;
close all;
clc;

n = input('Input the number of trials.  ');
rad = input('Input the radius of your circle.  ');
a = input('Input the area of the square. ');
l = sqrt(a);
if(l/2<rad)
    disp('Error: the square-circle combination is illegal.');
    return
end

x1=-l/2; x2=l/2; y1=-l/2; y2=l/2;
x = [x1, x2, x2, x1, x1];
y = [y1, y1, y2, y2, y1];
plot(x, y, 'g-', 'LineWidth', 3);
hold on;

t = linspace(0,2*pi);
plot(rad*cos(t),rad*sin(t), 'LineWidth', 4)
 
random = l * rand(n,2) - l/2;
incirc = 0;
outcirc = 0;

xlim([-l l]);
ylim([-l l]);
axis square;

for i = 1: size(random)
    plot(random(i,1),random(i,2),'rs','MarkerSize',2);
    if(random(i,1)^2 + random(i,2)^2 < rad^2)
        incirc = incirc + 1;
    else
        outcirc = outcirc + 1;
    end
    findPi = (a * incirc)/((incirc + outcirc)*rad^2);
end
disp(findPi)