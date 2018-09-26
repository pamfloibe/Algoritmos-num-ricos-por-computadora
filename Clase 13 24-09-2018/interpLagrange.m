function yLag = interpLagrange(xi,yi,xVal)

n = length(xi);
if length(yi)~=n
   error('Los vectores x e y no tienen la misma longitud');
end

suma = 0;
for i=1:n
    producto = yi(i);
    for j=1:n
        if j~=1
            producto = producto*((xVal-xi(j))/(xi(i)-xi(j)));
        end
    end
    suma = suma + producto;
end

yLag = suma;
end