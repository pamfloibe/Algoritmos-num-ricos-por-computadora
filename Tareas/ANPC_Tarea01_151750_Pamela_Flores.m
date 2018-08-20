%%Se tienen una matrices A, B, C de (M,N) donde M es el número de filas y N es el
%%número de columnas. También tenemos K, el cual es el número de datos (muestreo) que
%%se van a obtener por columna.

M = 100;
N = 50;
K = 100;

A=zeros(M,N);
B=zeros(M,N);
C=zeros(M,N);

%%Primero tengo que poner puntos aleatorios en el cuadro e insertarlos en
%%las matrices
min = -2;
max = 2;
radio1 = 1;
radio2 = 1;
xc1 = .5;
yc1 = 0;
xc2 = -.5;
yc2 = 0;

%%Cuadrado que va a definir el área de intersección
areaCuadrado = (max - min)*(max-min);

%mediaTeorica = pi*(radio.*radio); 

%%Obtener los puntos en la intersección
for n=1:N
    k = K*n;
    for m=1:M
        %%Poner los puntos aleatorios que van a estar en el cuadro y los
        %%círculos
        x = (rand(k,1).*(max-min))+ min;
        y = (rand(k,1).*(max-min))+ min;
        
        %%Ver si los puntos en el cuadro están dentro del círculo,
        %%sumarlos y dividir el resultado entre la cantidad de puntos que
        %%se usaron y agregarlos a la matriz. 
        
        %% A(m,n) = areaCuadrado.*(sum((x-xc).*(x-xc) + (y-yc).*(y-yc) <= (radio.*radio))/k); 
        %% Obtener las matrices de 1s y 0s y la intersección
        A = (x-xc1).*(x-xc1) + (y-yc1).*(y-yc1) <= (radio1*radio1); 
        B = (x-xc2).*(x-xc2) + (y-yc2).*(y-yc2) <= (radio2*radio2); 
        
        C(m,n) = areaCuadrado.*(sum(A.*B)/k);
        
    end
end

hold on
plot(C', '.');
hold off




