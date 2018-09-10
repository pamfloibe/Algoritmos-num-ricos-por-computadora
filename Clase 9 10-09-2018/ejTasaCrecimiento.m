l = linspace(-2,2,300); %definimos lambda

valEv = exp(l) + (0.435./l).*(exp(l)-1);
figure();
plot(l, valEv, 'r-')
hold on
line([-2 2], [1.564 1.564], 'Color', 'k')
