function d = Ejer_1_PFI(x1,y1,r1,x2,y2,r2,apr)
    
    f = @(w)((x1)^2+(y1)^2 - r1.r1)+((x2)^2+(y2)^2 - r2.r2);
    ptos = GNR(f,apr,1e-10);
    %w = GNR(f, apr, 1e-10);
    %Ecuaciones de los circulos
%     c1 = (x1)^2 + (y1)^2 - r1.r1;
%     c2 = (x2)^2 + (y2)^2 - r2.r2;
    
    
end