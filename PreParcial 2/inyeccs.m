syms t a;

cmax = 0.05;
cmin = 0.005;
tiempo = [0:1:500];
nIny   = 10;
tmin   = cell(1,nIny); 
tmax   = cell(1,nIny);
A      = zeros(1,nIny);
F = cell(length(nIny));
f = @(t, a)a.*t.*exp((-t)/5);
F{1} = f;
df = diff(sym(f));
tmax{1,1} = solve(df == 0, t);
A(1,1) = solve(sym(f(tmax{1,1},a)) == cmax, a);
ftmin = @(t)A(1)*t.*exp((-t)/5)-cmin;
tmin{1,1} = GNR(ftmin, 15, 1e-10);
fs = cell(nIny, length(tiempo));
hold on;
plot(tiempo, F{1}(tiempo, A(1,1)));


% for i= 1:length(tiempo)
%     fs{1,i} = str2func(sprintf('%s%d','@()',F{1}(tiempo(i), A(1,1))));
% end
%fss = @(t, i)fs(i, t);

ct = @(t,a)a.*t.*exp((-t)/5);

for i=2:2
%     z = cell(1, length(tiempo));
%     z = fs(i-1, :);

    %F{i} = @(t, a)(a.*(t - tmin{1,i-1}).*exp((-(t - tmin{1,i-1}))/5)) + F{i-1}(t, A(1,1));
    F{i} = @(t,a)ct((t-tmin{1,i-1}),a) + F{i-1}(t, A(1,i-1)); %%Obtiene la función de la siguiente inyección
    %%La forma de solucionarlo es encontrar como sustituir + F{i-1}(t, A(1,i-1));
    %%por z{1, t} para sustituir el valor de la funcion anterior como
    %%constante enlugar de una funcion de (t,a);
    
    %F{i} = @(t,a)ct((t-tmin{1,i-1}),a) + fs{i-1, t}();
    %F{i} = @(t,a)ct((t-tmin{1,i-1}),a);
    
    df = diff(sym(F{i}));
    tmax{1,i} = solve(df == 0, t);
    A(1,i) = solve(sym(F{i}(tmax{1,i},a)) == cmax, a);
    tmax{1,i} = matlabFunction(tmax{1,i});
    tmax{1,i} = tmax{1,i}(A(1, i)) + tmin{1,i-1};
    ftmin = @(t)F{i}(t,A(1,i))-cmin; %%Ver en qué punto se llega a cmin
    tmin{1,i} = GNR(ftmin, tmin{1,i-1}*1.4 , 1e-10) + tmin{1,i-1};
    hold on;
    plot(tiempo+tmin{1,i}, F{i}(tiempo, A(1,i)));
end



