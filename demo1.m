%filtering demo

%load example signal
clear; clc;
set(0,'defaultwindowstyle','docked');
%load violin and bass
[Bass, Fsb] = audioread();
[Violin, Fsv] = audioread();

n = (0:length(Bass)-1);
Mixed = Bass(n+1) + Violin(n+1);

%calculating forier transform of input
N = length(Mixed);
MixedF = (1/N)*fft(Mixed);

cutOff = round(300*N/Fsb);
FilteredSpectrum = MixedF;
FilteredSpectrum(cutoff:N/2) = 0;
FilteredSpectrum(N/2+1:N-cutoff) = 0;
signal = real(N*ifft(FilteredSpectrum));

fc = 300/Fsb; %cut off for bass drum
M = 1027;
shift = (M-1)/2;
lpr = 2*fc*sinc(2*fc*((0:M-1)-shift));
filtered = conv(Mixed, lpr, 'same');
