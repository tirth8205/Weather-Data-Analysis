%function to plot graph between Date-Time and Wind Speed
clear; 
clc;
filename = '/Users/tirth_8205/Desktop/Ahmedabad University/Internship [May - July,2020]/CDC-Internship/Raw Data/Raw Met Data.dat';
startRow = 2;
formatSpec = '%10f%7f%7f%8f%7f%f%[^\n\r]';
f1 = fopen(filename,'r');
%scanning of data
dataArray = textscan(f1, formatSpec, 'Delimiter', '', 'WhiteSpace',...
    '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,...
    startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
RawMetData1 = table(dataArray{1:end-1}, 'VariableNames', {'Julianday',...
    'TRHPr','esWSW','D','WindSpeed','WindDirection'});
%cleaning of data
toClear = RawMetData1.WindSpeed > 998;
RawMetData1(toClear,:) ={0};
row=height(RawMetData1);
for i=1:row 
     WS(i,1)=table2array(RawMetData1(i,5));
     DT(i,1)=table2array(RawMetData1(i,1)); 
end
D(:,1)=datenum(2018,12,31,23,59,59)+DT(:,1);
D=datetime(datestr(datevec(D)));
%plotting the graph
figure1 = figure('WindowState','maximized');
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(D(WS~=0),WS(WS~=0),'black-')
ylabel('WindSpeed(m/s)','FontWeight','bold','FontName','Times');
xlabel('Days of Year','FontWeight','bold','FontName','Times',...
    'Color',[0.6 0.08 0.1]);
title('WindSpeed-Days Of Year ',...
    'Color',[0.6 0.08 0.1]);
box(axes1,'on');
set(axes1,'FontName','Times','FontSize',15,'FontWeight','bold','XColor',...
    [0.6 0.08 0.1],'YColor',...
    [0.6 0.08 0.1],'ZColor',...
    [0.6 0.08 0.1]);
%clearing unrequired data
clear i j toDelete figure1 axes1;
clear startRow row formatSpec ;
 
saveas(gcf,'..//Results//WindSpeedTime.png')