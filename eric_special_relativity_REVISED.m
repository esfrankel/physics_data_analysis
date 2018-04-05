%Script will take a speed and calculate beta and gamma
%Will calculuate proper time and dilated time
%Will calculate proper length and cotnracted length
%Inputs a velocity in one frame and calculates the relative velocity in a
%different frame. Takes all possibilities
%Inputs a frequency in one frame and calculates the shifted frequency in a
%relative frame
v = input('Input the velocity of the frame as a 1x3 array ');
t = input('Input the proper time ');
l = input('Input the proper length ');
v_sprime = input('Input the velocity of the frame observing the object in a 1x3 array ');
freq = input('Input the frequency of the source ');
direction = input('Is the source approaching the the observer? Write 1 or 0, 1 for yes, 0 for no ');
c=3*10^8;
beta = sqrt(v(1)^2+v(2)^2+v(3)^2)/(c);
gamma = 1/sqrt(1-beta^2);
cont_length = l/gamma;
dil_time = t*gamma;
v_prime_from_v = [(v(1)-v_sprime(1))/(1-(v(1)*v_sprime(1)/(c^2))),(v(2)-v_sprime(2))/(1-(v(2)*v_sprime(2)/(c^2))),(v(3)-v_sprime(3))/(1-(v(3)*v_sprime(3)/(c^2)))];
primefreq=0;
if direction == 1
    primefreq = freq*(sqrt(1+beta)/sqrt(1-beta));
elseif direction == 0
    primefreq = freq*(sqrt(1-beta)/sqrt(1+beta));
else
    printf("Error: incorrect value entered.")
end
answer1 = ["Gamma: ",gamma;"Beta: ",beta;"Dilated time: ", dil_time;"Contracted length: ",cont_length;"Frequency of source from S' frame: ",primefreq]
v_prime_from_v