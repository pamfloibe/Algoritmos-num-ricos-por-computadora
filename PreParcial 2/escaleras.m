function w = escaleras(a,b,h, x0)
%a y b son las escaleras
%h es la altura del triángulo que se forma en el cruce de las escaleras
%x0 es la aproximación que yo doy (tiene que ser menor que el lado más pequeño)
    f = @(w)w.*((h.*( (1./(sqrt(b.^2-w.^2))) + (1./(sqrt(a.^2-w.^2))) ) )-1);
    w = GNR(f, x0, 1e-10);
    x = [-max(a,b):.1:max(a,b)]; 
    plot(x,f(x));
end