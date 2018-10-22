%ISR
syms x;
cFij=[0.00 11.11 238.33 692.96 917.26 1271.87 3880.44 7162.74 17575.69 25350.35 91,435.02];
porc=[0.0192 0.0640 0.1088 0.1600 0.1792 0.2136 0.2352 0.3000 0.3200 0.3400 0.3500];
liminf=[1.00 578.53 4910.19 8629.21 10031.08 12009.95 24222.32 38177.70 72887.51 97183.34 291550.01];
%Leer el archivo csv o txt o xls que nos de gamboa Supongamos un vector
%netos=[100000*rand(1,100)];
netos=15000;
xs=zeros(1,length(netos));
for i=1:length(netos)
    index=(min(find(liminf>netos(i))));
    limInferior=liminf(index);
    cuoFij=cFij(index);
    porx=porc(index);
    f=@(x) (x-(cuoFij+porx*(x-limInferior))-netos(i));
    xs(i)=raizBiseccion(f,1,10000000,1e-5);
end
