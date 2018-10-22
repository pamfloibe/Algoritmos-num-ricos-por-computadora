function w = escaleras(a,b,h, x0)
    f = @(w)w.*((h.*( (1./(sqrt(b.^2-w.^2))) + (1./(sqrt(a.^2-w.^2))) ) )-1);
    w = GNR(f, x0, 1e-10);
    x = [-max(a,b):.1:max(a,b)]; 
    plot(x,f(x));
end