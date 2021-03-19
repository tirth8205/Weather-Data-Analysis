%% Finding the local Maxima-Minima of WindSpeed and Plotting the graph

%% Cleaning previous variables and Command Window 
clear all;
clc;
%% Importing the data 
filename = '..//Raw Data//Raw Met Data.dat';   %selection of file

startRow = 2;

formatSpec = '%10f%7f%7f%8f%7f%f%[^\n\r]'; %datatype format specifiers

f1 = fopen(filename,'r');

%% Scanning of data
dataArray = textscan(f1, formatSpec, 'Delimiter', '', 'WhiteSpace', '',...
    'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1,...
    'ReturnOnError', false, 'EndOfLine', '\r\n');

fclose(f1);

RawMetData1= table(dataArray{1:end-1}, 'VariableNames', {'JulianDay',...
    'TRHPr','esWSW','D','WindSpeed','WindDirection'});
%% Cleaning of data
toDelete = RawMetData1.WindSpeed > 998; 

RawMetData1(toDelete,:) = []; 
%% Converting table to array 
WS(:,1)=table2array(RawMetData1(:,5)); %WindSpeed data to be plotted on Y axis
DT(:,1)=table2array(RawMetData1(:,1));  %Julian Day data to be plotted on X axis 

%% Finding Maxima Minima
amax=islocalmax(WS); %returns whether X1 is local minima or not
amin=islocalmin(WS); %returns whether X1 is local minima or not

Maxima=WS;
Maxima(~amax,1)=NaN;

Minima=WS;
Minima(~amin,1)=NaN;

%% Julian day to date conversion
JD=NaN(length(DT),1);
JD=datetime(datestr(datenum(2018,12,31,23,59,59)+DT(:,1)));

%% Plotting Maxima Minima

figure1 = figure;

axes1 = axes('Parent',figure1); %Figure properties

hold(axes1,'on');

plot(JD,WS,'DisplayName','WindSpeed','Color',[1 0 0]); %plots WindSpeed 

hold on;

plot(JD,Maxima,'DisplayName','Maxima','Marker','o',... %plots Maxima points
    'Color',[0 0 1]);

hold on;

plot(JD,Minima,'DisplayName','Minima','Marker','*','Color',[0 0 0]); %plots the Minima points

hold off;

%% Plot Properties
ylabel('WindSpeed(m/s)','FontSize',18,'FontName','Times New Roman'); %Y-axis title and properties 

xlabel('Date','FontSize',18,'FontName','Times New Roman'); %X-axis title and properties 

title('Maxima-Minima Plot','FontSize',18,'FontName','Times New Roman'); %Graph title and properties

box(axes1,'on');

grid on;

set(axes1,'FontAngle','italic','FontName','Times New Roman','FontSize',18,...
    'FontWeight','bold','XGrid','on','YGrid','on');

legend1 = legend(axes1,'show'); %Legend properties
set(legend1,'Location','best');

%% Cleaning unrequired data 
clear i toDelete figure1;
clear startRow row formatSpec;
%% Saving the image
saveas(gcf,'..//Results//MaximaMinima.png') %File path 