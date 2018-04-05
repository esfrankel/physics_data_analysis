%%% Eric Frankel - Medium 7
m = input('Input the mass of a gas particle: ');
N = input('Input the number of gas particles: ');
T = input('Input the gas temperature: ');
k = 1.38e-23; c1 = (m/(2*pi*k*T))^1.5; 
v_rms_theo = sqrt((3*k*T)/m);
f = @(v) (4*pi*c1).*v.^2.*exp((-m.*v.^2)./(2*k*T)); 
f_sq = @(v) f(v.^2); 
f_rms = @(v) (v.^2).*f(v);
v_dom = sort(rand(N,1).*(6*v_rms_theo)); sum_f = 0; sum_f2 = 0; v_rms = 0;
for i=1:N-1
    v2 = v_dom(i+1); 
    v1 = v_dom(i);
    sum_f = sum_f + (v2-v1)*(f(v2)+f(v1))/2;
    sum_f2 = sum_f2 + (v2^2-v1^2)*(f_sq(v2)+f_sq(v1))/2;
    v_rms = v_rms + (v2-v1)*(f_rms(v2)+f_rms(v1))/2;
end
v_rms = sqrt(v_rms); disp('Velocity distribution area: '); 
disp(sum_f);
disp('Velocity squared distribution area: '); 
disp(sum_f2);
disp('RMS speed theoretical: '); 
disp(v_rms_theo);
disp('RMS speed (Monte Carlo): '); 
disp(v_rms);
disp('Average KE of particle (J): '); 
ke = 0.5*m*v_rms^2; 
disp(ke);
hold on; 
subplot(2,1,1); 
plot(v_dom,f(v_dom)); 
xlabel('Speed (v)'); 
ylabel('Probability'); 
title('Speed distribution');  
subplot(2,1,2); 
plot((v_dom).^0.25,f_sq(v_dom)); 
xlabel('Speed (v)'); 
ylabel('Probability'); 
title('Speed squared distribution'); 