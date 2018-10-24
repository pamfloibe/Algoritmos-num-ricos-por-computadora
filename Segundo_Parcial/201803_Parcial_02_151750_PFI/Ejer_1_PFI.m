function d = Ejer_1_PFI(p1,r1,p2,r2)
%%Calcular los puntos de intersección de un círculo y obtener la distancia
%%entre los puntos
%%P1(1,1); r = 2
%%P2(2,3); r = 3
    x1 = p1(1);
    y1 = p1(2);
    
    x2 = p2(1);
    y2 = p2(2);
    
    xd = x1-x2;
    yd = y1-y2;
    
    d = sqrt((xd.*xd)+(yd.*yd));
    [xout,yout] = circcirc(x1,y1,r1,x2,y2,r2);

%Ecuacion del circulo: (x-x0)^2 + (y-y0)^2 = r^2
    %f = @(p)(-1.*(((x-x1).^2)+((y-y1).^2)-(r1.*r1)))-(((x-x2).^2)+((y-y2).^2)-(r2.*r2));
    %f = @()(((x.*x)-(2*(x*x1))+(x1.*x1))+((y.*y)-(2*(y*y1))+(y1.*y1)))-(((x.*x)-(2*(x*x2))+(x2.*x2))+((y.*y)-(2*(y*y2))+(y2.*y2)));
    
    %p = raizBiseccion( f, -1, 7, 1e-10);
    %p = raizPorNewton(f,1,10,100)
    %p = GNR(f,.1,1e-10);
    
    [xout, yout]
end