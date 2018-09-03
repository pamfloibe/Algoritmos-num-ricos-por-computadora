classdef Gaussiana < handle
   properties
     miu
     sigma
     a
     c
     y_max
     x_min
     x_max
   end
   methods 
       function obj = Gaussiana(m,s)
           if nargin == 0
            obj.miu = 0.0;
            obj.sigma = 1.0;
           else
             obj.miu = m;
             obj.sigma = s;
           end
           obj.a = 1/(obj.sigma.*(sqrt(2*pi)));
           %Se obtiene el 95.4% de una gaussiana
           %https://ugc.kn3.net/i/origin/http://farm8.staticflickr.com/7204/6850657337_537974e94f.jpg
           y_max = obj.a;
           x_min = obj.miu - obj.sigma.*2;
           x_max = obj.miu + obj.sigma.*2;
       end
       function bln = contiene(obj,p)
         if nargin == 0
           pv = [0.0;0.0];  
         else
           pv = p;  
         end
         %https://es.wikipedia.org/wiki/Función_gaussiana
         bln = pv(2) <= (obj.a.*exp(-((pv(1)-obj.miu).^2/((obj.sigma.^2).*2))));
       end
       function xtam = valoresExtremos(obj)
          xtam = [[obj.x_min;0],...
                 [obj.x_max;obj.y_max]];
       end
       
       function area = getArea(obj)
          area = int(sym(@(x)(obj.a.*...
             exp(-((x-obj.miu).^2/((obj.sigma.^2).*2))))),obj.x_min,obj.x_max);
       end
   end
end