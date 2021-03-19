%% Function to draw a polar plot
%% Cleaning the previous data and Command Window
clear;
clc;

%% Importing data
filename='..//Raw Data//Raw Met Data.dat'; %File path

% filename = '/Users/tirth_8205/Desktop/Ahmedabad University/Internship [May - July,2020]/CDC-Internship/Raw Data/Raw Met Data.dat';

startRow = 2;

formatSpec = '%10f%7f%7f%8f%7f%f%[^\n\r]'; %data type format Specifier

f1 = fopen(filename,'r');

dataArray = textscan(f1, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

RawMetData1 = table(dataArray{1:end-1}, 'VariableNames', {'Julianday','TRHPr','esWSW','D','VarName5','VarName6'});

%% Cleaning of data
toDelete = RawMetData1.VarName6>=360;
RawMetData1(toDelete,:) = {0};

%% Dynamic input for number of bins
nbins=(input("Please enter the number of Bins you want e.g 10:"));%to take the value from user, like how many beans they want
binwidth=360/nbins;

%% Converting table to array 
row=height(RawMetData1); %height function returns the length of the table 
X1(:,1)=table2array(RawMetData1(:,5)); %WindSpeed data 
Y1(:,1)=table2array(RawMetData1(:,1));  %Wind Direction data

%% Creating bins and segragating data
%for binwidth=1:500

e=binwidth;%intializing end point as the higher limit for creating bins, for eg, if user wants 10 bins, then a=360/10=36, therefore the bins will be 0-36, 36-72 and so on

s=0;%intializing start point as the lower limit for creating bins

count=1; %will be used as counter vairiable

c=1; %will be used as counter variable

while (e<=360)

for i=1:row

    if ((Y1(i,1)>=s)&&(Y1(i,1)<e)) %condition to check whether the given value falls under the condition or not

        M(c,count)=(X1(i,1)); %stores the values. FOR BETTER UNDERSTANDING, PLEASE OPEN THE SECTION FROM THE WORKSPACE

        c=c+1;%increases the counter variable by 1

    end

end

count=count+1;%increases the counter variable by 1

s=e;%changes the value after completion of the every loop, here for instance, initially, it was 0, which will now change to 36, based on the above eg.  

e=e+binwidth;%increases the uper limit, from 36 to 72, 72 to 108 and so on, based on the above eg.

c=1;%after completion of every loop it should start with 1, therefore assigning the value again.

end

row1=length(M);

add1=0;

t=0;

for j=1:nbins

    M(M==0)=NaN;

    u=nanmean(M);

 end

polarplot(u,'*','MarkerSize',10);%plots the graph of average values

%% Polarplot properties
pax=gca;
pax.ThetaLim=[0 360];
pax.ThetaAxisUnits='degrees';
pax.ThetaDir='clockwise';
pax.ThetaZeroLocation='top';
pax.ThetaColor=[0.6 0.08 0.1];
pax.Title.String='WindSpeed - WindDirection Polar Plot';
pax.Title.Color=[0.6 0.08 0.1];
legendTitle=sprintf("WindSpeed\nNo. of Bins: %d",nbins);
legend({legendTitle},'FontSize',13)
pax.FontSize=13;
grid on;
pax.FontName='Times';
pax.FontWeight='bold';

%% Cleaning unrequired data
clear toDelete row i formatSpec startRow f1 j e M N k row row1 ...
s t count u c binwidth add1;

%% Saving the graph
saveas(gcf,'..//Results//WindSpeed-WindDirection PolarPlot(45 bins).png')

