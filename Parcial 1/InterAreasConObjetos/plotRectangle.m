function h = plotRectangle(c, h, v)
xmin = c(1) - h;
xmax = c(1) + h;
ymin = c(2) - v;
ymax = c(2) + v;
hold on
h = plot([xmin, xmax, xmax, xmin, xmin],[ymax, ymax, ymin, ymin, ymax]);
hold off
end

