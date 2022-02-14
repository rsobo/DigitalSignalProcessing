%question 1
n1=[0,1,2,3];
N1=4;
xn1 = abs(sin((pi/4)*n1));
sum1=zeros(4,1);
for k1 =(0:N1-1)
    sum1(k1+1) = sumExp(k1, xn1, N1, n1);
end

%question 2
n2=[0,1,2,3,4,5];
N2=length(n2);
xn2=[1,0,1,2,3,2];
sum2=zeros(N2,1);
for k2 =(0:N2-1)
    sum2(k2+1) = sumExp(k2, xn2, N2, n2);
end
sum2 = N2*sum(abs(sum2).^2);
sum21 = sum(abs(xn2).^2);

%question 3
N3=6;
n3=0:N3-1;
for k3=(0:N3-1)
   sum3=sum(exp(1j*2*pi*k3.*n3./N3));
end
sum31 = sum3 > .00001;
sum31 = sum3(sum31);

%helper function
function sumExp = sumExp(k,xn,N,n)
    sumExp = (1/N)*sum(xn.*(exp(-1j*2*pi*(k/N).*n)));
end