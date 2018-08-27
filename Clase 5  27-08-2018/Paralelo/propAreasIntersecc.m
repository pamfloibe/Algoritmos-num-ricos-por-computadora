
function prop = propAreasIntersecc
%
%% Prueba para el c�lculo de la �reas de las interseciones de c�rculos
%%
  Xc = [ 0.0;  0.0;  0.0];
  Yc = [ 0.0;  1.0; -1.0];
  Rc = [ 1.0;  1.0;  1.0];
  
  veces  = 150;
  n_ptos = 100 * 1000;
  
  prop = calcPropAreasIntersecc(Xc,Yc,Rc,n_ptos,veces);
end
  