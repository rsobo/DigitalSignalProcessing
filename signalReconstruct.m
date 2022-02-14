%Consider the periodic discrete-time triangular signal 
%x[n] = n, 0 <= n <= 4, and x[n] = 8-n, 5 <= n <= 7, and x[n+8m] = x[n],
%for all integers m. 

%the following script generate one period of x[n] in the range 0<=n<=8. 
N = 8;
n = 0:7; 
x = zeros(length(n),1); %logical indexing
x(n>=0 & n<=4) = 0:4;
x(n>=5 & n<=8) = 3:-1:1; 
%compute the signal for the range -m*N<=n<=m*N-1, m=1000 (spanning 2*m periods)and
%store the signal a variable called x4. x4 should be a column vector
%Optional: Try to do this without a for loop (hint: use the mod function)

m=1000;
max = 2*m*N;
for i = (1:2)
    x4 = cat(1, x4, x);
end
x4 = x4(1:16000);

%Use the formula for the discrete time Fourier series coefficients to compute the
%coefficients for k = 0 through N-1 and store the result in X. X should be
%a column vector
%Optional: Do it without for loop


X = fft(x4,N);
X=X/N;


%Use the definition of the Fourier series expansion (inverse Fourier
%series) to calculate the values of x4 for n = 7 through 148 and store the
%result in x4recovered (x4recovered should be column vector)
%Optional: Do it without for loop


x4recoveredTemp = ifft(X*N,N);
for i = 0:4
    x4recoveredTemp = cat(1, x4recoveredTemp, x4recoveredTemp);
end
x4recovered = x4recoveredTemp(8:149);



