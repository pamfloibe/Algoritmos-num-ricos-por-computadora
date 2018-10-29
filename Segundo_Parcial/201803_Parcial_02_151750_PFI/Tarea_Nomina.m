% Ejercicio Nomina
%
%
TarifaISR2018 = readtable('TarifaISR2018.csv');
sueldos = readtable('sueldos.csv');
%
% Ejemplo de cálculo del nuevo sueldo para un aumento neto del 3% para un
% sueldo de 80,000
%
%sdo = 80000;

% Hacer un arreglo de sueldos
% arrSdo = csvread('sueldos.csv',1,1);
% arrNvoSdo = arrSdo;

% for i=1 :length(arrSdo)
%     neto_sdo = neto_isr(arrSdo(i),TarifaISR2018);
%     nuevo_neto = neto_sdo * 1.045;
%     g = @(x)(neto_isr(x,TarifaISR2018)-nuevo_neto);
%     nuevo_sdo = secante(g,1000,1e6,1);
%     arrNvoSdo(i)=nuevo_sdo;
% end

% sumaNom = sum(arrSdo);
% totalNuevaNomina = sumaNom * 1.05; %Total de la nómina con un aumento del 5%
%%% Emiliano
% ------------------------
% Nsb = arrSdo * 1.05;
% consigueNeto = @(s)neto_isr(s,TarifaISR2018);
% NetosViejos = arrayfun(consigueNeto, arrSdo);
% syms x;
% N = 0;
% for i= 1: length(arrSdo)
%     N = N + ((arrSdo(i)*x - isr(arrSdo(i)*x,TarifaISR2018)) / NetosViejos(i));
% end
% 
% NN = sumaNom * 1.05;
% j = matlabFunction(N - NN);
% y = secante(j, 1, 10, 1);
% 
% l = @(x,y)(x-isr(x,TarifaISR2018))/y;

%----------------- --------


%--------------------------
% PAMELA
%--------------------------

% arrNuevosNetos = arrSdo;
%
%Aumentó en un 5%
% for i=1 : length(arrSdo)
%     brutoAnt = arrSdo(i);
%     nuevoBruto = brutoAnt * 1.05; %El porcentaje de los brutos se mantiene igual
%     cat = find(TarifaISR2018.LimInf <= nuevoBruto , 1, 'last' );
%     ISR = TarifaISR2018.CuotaFija(cat) + ...
%           0.01*TarifaISR2018.porcExcedente(cat)*(nuevoBruto-TarifaISR2018.LimInf(cat));
%     nuevoNeto = nuevoBruto - ISR;
%     arrNuevosNetos(i) = nuevoNeto;
%     
%     %%Obtener el neto anterior
%      neto_sdo = neto_isr(arrSdo(i),TarifaISR2018);
%      
%      %Obtener el porcentaje (tiene que ser igual TT_TT)
%      porcentaje = (nuevoNeto * 100 / neto_sdo)-100;
%      
%      %I TRIEDEDED :(
% end

% Hacer un arreglo de sueldos
arrSueldos = csvread('sueldos.csv',1,1);
arrNuevosSueldos = arrSueldos;

totalNomina = sum(arrSueldos);
totalNuevaNomina = totalNomina * 1.1; %Total de la nómina con un aumento del 10%

diferenciaNominas = totalNuevaNomina - totalNomina;
%Cómo distribuir esta diferencia equitativamente (%) a los empleados?



% sumaNvaNom=sum(arrNvoSdo);
% 
% porcAumento=(sumaNvaNom*100/sumaNom)-100;