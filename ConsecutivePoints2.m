%% Program to find Consecutive points inorder to find the flow of data WindSpeed
%% Cleaning history and command Window

clear;
clc;

%% Importing Data file
filename ='..//Raw Data//Raw Met Data.dat'; %File path
startRow = 2;
formatSpec = '%10f%7f%7f%8f%7f%f%[^\n\r]'; %datatype specifiers
f1 = fopen(filename,'r');
dataArray = textscan(f1, formatSpec, 'Delimiter', '', 'WhiteSpace',...
    '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,...
    startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

RawMetData1 = table(dataArray{1:end-1}, 'VariableNames', {'Julianday',...
    'TRHPr','esWSW','D','WindSpeed','WindDirection'});

%% Cleaning of data
toClear = RawMetData1.WindSpeed > 998;
RawMetData1(toClear,:) ={0};

%% Converting table to array
row=height(RawMetData1);
WS(:,1)=table2array(RawMetData1(:,5)); %WindSpeed data to be plotted on Y axis
DT(:,1)=table2array(RawMetData1(:,1));  %Julian Day data to be plotted on X axis

%% Consecutive Points Algorithm
DCP=input('Enter Consecutive Points: '); %Dynamic Input for the minimum number of consecutive points

i=1; % constant declared for loop 

 P1((1:length(WS)),1)=0; %pre-defined array 

for j=1:row

    if ((issorted(WS(i:j),'ascend'))&& (any(WS(i:j)~=-Inf))) %issorted function returns whether the data is sorted or not 
    
        continue;
    
    else
        
        if((j-i+1)>=DCP)
       
            P1((i:j),1)=(WS((i:j),1));
           
            i=j+1;

        else
            
            i=i+1;
        
        end
        
    end
    
end
P1(P1==0)=NaN; % Replaces all the zeroes by NaN
i=1;
P2((1:length(WS)),1)=0; %pre-defined array 
for j=1:row

%     if (issorted(WS(i:j),'descend')&& ~isnan(P1(j,1)) && (any(WS(i:j)~=-Inf))) %issorted function returns whether the data is sorted or not 
    if (issorted(WS(i:j),'descend'))
        continue;
    else
        
        if((j-i+1)>=DCP)
        
            P2((i:j),1)=(WS((i:j),1));
            
            i=j+i;
        
        else
            i=i+1;
      
        end
        
    end
    
end

P2(P2==0)=NaN; % Replaces all the zeroes by NaN

%% Conversion of Julian day to date
D(:,1)=datenum(2018,12,31,23,00,01)+DT(:,1);
D=datetime(datestr(datevec(D)));

%% Plotting the graph
figure1 = figure('WindowState','maximized');
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(D,P1,'bo-',D,P2,'bo-');
ylabel('WindSpeed(m/s)','FontWeight','bold','FontName','Times'); %Y-axis title and properties
xlabel('Date','FontWeight','bold','FontName','Times',... %X-axis title and properties 
    'Color',[0.6 0.08 0.1]);
title('WindSpeed-Days Of Year ',... %Graph title and properties 
    'Color',[0.6 0.08 0.1]);
box(axes1,'on');
set(axes1,'FontName','Times','FontSize',15,'FontWeight','bold','XColor',...
    [0.6 0.08 0.1],'YColor',...
    [0.6 0.08 0.1],'ZColor',...
    [0.6 0.08 0.1]);

%% Clearing unrequeired data
clear i j toDelete figure1 axes1 startRow formatSpec ;
%% Saving the graph 
saveas(gcf,'..//Results//ConsecutivePoints(7 bins).png')
%% Saving the plot image 
%saveas(gcf,'..//Results//ConsecutivePoints(12 points).png')
