syms h 
altura = sym(h^3 - 3*h^2 +3.2);
da = diff(altura);


x0= 0.1;
errorA = 1e6;
iterMax = 100;
tol = 1e-6;
nIter = 0;
while errorA>tol && nIter<iterMax
    razon = double(subs(altura,x0)/subs(da,x0));
    xn = x0 - razon;
    errorA = abs(xn-x0);
    x0=xn;
    nIrwe = nIter+1;
end