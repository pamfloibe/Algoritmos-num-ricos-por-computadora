g1=@(h)h^3 - 3*h^2 +3.2;
g2=@(h)sqrt((h^3 +3.2)/3);
g3=@(h) exp(0.5*h) +1.2*h-5; %(en el intervalo 1,2)
%altura = sym(sqrt((h^3 +3.2)/3));


x0= 1.01; %podemos incrementarla para aproximar mejor la raíz, p.e. x0=0.6 nos dará 1.47, el valor buscado

errorA = 1e6;
iterMax = 100;
tol = 1e-6;
nIter = 0;
while errorA>tol && nIter<iterMax
    xn = g3(x0);
    errorA = abs(xn-x0);
    x0=xn;
    nIrwe = nIter+1;
end