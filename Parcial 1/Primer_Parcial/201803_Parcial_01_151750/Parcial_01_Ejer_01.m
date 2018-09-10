% tstFiguraCompuesta
figs    = {};
figs{1} = Circulo([0;0],2);
tam_trian = 5;
figs{2} = Triangulo(tam_trian * [0;1], ...
                    tam_trian * [-0.5*sqrt(3);-0.5], ...
                    tam_trian * [0.5*sqrt(3);-0.5]);
figs{3} = Circulo( tam_trian * [0;1],1);
figs{4} = Circulo( tam_trian * [-0.5*sqrt(3);-0.5],1);
figs{5} = Circulo( tam_trian * [ 0.5*sqrt(3);-0.5],1);
figs{6} = RectanguloCanonico ([0;0], 4, 2);
clf
hold on
figs{1}.dibuja();
figs{2}.dibuja();
figs{3}.dibuja();
figs{4}.dibuja();
figs{5}.dibuja();
figs{6}.dibuja();
pause(1)
%return
inter_cta = zeros(1,64);
inter_cta(34) = 1;
% inter_cta(4) = 1;
% inter_cta(8) = 1;
% inter_cta(16) = 1;
fc = FiguraCompuesta(figs,inter_cta);
vxtrms = fc.valoresExtremos();
dx = vxtrms(1,2) - vxtrms(1,1);
dy = vxtrms(2,2) - vxtrms(2,1);
dxdy = dx * dy;
M = 50;
N = 40;
K = 100;
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

mA = mean(A);
sA = std(A);
clf
hold on
plot(A','.')

plot((1:N),mA,'o')
plot((1:N),mA + sA,'+')
plot((1:N),mA - sA,'+')

D=zeros(1,N);
for n=1:N
    D(n)=sum((mA(n) - sA(n)<=A(:,n)).*(A(:,n)<=mA(n)+sA(n)));
end
porcEnsayos = D/M;

error = sA;
vo = mA;

%buscar el indice del numero en jotas donde sea menor al error
% en este caso queremos algo < 0.05, este indice sera = j
jotas = sA./mA;

j=25; %Tom� j=25 porque era el primero en donde era < a 0.05

% tomas alpha como 100 - confianza
alpha = 100-90;

cant_ptos = j*K;

int_min =  mA(j) - ((sA(j).*icdf('Normal',1-(alpha/200),0,1))/(j*K)) 
int_max =  mA(j) + ((sA(j).*icdf('Normal',1-(alpha/200),0,1))/(j*K))

%el intervalo de confianza sera
%[int_min; int_max]
