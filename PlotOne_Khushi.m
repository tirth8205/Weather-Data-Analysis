clear all;
clc;
x=linspace(1,100,100);
y1=power(x,3);
y2=power(x,-3);

figure1=figure('windowstate','maximized');
axes1=axes('Parent',figure1);
plot(x,y1,'-b')
legend(axes1,'show')
ylabel({'Y units'})
xlabel({'X units'})
title({'Exponential Graph'})
hold(axes1,'on')
plot(x,y2,'LineStyle','-.','Color',[1 0 1],'Marker','d','MarkerEdgeColor'...
    ,'r','MarkerFaceColor',[0 0 0],'MarkerSize',8,'MarkerIndices',1:5:length(y2))
