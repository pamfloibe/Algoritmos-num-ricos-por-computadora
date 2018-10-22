function raiz = raizPorNewton(hf,x,eps,maxVeces)
%
%  raiz = raizPorNewton(hf,x,eps,maxVeces)
%
% hf       ... handler de la funci�n de la que se desea la ra�z
% x        ... valor inicial para las iteraciones
% eps      ... las iteraciones se detienen cuando abs( x(n) - x(n-1)) < eps o
% maxVeces ... el n�mero de iteracines supera maxVeces
%
% C�lculo de la ra�z de una funcion f:R->R
% Se deben cumplir las condiciones de Fourier para 
% garantizar la convergencia del m�todo.
% Por CU: 8472, Rafael G. Gamboa Hirales
% 4 de agosto de 2016
% Para ANC 201603
%
  sf  = sym(hf);
  sfp = diff(sf);
  hfp = matlabFunction(sfp);
  intervalo = 2.0 * eps;
  k = 1;
  while intervalo > eps & k < maxVeces
    x1 = x - hf(x)/hfp(x);
    intervalo = abs( x1 - x );
    x = x1;
    k = k + 1;
    sprintf('k:%d ... %f \n',k,x)
  end
  raiz = x;
end
