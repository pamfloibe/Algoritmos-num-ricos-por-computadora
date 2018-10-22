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
arrSdo= csvread("sueldos.csv",1,1);
arrNvoSdo = arrSdo;

for i=1 :length(arrSdo)
    neto_sdo = neto_isr(arrSdo(i),TarifaISR2018);
    nuevo_neto = neto_sdo * 1.045;
    g = @(x)(neto_isr(x,TarifaISR2018)-nuevo_neto);
    nuevo_sdo = secante(g,1000,1e6,1);
    arrNvoSdo(i)=nuevo_sdo;
end

sumaNom=sum(arrSdo);
sumaNvaNom=sum(arrNvoSdo);

porcAumento=(sumaNvaNom*100/sumaNom)-100;
