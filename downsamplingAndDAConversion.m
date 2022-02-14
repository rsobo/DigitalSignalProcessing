%Task 0
gong = load('gong');
%Task 1
t=(0:42027);
t = t';
plot(t,gong.y);
title('Gong vs Time');
xlabel('Time (sec)');
ylabel('Gong Signal');
%Task 2
sound(gong.y, gong.Fs);
%Task 4
gong2 = downsample(gong.y,2);
%Task 5
sound(gong2, gong.Fs);
%Task 6
sound(gong2, gong.Fs/2);
%Task 3
plotContinuousFFT(gong.y, gong.Fs);
function plotContinuousFFT(s, Fs)
    N = length(s); 
    if ~mod(N,2)
        s(end+1) = 0; 
        N = N + 1; 
    end
    S = abs(fft(s));
    S = circshift(S,(N-1)/2);
    figure
    F = linspace(-Fs/2,Fs/2,N);
    plot(F,S); 
    xlabel('Frequency'); 
    title('Magnitude spectrum');
end

