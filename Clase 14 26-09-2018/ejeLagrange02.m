f=@(x) 1./(1 + 25*x.^2);
xc=linspace(-1,1);
yc=f(xc);

xd =linspace(-1,1, 11);
yd=f(xd);

yL=interpLagrange02(xd, yd, xc); %%Me falta el código de interpLagrange02

nodT = raicesCheb(11);
yNod = f(nodT);
%%Interpolar con los mismos polinomios de Lagrange, pero ahora de Chev
yL02=interpLagrange02(nodT,yNod,xc);

figure()
plot(xc, yc, 'b-')
hold on
plot(xd, yd, 'bd')
plot (xc, yL, 'r--')
plot(nodT, yNod, 'ms')
plot (xc, yL02, 'm--')
legend('Original','Puntos','Lagrange','Puntos TChev', 'Lagrange02')