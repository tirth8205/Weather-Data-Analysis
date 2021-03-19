%% finding the local Maxima-Minima of WindSpeed and Plotting the graph
clear all;
clc;
filename = '/Users/tirth_8205/Desktop/Ahmedabad University/Internship [May - July,2020]/CDC-Internship/Raw Data/Raw Met Data.dat';
startRow = 2;
formatSpec = '%10f%7f%7f%8f%7f%f%[^\n\r]'; %datatype format specifiers
f1 = fopen(filename,'r');
%scanning of data
dataArray = textscan(f1, formatSpec, 'Delimiter', '', 'WhiteSpace', '',...
    'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1,...
    'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(f1);
% cleaning of data
RawMetData1= table(dataArray{1:end-1}, 'VariableNames', {'JulianDay',...
    'TRHPr','esWSW','D','WindSpeed','WindDirection'});
toDelete = RawMetData1.WindSpeed > 998; %cleaning of data
RawMetData1(toDelete,:) = []; 
row=height(RawMetData1); %height function returns the number of rows 
for i=1:row
    WS(i,1)=table2array(RawMetData1(i,5));
    DT(i,1)=table2array(RawMetData1(i,1));
end
 
%finding Maxima Minima
amax=islocalmax(WS); %returns whether X1 is local minima or not
amin=islocalmin(WS); %returns whether X1 is local minima or not
Maxima=WS;
Maxima(~amax,1)=NaN;
Minima=WS;
Minima(~amin,1)=NaN;
%Julian day to date conversion
JD=NaN(length(DT),1);
JD=datetime(datestr(datenum(2018,12,31,23,59,59)+DT(:,1)));
%plotting Maxima Minima
figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(JD,WS,'DisplayName','WindSpeed','Color',[1 0 0]); 
hold on;
plot(JD,Maxima,'DisplayName','Maxima','Marker','o',...
    'Color',[0 0 1]);
hold on;
plot(JD,Minima,'DisplayName','Minima','Marker','*','Color',[0 0 0]);
hold off;
ylabel('WindSpeed(m/s)');
xlabel('Date');
title('Maxima-Minima Plot');
box(axes1,'on');
set(axes1,'FontAngle','italic','FontName','Times','FontSize',11,...
    'FontWeight','bold','XGrid','on','YGrid','on');
legend1 = legend(axes1,'show');
set(legend1,'Location','best');
clear i toDelete figure1;
clear startRow row formatSpec;
saveas(gcf,'..//Results//MaximaMinima.png')


