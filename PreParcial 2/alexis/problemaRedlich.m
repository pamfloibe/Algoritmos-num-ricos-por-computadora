a = 12.5577822;
b = 0.0018626;
P = 65000;
R=0.518;
T = -40 + 273.15;
syms v
f = sym (-P+(R*T)/(v-b)-a/(v*(v+b)*sqrt(T)));
df = diff(f);
iMax = 100;
tol = 1e-7;

x0=2e-3;

rSol = zeros(iMax,1);
rSol(1) = x0;
nIter =0;
errAbs =1000;
vectErrores = zeros(iMax,1);
while  nIter<iMax && errAbs>tol
    razon = double(subs(f,x0))/double(subs(df,x0)); %%f x0/ f'x0
    xn = x0-razon;
    rSol(nIter+1)=xn;
    errAbs = abs (xn-x0);
    vectErrores(nIter+1) = abs(xn-x0);
    x0=xn;
    nIter = nIter+1;
end
fprintf('La raíz es: %.9f [m3/kg]\n',rSol(nIter));
 figure()
 plot(1:nIter-1,vectErrores(1:nIter-1), 'b*--')
 xlabel('num  iteración')
 %ylabel()
% 
% valVol = linspace(-1 ,1 ,5e3);
% g=(R*T)./(valVol-b)-a./(valVol.*(valVol+b).*sqrt(T));
% 
% figure()
% plot(valVol, g ,'-r');
% xlabel('vol Específico')
% ylabel('presión kPa')