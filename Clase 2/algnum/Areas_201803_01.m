M = 100;
N = 50;
K = 40;
mediaTeorica = pi/4;
sdTeorica = (pi/4)*(1-pi/4);
A = zeros(M,N);
for n = 1:N    %% cantidad de columnas
    k = K * n; %% datos de cada muestreo por ensayo en la columna
    for m = 1:M %%ver cuántas veces va a caer dentro de pi/4
        x = rand(k, 1);
        y = rand(k, 1);
        A(m,n) = sum(x.*x + y.*y <=1)/k; 
    end
end