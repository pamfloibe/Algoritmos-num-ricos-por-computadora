%
% Se va a suministrar una medicina a un paciente de 60 Kg.
% La cantidad de sangre es la treceava parte del peso de la persona.
% La concentraci�n en mg/ml corresponde la la siguiente expresi�n:
%
% C(t) = A * t * exp(t/5).... en mg/ml
%        A en mg/ml
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
% Soluci�n:
% a) El momento de mayor concentraci�n se obtiene por c�lculo y es t = 5
% horas.
% el valor de la concentraci�n en este momento es C(5) = A*5*exp(-5/5) y
% despejando A resulta

A1_mg_cc = 1.25/5 * exp(1);

% y en gramos

%Para pasar de mg/ml a g/ml se hace mg/ml -> (1/1000)(peso pers. en g / 13)
% = (1/1000)(60000/13) = 60/13

A1_gr = A1_mg_cc * 60 /13; % se compensan los milis de los miligramos con los ml de los litros

%
% b) Para obtener el momento de la segunda inyecci�n se elabora un handler de
% una funci�n y se utiliza el m�todo de Newton
%
hf=@(t)(A1_mg_cc * t * exp(-t/5) - 0.15);
%
% Calculando el tiempo de la segunda inyacci�n para que la concentraci�n no
% baje de 0.15 mg/ml
% t2 en horas
%
t2 = raizPorNewton(hf,6,0.001,1000);

%
% c) Suponga que el efecto de las inyecciones es aditivo y proceda por
% "c�lculo", solamente que en este caso el momento del m�ximo ya no es
% posible despejarlo y lo debe estimar num�ricamente y depende del valor de
% la A2 inyectada. Por ello debe definir una estrategia para estimar el
% valor del momento y en �ltima instancia el valor de la segunda dosis.
%

