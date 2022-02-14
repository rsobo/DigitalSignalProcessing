%2.1 B1
%x=(-4:4);
%y = [0, 1/3, 2/3, 1, 1, 1, 1, 0, 0];
%stem(-x+4, y);
%title('2.1');
%xlabel('Sample');
%ylabel('Value at sample');

%2.2 G
%x=(-2:5);
%unitStep=[0,0,0,1,2,3,4,5];
%delta = [0,0,0,1,0,0,0,0];
%y=[0,1,1,1,1,1/2,1/2,0];
%stem(((x-flip(x))/2),y);
%title('2.2');
%xlabel('Sample');
%ylabel('Value at sample');

%2.4/5
x=[2,3,4,5,6];
%total energy
energy = 0;
for i = (1:length(x))
    energy = energy + abs(x(i))^2;
end
%odd energy
oddEnergy = 0;
for i = (1:length(x))
    oddEnergy = oddEnergy + abs(((x(i)-flip(x(i)))/2))^2;
end
%even energy
evenEnergy = 0;
for i = (1:length(x))
    evenEnergy = evenEnergy + abs(((x(i)+flip(x(i)))/2))^2;
end
totalEnergy = oddEnergy + evenEnergy;