% Eric Frankel
user = input('Input 0 for an infinite well, 1 for a finite well. '); 
if user == 1
    U0 = input('Input the potential surrounding the finite well in Joules (Suggestion: 10eV): '); 
    a = input('Input the width of the finite well in meters (Suggestion: 1nm): '); 
    m = input('Input the mass of the particle in the well in kilograms (Suggestion: electron mass): '); 
    h_bar = 6.626e-34/(2*pi);
    c = (m*U0*a^2)/(2*h_bar^2); 
    f = @(x) sqrt(c - x.^2)./tan(x)-x; 
    f_1 = @(x) -(x.*cot(x)./(sqrt(c-x.^2)))-sqrt(c-x.^2).*csc(x).^2-1; 
    max = sqrt(c); 
    states = ceil(max/pi);
    offset = 1e-2; 
    gamma = zeros(1,21);  
    for i = 1:states
        guess = offset + (i-1)*pi;
        for j = 1:20
            guess = guess-f(guess)./f_1(guess);
        end
        gamma(i) = guess; 
    end
    endguess = max - offset; 
    for i = 1:20
        endguess = endguess - f(endguess)./f_1(endguess); 
    end
    gamma(21) = endguess; 
    for i = 1:size(gamma,2)
        if(~isreal(gamma(i)))
            gamma(i) = 0; 
        end
    end
    gamma = unique(gamma(gamma > 0)); 
    disp('Values of Gamma: ');
    disp(gamma)
    energies = ((2*h_bar^2).*gamma.^2)./(m*a^2); 
    disp('Allowed Energies: ');
    disp(energies)
    hold on; 
    k1 = sqrt(2*m.*energies./(h_bar^2)); 
    k2 = sqrt(2*m.*(U0-energies)./(h_bar^2)); 
    L = linspace(-a,-a/2,1e2); 
    M = linspace(-a/2,a/2,1e2);
    R = linspace(a/2,a,1e2); 
    for i = 1:1:size(energies,2)
        color_randomizer = rand(3,1); 
        begin = @(x) cos(0.5*k1(i)*a)*exp(k2(i)*0.5*a)*exp(k2(i)*x);
        mid = @(x) cos(k1(i)*x);
        endp = @(x) cos(0.5*k1(i)*a)*exp(k2(i)*0.5*a)*exp(-k2(i)*x);
        plot(L, begin(L), 'Color', color_randomizer); 
        plot(M, mid(M), 'Color', color_randomizer); 
        plot(R, endp(R), 'Color', color_randomizer); 
    end
    xlim([-a a]); 
    pl1=line([a/2 a/2], ylim); pl1.Color='black';
    pl2=line([-a/2 -a/2], ylim); pl2.Color='black';
    xlabel('Position (m)'); 
    ylabel('Wave function');
    title('Finite Well (E<U)'); 
else
    n = input('Input the quantum number of the particle: '); 
    L = input('Input the width of the infinite well (m): ');
    position = @(x) sqrt(2/L)*sin(n*pi*x/L); 
    x1 = linspace(0,L,1e5); 
    y1 = position(x1); 
    plot(x1,y1);
    xlabel('Position (m)'); 
    ylabel('Wave function');
    title('Infinite Well');
end