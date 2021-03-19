%% Program to plot graph between JulianDay and Wind Speed
%% Clearing the previous variables and Command Window
clear;
clc;

%% Import the data
filename ='..//Raw Data//Raw Met Data.dat'; %File path
startRow = 2;
formatSpec = '%10f%7f%7f%8f%7f%f%[^\n\r]'; %datatype specifiers
f1 = fopen(filename,'r');

%% Scanning of data
dataArray = textscan(f1, formatSpec, 'Delimiter', '', 'WhiteSpace',...
    '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,...
    startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

RawMetData1 = table(dataArray{1:end-1}, 'VariableNames', {'Julianday',...
'TRHPr','esWSW','D','WindSpeed','WindDirection'});%% Cleaning of data
toClear = RawMetData1.WindSpeed > 998;
RawMetData1(toClear,:) ={0};

%% Converting table to array 
WS(:,1)=table2array(RawMetData1(:,5)); %WindSpeed data to be plotted on Y axis
DT(:,1)=table2array(RawMetData1(:,1));  %Julian Day data to be plotted on X axis 

%% Plotting the graph
figure1 = figure('WindowState','maximized'); %Figure properties
axes1 = axes('Parent',figure1); %Axis properties
hold(axes1,'on');
plot(DT(WS~=0),WS(WS~=0),'b-') % Plotting the data
ylabel('WindSpeed(m/s)','FontWeight','bold','FontName','Times New Roman','FontSize',18); %Y-axis title and properties
xlabel('Days of Year','FontWeight','bold','FontName','Times New Roman','FontSize',18,... %X-axis title and properties
    'Color',[0.6 0.08 0.1]);
title('WindSpeed-Days Of Year ','FontName','Times New Roman','FontSize',18,... %Graph title and properties 
        'Color',[0.6 0.08 0.1]);
box(axes1,'on');
grid on;
set(axes1,'FontName','Times New Roman','FontSize',18,'FontWeight','bold','XColor',... %Axis properties
    [0.6 0.08 0.1],'YColor',...
    [0.6 0.08 0.1],'ZColor',...
    [0.6 0.08 0.1]);

%% Clearing unrequired data
clear i j toDelete figure1 axes1;
clear startRow row formatSpec ;

%% Saving the graph
saveas(gcf,'..//Results//WindSpeedJulianDay.png'); %File path
