classdef Poligono < handle
% los v�rtices del pol�gono convexo plano deben estar dados en CCW
% V = matriz de 2 x N (siendo N el n�mero de v�rtices del pol�gono)
%    (el �ltimo v�rice cierra con el primero)  .
   properties
     N  % cantidad de lados del pol�gno convexo 
     V  % V�rtices
     W  % Normales a los lados 
   end
   methods 
       function obj = Poligono(V)
           if nargin == 0
             obj.V = [[0.0;0.0],[1.0;0.0],[0.0;1.0]];
           else
             obj.V = V;
           end
            obj.N = size(V,2); 
            obj.W = zeros(3,obj.N); % N�tese el 3
            for k = 1:obj.N
              if k == obj.N
                  kf = 1;
              else
                  kf = k + 1;
              end
              DV = obj.V(:,kf) - obj.V(:,k);
              obj.W(1:2,k) = [-DV(2);DV(1)];
              obj.W(3,k)   = - obj.V(:,k)' * obj.W(1:2,k);
            end
       end
       function bln = contiene(obj,p)
         if nargin == 0
           pv = [0.0;0.0];  
         else
           pv = p;  
         end
         bln = sum([pv(1),pv(2),1]*obj.W >= 0) == obj.N;
       end
       function xtam = valoresExtremos(obj)
          xtam = [[min(obj.V(1,:)); min(obj.V(2,:))],[max(obj.V(1,:)); max(obj.V(2,:))]];
       end
   end
end