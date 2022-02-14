%Simulation 1
%variable settings
amp = rand(1, 5);
phase = rand(1, 5);
f = 0.005;
B = 5*f;
t = 0:1:1000;
%signal creation
y = 0;
for i = (1:5)
   y = y + (amp(i)*sin((2*pi*i*f*t)+phase(i)));
end
%signal plotting
plot(t, y);
title('Simulation 1');
xlabel('Time (sec)');
ylabel('Signal');
hold on;

%Simulation 2
alpha = 2.2;
Fs = alpha*B;
N = 5 * Fs * (1/f);
n = int64((1:N)/Fs);
x=y(n);
stem(n, x);
hold off;

%Simulation 3
plot(t, y);
hold on;
plot(n, x);
title('Simulation 4');
xlabel('Time (sec)');
ylabel('Signal');

%Simulation 4
g = sinc((t'-n));
rec = g*x';
plot(t, y);
hold on;
plot(n, x);
hold on;
plot(t, rec);
legend('Original', 'Sampled', 'Recovered (α=2.2)');
