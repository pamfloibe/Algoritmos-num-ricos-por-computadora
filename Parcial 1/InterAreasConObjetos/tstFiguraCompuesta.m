% tstFiguraCompuesta
figs    = {};
% figs{1} = RectanguloCanonico([0;0],3,3);
% figs{2} = Circulo([0;0],2); 
% figs{3} = Triangulo([0;1],[-0.5*sqrt(3);-0.5],[0.5*sqrt(3);-0.5]);

%% EJERCICIO 1
%figs{1} = Triangulo([-(2.5*sqrt(3))/2;-2.5],[(2.5*sqrt(3))/2; -2.5], [0;5]);
%figs{2} = Circulo([0;0], 1.5);

%inter_cta = [1,0,0,0];%[1,0,0,0,0,0,0,0];

%%EJERCICIO 2
% figs{1} = Triangulo([-(2.5*sqrt(3))/2;-2.5],[(2.5*sqrt(3))/2; -2.5], [0;5]);
% figs{2} = Circulo([-(2.5*sqrt(3))/2;-2.5], 0.5);
% figs{3} = Circulo([(2.5*sqrt(3))/2; -2.5], 0.5);
% figs{4} = Circulo([0;5], 0.5);
% figs{5} = RectanguloCanonico ([0;0],0.5,0.5);

% inter_cta = zeros(1,2.^5);

% %MODIFICAR LOS BITS
% inter_cta(2)=1; 
% inter_cta(4)=1; 
% inter_cta(8)=1; 
% inter_cta(17)=1;

%%EJERCICIO 3
figs{1} = Gaussiana(2,1);
figs{2} = Gaussiana(4,1);
figs{3} = Circulo([3;0.25], 0.5);

inter_cta = zeros(1,2.^3);

%MODIFICAR LOS BITS
inter_cta(1)=1; 
inter_cta(2)=1; 
inter_cta(3)=1; 
inter_cta(4)=1;

%%Para modificar los ceros 
fc = FiguraCompuesta(figs,inter_cta);
vxtrms = fc.valoresExtremos();
dx = vxtrms(1,2) - vxtrms(1,1);
dy = vxtrms(2,2) - vxtrms(2,1);
dxdy = dx * dy;
M = 50;
N = 40;
K = 75;
A = zeros(M,N);
tic
parfor n = 1:N  % para cada columna
    k = K * n;
    for m = 1:M
      puntos = [vxtrms(1,1) + dx * rand(1,k); vxtrms(2,1) + dy * rand(1,k)];
      cuenta = 0;
      for w = 1:k
       cuenta = cuenta + fc.contiene(puntos(:,w));   
      end
      proporcion = cuenta / k;
      A(m,n) = dxdy * proporcion;
    end   
end
toc
%AreaTeorica = 36 - 4 * pi + 3 * sqrt(3) / 4;%3 * sqrt(3) / 4; % 
%%CUANDO UNA FIGURA ESTÁ (COMPLETAMENTE)DENTRO DE OTRA
%AreaTeorica = figs{1}.getArea() - figs{2}.getArea();

%%AREA TEORICA EJERCICIO 2
%AreaTeorica = (figs{2}.getArea() - (0.1987 * figs{2}.getArea())) + (figs{3}.getArea() - (0.1987 * figs{3}.getArea())) + (figs{4}.getArea() - (0.1024 * figs{4}.getArea())) + figs{5}.getArea();
% AreaTeorica = (2 * 0.62933941) + 0.70497 + 1;
AreaTeorica = 1.74;

p = AreaTeorica / dxdy;
stdAteorica=dxdy*sqrt(p*(1-p))./sqrt(K*(1:N));
mA = mean(A);
sA = std(A);
hold off
hold on
plot(A','.')
plot((1:N),ones(1,N)*AreaTeorica)
plot((1:N),mA,'o')
plot((1:N),mA + sA,'+')
plot((1:N),mA - sA,'+')
plot((1:N),AreaTeorica + stdAteorica)
plot((1:N),AreaTeorica - stdAteorica)

D=zeros(1,N);
for n=1:N
    D(n)=sum((AreaTeorica-stdAteorica(n)<=A(:,n)).*(A(:,n)<=AreaTeorica+stdAteorica(n)));
end
porcEnsayos = D/M;


error = sA;
vo = mA;

%buscar el indice del numero en jotas donde sea menor a tu error
% en este caso queremos algo < 0.5, este indice sera = j
jotas = sA./mA

% tomas alpha como 100 - confianza
% correr lo siguiente tomando el jota anterior

%int_min =  mA(j) - ((sA(j).*icdf('Normal',1-(alpha/200),0,1))/(j*K)) 
%int_max =  mA(j) + ((sA(j).*icdf('Normal',1-(alpha/200),0,1))/(j*K))

%el intervalo de confianza sera
%[int_min; int_max]