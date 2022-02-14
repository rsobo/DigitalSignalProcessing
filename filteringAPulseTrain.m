%% generate the pulse train given above for 10 periods and store the result in pulseTrain
N = 50; 
n = 0:10*N-1; 
pulseTrain = zeros(length(n),1);
for i = (0:length(n)-1)
    if(mod(i,N) <= 10)
       pulseTrain(i+1) = 1; 
    end
end

%% the following script should plot the generated pulse train
pulseTrainFig = figure(); clf; hold on; 
plot(n,pulseTrain); 

%% compute the first 25 fourier series coefficients of the pulse train
ks = 0:N/2-1;
Xk = zeros(length(ks),1); %write script below to compute the coefficients and store in Xk


%% the following script should plot the Fourier series coefficients 
seriesCoefficientsFig = figure(); clf; hold on; 
stem(ks, abs(Xk)); 

 
%% compute the impulse response of a filter which will remove all but the first two harmonics of pulseTrain
% store the result in h2
Nh = 401;
n = (-(Nh-1)/2:(Nh-1)/2)';
h2 = zeros(Nh,1); 



%the following script will plot the Fourier transform of h2. You can use this to check if you computed the correct impulse response. 
freqResolution = 1024; 
H = fft(h2,freqResolution); 
freq = (0:freqResolution-1)/freqResolution; 

select = (freq < 1); 
calculatedSpectrumFig = figure(); 
plot(freq(select), abs(H(select)));
title('Magnitue spectrum of calculated impulse response');
xlabel('Discrete frequency (f)'); 
ylabel('|H(f)|');

%% filter the pulseTrain to remove all but the first two harmonics. 
%store the resulting signal in a variable caleed "twoHarmonics"
%twoHarmonics must the be the same size as pulseTrain (use 'same' option in the conv function)
twoHarmonics = zeros(length(pulseTrain),1);


%the following script will plot twoHarmonics and pulseTrain in the same figure
twoHarmonicsFig = figure(); clf; hold on; 
n = 0:length(twoHarmonics)-1;
plot(n,twoHarmonics);
plot(n,pulseTrain);


%% compute the impulse response of a filter which will remove all but the first harmonic of pulseTrain
% store the result in h1
Nh = 401;
n = (-(Nh-1)/2:(Nh-1)/2)';
h1 = zeros(Nh,1); 




%% filter the pulseTrain to remove all but the first harmonic. 
%store the resulting signal in a variable caleed "oneHarmonic"
%oneHarmonic must the be the same size as pulseTrain (use 'same' option in the conv function)
oneHarmonic = zeros(length(pulseTrain),1);



%the following script will plot oneHarmonic and pulseTrain in the same figure
oneHarmonicFig = figure(); clf; hold on; 
n = 0:length(twoHarmonics)-1;
plot(n,oneHarmonic);
plot(n,pulseTrain);


%% helper function
function sumExp = sumExp(k,xn,N,n)
    sumExp = (1/N)*sum(xn.*(exp(-1j*2*pi*(k/N).*n)));
end






