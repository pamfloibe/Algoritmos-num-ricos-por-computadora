a=12.5577822;
b=0.0018626;
P=65000;
T=-40+273.15;
R=0.518;
syms v
f = sym(-P+(R*T)/(v-b)-a/(v*(v+b)*sqrt(T)));
df = diff(f);
iMax=100;
tol=1e-7;

x0=2e-3;

rSol=zeros(iMax,1);
rSol(1)=x0;
nIter=0;
eAbs=1000;
errorV=zeros(iMax,1);
while nIter<iMax && eAbs>tol
    razon = double(subs(f,x0))/double(subs(df,x0));
    xn = x0-razon;
    rSol(nIter+1)=xn;
    eAbs = abs(xn - x0);
    errorV(nIter+1)=abs(xn-x0);
    x0 = xn;
    nIter = nIter+1;
end

fprintf('La raiz es: %.9f [m3/kg] \n', rSol(nIter));
figure()
plot(1:nIter-1, errorV(1:nIter-1), 'b*--')
xlabel('num iteracion')
ylabel('|x_{n+1}t=x_n|')

% valVol=linspace(-1,1,5e3);
% g=(R*T)./(valVol-b)-a./(valVol.*(valVol+b).*sqrt(T));
% 
% figure()
% plot(valVol, g, 'r-')
% xlabel('vol especifico [m^3/kg]')
% ylabel('presion [kPa]')