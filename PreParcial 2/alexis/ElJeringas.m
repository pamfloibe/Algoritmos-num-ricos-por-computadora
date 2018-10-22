%Primer problema
close all;
Cmax=0.5;
Cmin=0.05;
b=0.1;
t=[1:0.1:500];
nIny=20;
y=zeros(nIny,length(t));
nIny=18;
tmin=zeros(1,nIny);
tmax=zeros(1,nIny);
A=Cmax*b*2.71;
tmax(1)=1/b;
f=@(t) A*(t).*exp(-b*t)-Cmin;
y(1,:)=f(t);
tmin(1)=raizBiseccion(f,tmax(1),500,1e-10);

for i=2:nIny
    f=@(t) A*(t-tmin(i-1)).*exp(-b*(t-tmin(i-1)))-Cmin;
    tmax(i)=(1+tmin(i-1)*b)/b;
    tmin(i)=raizBiseccion(f,tmax(i),500,1e-10);
    y(i,:)=f(t);
end
ytot=zeros(1,length(t));
ytot=y(1,:)+Cmin;
hold on;
for i=2:nIny
    ytot=ytot+(y(i,:)+Cmin).*(t>tmin(i-1));
end
plot(t,ytot)