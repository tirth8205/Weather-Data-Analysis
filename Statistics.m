%% Function to find the Mean, Median and Standard Deviation of data.

%% Cleaning the previuos data variables and Command Window
clear;

clc;

%% Importing the data

filename = "..//Raw Data//Raw Met Data.dat"; %File path 

startRow = 2;

formatSpec = '%10f%7f%7f%8f%7f%f%[^\n\r]'; % datatype specifiers 

f1 = fopen(filename,'r');

dataArray = textscan(f1, formatSpec, 'Delimiter', '', 'WhiteSpace', '',...
    'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1,...
    'ReturnOnError', false, 'EndOfLine', '\r\n');

RawMetData1 = table(dataArray{1:end-1}, 'VariableNames', {'Julianday',...
    'TRHPr','esWSW','D','WindSpeed','WindDirection'});

%% Cleaning of insignificant data 

toDelete = RawMetData1.WindSpeed > 998;

RawMetData1(toDelete,:) = {0};

%% Converting table to array

% %row=height(RawMetData); %height function returns ths number of rows in table 
WS(:,1)=table2array(RawMetData1(:,5)); %WindSpeed data
DT(:,1)=table2array(RawMetData1(:,1));  %Julian Day data 

%% Finding the Mean, Median and Standard Deviation of data

WindSpeedMeanYearly=mean(WS); %mean function returns the mean of the array

WindSpeedMedianYearly=median(WS); %median function returns the median of array 

WindSpeedStandardDeviationYearly=std(WS); %std function returns the standard deviation of array 


%% Coversion of JulianDay to Date-Time format 

D(:,1)=datenum(2018,12,31,23,59,59)+DT(:,1); %datenum converts date to julian day 

D=(datevec(D)); %datevec function converts julian day to a vector array 
  

%% Finding Monthwise Mean, Median and Standard Deviation of Data

WindSpeedMeanMonthly(:,1)=0;

WindSpeedMedianDataMonthly(:,1)=0;

WindSpeedStandardDeviationMonthly(:,1)=0;

for j=1:12

    y=D(:,2)==j;

    WindSpeedMeanMonthly(j,1)=mean(WS(y,1)); %mean function returns the mean of the array

    WindSpeedMedianDataMonthly(j,1)=median(WS(y,1)); %median function returns the median of array 

    WindSpeedStandardDeviationMonthly(j,1)=std(WS(y,1)); %std function returns the standard deviation of array 
       
end

%% Clearing the unrequired data

clear startRow toDelete row M i j formatSpec f1 dataArray D;


