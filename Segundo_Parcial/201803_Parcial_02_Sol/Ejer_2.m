%
% Se va a suministrar una medicina a un paciente de 60 Kg.
% La cantidad de sangre es la treceava parte del peso de la persona.
% La concentraci�n en mg/ml corresponde la la siguiente expresi�n:
%
% C(t) = A * t^alpha * exp(t/B).... en mg/ml
%        A en mg/ml
%       
%       sea alpha = 1.25 y B = 5
%
% a) determine la cantidad A ( en mg/ml y en gramos) que debe
% suministr�rsele a la persona para que la concentraci�n m�xima sea de 1.25
% mg/ml
% b) no se debe dejar que la concentraci�n baje de 0.15 mg/ml. Determine a
% que hora debe suministrarse una segunda inyecci�n.
% c) Determine de cuanto debe ser la segunda inyecci�n en mg/ml y en gramos
% para que en el momento de mayor concentraci�n no exceda del valor
% anteriormente se�alado.
%


%%GRAFICAR 

  A = 1; B = 5; alpha = 1.25;
  c_max = 1.25; % en mg / ml
%
  C = @(t) ( A * t.^alpha .* exp( - t ./ B ));
  t = 0:0.05:50;
  hold off
  plot(t, C(t))
  hold on
  pause(1)
  
%% a)
%%Para obtener A, lo primero que debemos hacer es obtener el tiempo cuando
%%la concentraci�n alcanza un m�ximo. t_cmax

%%Para obtener el t_cmax tenemos que derivar e igualar a 0. Cuando hacemos
%%esto obtenemos en este caso que t_cmax = (1.25)(5) = alpha * B

alpha = 1.25;
B = 5; 

t_cmax = alpha * B;

%%Ahora para obtener A si la concentraci�n m�xima es 1.25 entonces debemos
%%despejar A

c_max = 1.25;

A = (c_max * exp(t_cmax/B))/(t_cmax ^ alpha);

%%Se tiene que aplicar la segunda inyecci�n cuando c_min = 0.15

c_min = 0.15;

f = @(t) (A * (t^alpha) * exp(-t/B) - c_min);

%%Obtener la ra�z de la funci�n por medio de newton

t2 = raizPorNewton(f, 20, 0.000001, 1000);   
