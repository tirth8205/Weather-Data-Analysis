clear;
close all;
fclose all;
clc;
year=input('Enter the year: ');
if(mod(year,4)==0)
    month=[31,29,31,30,31,30,31,31,30,31,30,31];
else
    month=[31,28,31,30,31,30,31,31,30,31,30,31]; %days of month
end
for i=1:12
    for j=1:month(i)
        Y=rand(5); %random matrice of 5*5 will be generated
        istr=num2str(i,"%02d"); %for month in the title 
        jstr=num2str(j,"%02d"); %for day in the title   
         % Create multiple lines using matrix input to plot
           
      %   for i=1:j
       if (mod((i+j+year),2)==0)
                   figure1 = figure('WindowState','maximized');
                    axes1 = axes('Parent',figure1);    
                     plot1 = plot(Y,'MarkerFaceColor',[1 0 0],'Marker','diamond',...
                    'Parent',axes1);
                    xlim(axes1,[0.5 5.5]);
                    box(axes1,'on')     
                plot(Y,'Marker','d','MarkerFaceColor','red')
               
                legend('on')
                 legend('C1','C2','C3','C4','C5')
                % Create ylabel
                ylabel('Y units','FontWeight','bold','FontName','Times');

                % Create xlabel
                xlabel('X units','FontWeight','bold','FontName','Times');

                titleText=sprintf("%s%s%d",jstr,istr,year);
                    set(axes1,'FontName','Times','FontSize',12,'FontWeight','bold','GridColor',...
                    [0 0 1],'Layer','top','XColor',...
                    [0 0 1],'XGrid','on','YColor',...
                    [0 0 1],'YGrid','on');
                 title(titleText)
       
       else       
                   figure1 = figure('WindowState','maximized');
                    axes1 = axes('Parent',figure1);    
         plot1 = plot(Y,'MarkerFaceColor',[1 0 0],'Marker','diamond',...
            'Parent',axes1);
            xlim(axes1,[0.5 5.5]);
            box(axes1,'on');
        % Create axes
            
        plot(Y,'Marker','d','MarkerFaceColor','red')
        
        legend('on')
         legend('C1','C2','C3','C4','C5')
        % Create ylabel
        ylabel('Y units','FontWeight','bold','FontName','Times');

        % Create xlabel
        xlabel('X units','FontWeight','bold','FontName','Times');
        
        titleText=sprintf("%s%s%d",jstr,istr,year);
           set(axes1,'FontName','Times','FontSize',12,'FontWeight','bold','GridColor',...
            [0 1 0],'Layer','top','XColor',...
            [0 1 0],'XGrid','on','YColor',...
            [0 1 0],'YGrid','on');
         title(titleText)
       end 
%         end
                
            % Create legend            
        filename3 = sprintf('..\\Results\\Plot1_%s',titleText);
        print(gcf,'-dpng', filename3);
        saveas(gcf,(strcat(filename3,'.fig')));
  
            close (figure1);
        
    end
end

