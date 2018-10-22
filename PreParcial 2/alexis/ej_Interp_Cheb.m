close all;
nPoints=7;
fx=@(x) 1./(25*x.^2+1);
x=linspace(-1,1,nPoints);
y=fx(x);

T=matCoefCheb(nPoints-1);
A=evalCheb(T,x);
A=A';
c=inv(A)*y';

xqc=linspace(-1,1,200)';
fx=fx(xqc);

yCheb=zeros(length(xqc),nPoints);

for k=1:length(xqc)
    t_en_x=evalCheb(T,xqc(k));
    for j=1:nPoints
        yCheb(k,j)=t_en_x(1:j)'*c(1:j);
    end
end 

%comparamos con Lagrange
% yLag=zeros(length(xqc),1);
% for k=1:length(xqc);
%     yLag(k)=interp_Lagrange(x,y,xqc(k));
% end

figure()
s=cell(1,nPoints+1);
for i=1:nPoints
    s{i}=sprintf('Aproximación %1d',i); 
    plot(xqc,yCheb(:,i),'--'); 
    hold on;
end
s{nPoints+1}=sprintf('Función a aproximar');
plot(xqc,fx,'r')
hold on
plot(x,y,'ro','MarkerSize',12);
legend(s);
figure()
plot(xqc,abs(fx-yCheb(:,nPoints)),'ro')
hold on
legend('Err_Cheb')
xlabel('x')
ylabel('1/(1+25x^2)')