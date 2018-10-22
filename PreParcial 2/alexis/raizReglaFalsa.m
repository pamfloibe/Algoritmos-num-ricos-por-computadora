function [ r,nIter ] = raizReglaFalsa( f, xMin, xMax, tol )
%raizBiseccion es una funcion que regresa una la raiz r de la funcion f
%dentro del intervalo [xMin,xMax] con una tolerancia tol
%   f es la funcion a la cual se quiere encontrar su raiz
%   xMin es la cota minima del intervalo
%   xMax es la cota maxima del intervalo
%   tol es la tolerancia o error permitido
nIter=0;
errorR=1e6;
while errorR>tol
    %puntoMedio=xMin+(xMax-xMin)/2;
    c = xMax - f(xMax)*((xMax-xMin)/(f(xMax)-f(xMin)));
    fc=f(c);
    if sign(f(xMin))==sign(fc)
        xMin=c;
    else
        xMax=c;
    end
    errorR=abs(xMax-xMin);
    r=c;
    nIter=nIter+1;
end

end

