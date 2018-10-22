function raiz = raizNewton(f,x,eps)
    fs = sym(f); %f simbólica
    fsp = diff(fs);
    fp = matlabFunction (fsp);
    xv = 2*x; %x vieja
    while(abs(x-xv) > eps)
         xv = x;
         x = x - f(x)/fp(x);
    
    end
    raiz = x;
end