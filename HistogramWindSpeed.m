%% Function to create a histogram of WindSpeed with bin-width 2
%% clearing previous variables and command window
clear;
clc;
%% Importing the data
filename = "..//Raw Data//Raw Met Data.dat"; %file path
startRow = 2;
formatSpec = '%10f%7f%7f%8f%7f%f%[^\n\r]'; %data format specifiers
f1 = fopen(filename,'r');
dataArray = textscan(f1, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
RawMetData = table(dataArray{1:end-1}, 'VariableNames', {'Julianday','TRHPr','esWSW','D','WindSpeed','WindDirection'});
%% Cleaning the insignificant data
toDelete = RawMetData.WindSpeed > 998;
RawMetData(toDelete,:) = [];
%% Converting table to array 
row=height(RawMetData);    %height fucntion returns the number of rows of table
for i=1:row 
     X1(i,1)=table2array(RawMetData(i,5)); %converts table to array
end
%% Plot figure properties 
figure1 = figure('WindowState','maximized'); %figure property
axes1 = axes('Parent',figure1); %axes property
hold(axes1,'on'); 
histogram(X1,'BinWidth',2); %histogram plot
ylabel('Frequency','FontWeight','bold','FontName','Times New Roman','FontSize',18); %y axis title and its properties
xlabel('WindSpeed','FontWeight','bold','FontName','Times New Roman',...
    'Color',[0.635294117647059 0.07843137254902 0.184313725490196],'FontSize',18);%x axis title and its properties
title('WindSpeed-Frequency',...
    'Color',[0.635294117647059 0.07843137254902 0.184313725490196]); %Graph title and its properties 
xlim([0 30]); % setting x-axis limit for clear figure
box(axes1,'on'); %box around the graph 
set(axes1,'FontName','Times New Roman','FontSize',18,'FontWeight','bold','XColor',... %X-Y axis properties 
    [0.635294117647059 0.07843137254902 0.184313725490196],'YColor',...
    [0.635294117647059 0.07843137254902 0.184313725490196],'ZColor',...
    [0.635294117647059 0.07843137254902 0.184313725490196]);
%% Clearing unrequired data 
clear i toDelete figure1;
clear startRow row formatSpec;
%% Saving the plot image
saveas(gcf,'..//Results//HistogramWindSpeed.png') %file path 
