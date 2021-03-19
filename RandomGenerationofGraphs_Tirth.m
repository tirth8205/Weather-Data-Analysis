clear;
close all;
fclose all;
clc;
year=input('Enter the year: ');
if(mod(year,4)==0)
    month=[31,29,31,30,31,30,31,31,30,31,30,31];
else
    month=[31,28,31,30,31,30,31,31,30,31,30,31];
end
for i=1:1 %%% loop for month from 1 to 12
    for j=28:month(i)
        Y=(sin(rand(5)));
        X=(cos(rand(5)));
        istr=num2str(i,"%02d");
        jstr=num2str(j,"%02d");
           % Create figure
            figure1 = figure('WindowState','maximized');
        
        % Create axes
        axes1 = axes('Parent',figure1);
        hold(axes1,'on');
        
        plot(Y,'Marker','d','MarkerFaceColor','red')
        legend('S1','S2','S3','S4','S5')
        plot(X,'Marker','d','MarkerFaceColor','blue')
        legend('S1','S2','S3','S4','S5','C1','C2','C3','C4','C5')
        % Create ylabel
        ylabel('Y units','FontWeight','bold','FontName','Times');

        % Create xlabel
        xlabel('X units','FontWeight','bold','FontName','Times');
        
        titleText=sprintf("%s%s%d",jstr,istr,year);
        title(titleText)
        set(axes1,'FontSize',15);
        filename3 = sprintf('..\\Results\\Plot_%s',titleText);
        print(gcf,'-dpng', filename3);
        saveas(gcf,(strcat(filename3,'.fig')));
  
%         % Create axes
%             axes1 = axes('Parent',figure1);
%             hold(axes1,'on');
% 
%             % Create multiple lines using matrix input to plot
%             plot1 = plot(X,Y,'MarkerFaceColor',[1 0 0],'Marker','diamond',...
%             'Parent',axes1);
%             set(plot1(1),'DisplayName','S1');
%             set(plot1(2),'DisplayName','S2');
%             set(plot1(3),'DisplayName','S3');
%             set(plot1(4),'DisplayName','S4');
%             set(plot1(5),'DisplayName','S5');
%             set(plot1(6),'DisplayName','C1');
%             set(plot1(7),'DisplayName','C2');
%             set(plot1(8),'DisplayName','C3');
%             set(plot1(9),'DisplayName','C4');
%             set(plot1(10),'DisplayName','C5');
%            
%             
% 
%             xlim(axes1,[0.5 5.5]);
%             box(axes1,'on');
%             hold(axes1,'off');
%             set(axes1,'FontName','Times','FontSize',12,'FontWeight','bold','GridColor',...
%             [0 0.447058823529412 0.741176470588235],'Layer','top','XColor',...
%             [0 0.447058823529412 0.741176470588235],'XGrid','on','YColor',...
%             [0 0.447058823529412 0.741176470588235],'YGrid','on');
%             % Create legend
%             legend(axes1,'show');
            close (figure1);
        
    end
end

