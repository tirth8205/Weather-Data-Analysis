%function to find Consecutive points inorder to find the flow of data
%WindSpeed
clear; 
clc;
filename ='..//Raw Data//Raw Met Data.dat'; 
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
     WS(i,1)=table2array(RawMetData1(i,5)); %getting windspeed data from table to another array
     DT(i,1)=table2array(RawMetData1(i,1));%getting julianday data from table to another array
    
end
DCP=input('Enter Consecutive Points: '); %dynamic input
acount=0; %constant declared for checking the number of consecutive points in ascending order
dcount=0; %constant declared for checking the number of consecutive points in descending order

j=0;
for i=1:row-1 
    k=i;
    j=k+j+1; %checing the  just next row after i
    startingIndex=i; % constant delcared for random order points 
    if(issorted(WS(i:j),'ascend')) %checking the ascending order 
        j=j+1;
        dcount=0; %if ascending then the descending order count must change to 0
        acount=acount+1; %if ascending then the ascending order count should increace by 1
        if(acount>=DCP) %if ascending order count is greater than or equal to dynamic input then copy the data to resultant array
            P1((i:j),1)=(WS((i:j),1));
        end     
        elseif(issorted(WS(i:j),'descend'))
        acount=0;%if descending then the ascending order count must change to 0
        dcount=dcount+1;%if descending then the descending order count should increace by 1
         if(dcount>=DCP)%if descending order count is greater than or equal to dynamic input then copy the data to resultant array 
            P1((i:j),1)=(WS((i:j),1));
         end 
    elseif(isnan(WS(i,1))) %if the data is not a number then write NaN in the resultant array
        P1(i,1)=NaN;
    else % if random order 
       acount=0; %if random order then the ascending order count must change to 0
       dcount=0; %if random then the descending order count must change to 0
        P1(i,1)=NaN; %resultant array gets the value of NaN
        i=startingIndex-1; % i must go back to its original value plus 1
    end 
end 
for i=1:length(P1)
    if(P1(i,1)==0)
        P1(i,1)=NaN; % replacing zeros with NaN
    end 
end 
%converting Julian day to Date 
JD=datetime(DT,'convertfrom','excel');
JD=JD+1; % adding a day to it as default starts from 31st December
for i=1:length(JD)
d=datestr(JD(i)); %converting date to string
v(i,1)=datetime(replaceBetween (d,8,11,'2019')); %string replacement and then conversion to datetime format
end
%plotting the graph
figure1 = figure('WindowState','maximized');
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(v(~isnan(P1)),P1(~isnan(P1)),'r*')
ylabel('WindSpeed(m/s)','FontWeight','bold','FontName','Times');
xlabel('Date','FontWeight','bold','FontName','Times',...
    'Color',[0.6 0.08 0.1]);
title('WindSpeed-Days Of Year ',...
    'Color',[0.6 0.08 0.1]);
box(axes1,'on');
set(axes1,'FontName','Times','FontSize',15,'FontWeight','bold','XColor',...
    [0.6 0.08 0.1],'YColor',...
    [0.6 0.08 0.1],'ZColor',...
    [0.6 0.08 0.1]);
%clearing unrequeired data
clear i j c x T1 toDelete r figure1 axes1;
clear startRow row formatSpec d t1;
% saveas(gcf,'WindSpeedJulianDay(Decimal).png')

