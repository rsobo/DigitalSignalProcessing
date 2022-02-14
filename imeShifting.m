% the following code creates a pair (n,x) containing and the n-values and the signal values
n = -10:12; 
x = zeros(length(n),1); 
x(n>= -5 & n < 0) = 1; 
x(n>=0 & n<=5) = n(n>=0 & n<=5)+1; 

%the following script plots the above signal. 
figure(); 
subplot(2,1,1);
stem(n,x);
xlim([-15,15]); 
title('x[n]');

%write a script below which creates another pair (ny,y) containing the n-values 
%and the signal values of the signal y[n] = x[n-2] the y values are already created.
%You only need to create an array with the ny values, so that stem(ny,y) will create the right plot. 
y = x;
ny=n+2;
%after you complete the above script, you can use the commented script below to see how the signal you created looks like
subplot(2,1,2);
stem(ny,y);
xlim([-15,15]); 
title('y1[n] = y[n-2]=x[-n+2] (delay)');
