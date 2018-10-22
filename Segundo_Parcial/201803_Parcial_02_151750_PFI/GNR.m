function raiz = GNR(f,x,eps)
% f es la funcion a utilizar
% x es el primer valor a utilizar
% eps es la tolerancia a esperar
    fs = sym(f);             
    fsp = diff(fs);
    fp = matlabFunction(fsp);
    xv = 2*x;
    while (abs(x-xv) > eps)
        xv = x;
        x = x - f(x) / fp(x);
    end
    raiz = x; %%Ponerle el nombre de la variable que está regresando
end
