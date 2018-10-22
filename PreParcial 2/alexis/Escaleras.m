%Las escalubrias
%Ec carac:
%x-c(1./tan(tetha)+1./tan(phi))
%tan(tetha)=sqrt(b^2-x.^2)./x
%tan(phi)=sqrt(a^2-x.^2)./x
%Como es un problema f�sico el ancho del
%pasillo donde se cruzan las escaleras es menor al largo de la escalera m�s
%chica, adem�s de ser positiva. Por lo tanto s�lo es necesario hacer una
%inspecci�n en el intervalo +-max(a,b). Con una inspecci�n gr�fica podemos
%ver qu� valores tienen sentido f�sico. Ya que la ra�z no puede ser mayor a
%min(a,b)
close all;
clear all;
b=30;
a=20;
c=10;
x=[-b:.1:b];
fx=@(x)real(x-(c*(x./sqrt(b^2-x.^2)+x./sqrt(a^2-x.^2))));
plot(x,fx(x))
hold on
grid on
min=input('Valor minimo: ');
max=input('Valor m�ximo: ');
largo=raizBiseccion(fx,min,max,1e-10);

