classdef Circulo < Figura2D
   properties %%Las propiedades del objeto
     radio  
   end
   methods %%Métodos del objeto
       function obj = Circulo(x,r) %%Constructor
           if nargin == 0 %%Cuántos argumentos trae
             fig2d_args{1} = [0.0;0.0]; %%SI no tiene argumentos, el centro es el origen
             c = 1.0;
           else
             fig2d_args{1} = x;
             c = r;
           end  
           obj@Figura2D(fig2d_args{:});
           obj.radio  = c;
       end
       function bln = contiene(obj,p)
         if nargin == 0
           pv = [0.0;0.0];  
         else
           pv = p;  
         end    
         d = pv - obj.centro;
         bln = (d' * d) <= obj.radio^2;
       end
       function xtam = valoresExtremos(obj) %%Para preguntar el tamaño
          xtam = [[obj.centro(1)-obj.radio;obj.centro(2)-obj.radio], ...
                  [obj.centro(1)+obj.radio;obj.centro(2)+obj.radio]];
       end
       
       function area = getArea(obj)
            area = pi*((obj.radio)^2);
       end
   end
end