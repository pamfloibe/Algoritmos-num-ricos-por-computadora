function raiz = raizNewton(f,x,eps)
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