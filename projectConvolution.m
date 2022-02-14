

%% Simulation 2
load('data.mat');
h1 = ones(5,1)/5;
h2 = ones(7,1)/7;
yn1 = myConv(data, h1);
yn2 = myConv(data, h2);
stemFig = figure();
stem((0:length(yn1)-1), yn1);
hold on;
stem((0:length(yn2)-1), yn2);
title('S&P 500 Average Closing Value');
xlabel('Sample');
ylabel('Discrete Value');
hold off;
plotFig = figure();
plot((0:length(yn1)-1), yn1);
hold on;
plot((0:length(yn2)-1), yn2);
title('S&P 500 Average Closing Value');
xlabel('Sample');
ylabel('Discrete Value');
hold off;

%% Simulation 4
x = zeros(20,1);
x(6:11) = 1;
h = zeros(20,1);
h(3:5) = 1;
y = myConvGeneric((0:length(x)-1), x, (0:length(h)-1), h);

%% Simulation 3
function myConvGeneric=myConvGeneric(nx, x, nh, h)
    M = length(nh);
    N = length(nx);
    L = M+N-1;
    myConv=zeros(L,1);
    ny = (0:length(myConv));
    for n=(0:L-1)
        s=0;
        for k = (max(0,n-M+1):min(n,N-1))
            s = s+x(k+1)*h(n-k+1);
        end
        myConv(n+1)=s;
    end
    myConvGeneric.ny = ny;
    myConvGeneric.y = myConv;
end

%% Simulation 1
function myConv=myConv(x,h)
    M = length(h);
    N = length(x);
    L = M+N-1;
    myConv=zeros(L,1);
    for n=(0:L-1)
        s=0;
        for k = (max(0,n-M+1):min(n,N-1))
            s = s+x(k+1)*h(n-k+1);
        end
        myConv(n+1)=s;
    end
end