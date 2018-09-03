function h = plotGaussiana(miu, sigma)
    a = 1./(sigma.*(sqrt(2*pi)));
    x_min = miu - sigma.*2;
    x_max = miu + sigma.*2;
    f = @(x)(a.*...
        exp(-(((x-miu).^2)/((sigma.^2).*2))));
    for k = 1:size(miu)
      puntos = linspace(x_min(k),x_max(k),1000);
      hold on
      h = plot(puntos,f(puntos));
      hold off
    end
end

