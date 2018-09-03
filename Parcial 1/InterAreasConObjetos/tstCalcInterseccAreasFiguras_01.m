%tstCalcInterseccAreasFiguras_01
%
N = 10000;
figs = {};
figs(1) = {Circulo([-2.0;3.0],1.0)}; %% Circulo[(centro), radio]
figs(2) = {Circulo([-1.0;3.0],1.0)};
figs(3) = {ElipseCanonica([1.0;0.0],2.0,1.0)};
figs(4) = {RectanguloCanonico([2.0;1.0],2.0,3.0)};
figs(5) = {RomboCanonico([-1.0;-1.0],2.0,3.0)};
veces = 500;
area3 = zeros(veces,1);
tic
parfor vez = 1:veces
    [a,tamRectGral] = calcInterseccAreasFiguras_01(figs,N); %%Cálculo de intersección de áreas de las figuras
    area3(vez) = a(3); %%Para cada vez, va guardando
    if mod(vez,10) == 0 %%Cada diez veces te va diciendo "Llevo 10 veces :v"
      fprintf('vez: %4d, area(3): %12.6f\n', vez,area3(vez))  
    end
end    
toc
prom_area3s    = mean(area3); %%Promedio
desvStd_area3s = std(area3);
fprintf('promedio(area3): %12.6f,    desvStd(area3s): %12.6f\n', ...
         prom_area3s, desvStd_area3s)
%
% ================= Fin de tst ====================
%
