% Eric Frankel
disp('The code works as follows: the user will input values for the length of the energy well, its');
disp('potential energy, and the mass of the particle. The code will display a graph, and the user');
disp('will input the number of times it the red and blue lines intersect (not the vertical blue lines).');
disp('The user will then input the number of intersection points into the code when prompted after')
disp('exiting the graph, and the code will calculate the gammas and their corresponding energy states.')
pe = input('Input the potential energy of the well barriers: ');
len = input('Input the width of the well: ');
energy = input('Input the energy of the particle: ');
mass = input('Input the mass of the particle: ');
hbar = 1.0545718e-34;
C = (mass*pe*len^2)/(2*hbar^2);
y1 = @(x) x;
y2 = @(x) sqrt(C-x.^2)./tan(x);
hold on
fplot(y1, [0,C], 'r');
fplot(y2, [0,C], 'b');
xlim([0 C/4]);
ylim([-C C])
hold off
guess_num = input('Input the number of guesses: ');
close all
guesses=zeros(1,guess_num);
gammas=zeros(1,guess_num);
guesses(1)=1e-2;
for i=2:guess_num
    guesses(i)=guesses(i-1)+pi;
end
C = (mass*pe*len^2)/(2*hbar^2);
f = @(x) (sqrt(C-x.^2)./tan(x))-x;
f_prime = @(x) -(x.*cot(x)./(sqrt(C-x.^2)))-sqrt(C-x.^2).*csc(x).^2-1;
for i=1:guess_num
    old_gamma=0;
    current_gamma=guesses(i);
    while current_gamma - old_gamma > 1e-10
        old_gamma=current_gamma;
        current_gamma=old_gamma - f(old_gamma)/f_prime(old_gamma);
    end
    gammas(i) = current_gamma;
end
disp('Values of gamma: ');
disp(gammas);
energy=zeros(1,guess_num);
for i=1:guess_num
    energy(i)=2*(hbar^2)*(gammas(i)^2)/(1.6e-19*mass*len^2);
end
disp('Allowed energy levels in eV: ');
disp(energy);