clear; close all; fclose all; clc;

x=linspace(-1,+1,1000);
y=cot(x);
z=tan(x);

% Create figure
figure1 = figure('WindowState','maximized');

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(x,y,'r',x,z,'b');

% plot(x,y,'LineStyle','-','Linewidth',4,'Color',[1 1 0],'Marker','d',...
%     'MarkerEdgeColor','r','MarkerFaceColor',[0 0 0],'MarkerSize',8);

% Create ylabel
ylabel({'Range'});

% Create xlabel
xlabel({'Time Series'});

% Create title
title({'Graphs of cot(x) & tan(x)'});

box(axes1,'on');
hold(axes1,'off');
% Create legend
legend(axes1,'show');