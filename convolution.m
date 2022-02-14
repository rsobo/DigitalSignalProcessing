%coding convolution
%implements a colvolution that shifts y by 1 sample at a time
%implements convolution in 2 different ways

x = [3, 5, 2, 5, 4, 7, 8];
h = [0,1,0,1,1,1,1,1,1,1,1,1,0];
y = convolve(x,h);
y2 = convolve2(x,h);

function convolute=convolve(x,h)
    M = length(h);
    N = length(x);
    L = M+N-1;
    convolute=zeros(L,1);
    for n=(0:L-1)
        s=0;
        for k = (max(0,n-M+1):min(n,N-1))
            s = s+x(k+1)*h(n-k+1);
        end
        convolute(n+1)=s;
    end
end

function convolute=convolve2(x,h)
    M = length(h);
    N = length(x);
    L = M+N-1;
    convolute=zeros(L,1);
    for k = (0:N-1)
        shiftedh = zeros(L,1);
        shiftedh(k+1:k+M)=h;
        convolute = convolute + x(k+1)*shiftedh;
    end
end