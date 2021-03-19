r = 4;
xc = 3;
yc = 5;

theta = linspace(0,2*pi);
x = r*cos(theta) + xc;
y = r*sin(theta) + yc;
plot(x,y,'-c')
title('Circle')
axis equal

a=2; b='good';
    filename3 = sprintf('..\\Results\\MyFirstPlot_%d%s',a,b);
    print(gcf,'-dpng', filename3);
%     print('-depsc', filename3);
%     saveas(gcf,(strcat(filename3,'.fig')));
    close (figure1);