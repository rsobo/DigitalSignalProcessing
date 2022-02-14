%Simulation 1 and Question 3
fs = 3;
power = myPower(fs);

Fs = (3:100);
for i = (1:length(Fs))
   y(i)=myPower(Fs(i)); 
end
stem(Fs,y);
title('Sampling Rate vs Signal Power');
xlabel('Sampling Rate Fs');
ylabel('Signal Power');

function power = myPower(fs)
    n = 0:1/fs:2;
    x=zeros(length(n));
    x(0<=n<=1) = n;
    x(1<n<2) = 1-n;
    sum = 0;
    for i = (1:length(x))
       sum = sum + abs(x(i))^2;
    end
    power = sum/length(x);
end