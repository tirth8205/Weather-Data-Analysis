clear;
clc;
filename='..//Raw Data//Raw Met Data.dat'; %File path
%filename = '/Users/tirth_8205/Desktop/Ahmedabad University/Internship [May - July,2020]/CDC-Internship/Raw Data/RawMetData_1.dat';;
startRow = 2;
formatSpec = '%10f%7f%7f%8f%7f%f%[^\n\r]';
f1 = fopen(filename,'r');
dataArray = textscan(f1, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
RawMetData = table(dataArray{1:end-1}, 'VariableNames', {'Julianday','TRHPr','esWSW','D','WindSpeed','WindDirection'});
%cleaning of data
toClear = RawMetData.WindSpeed > 998;
RawMetData(toClear,:) ={0};
row=height(RawMetData);
for i=1:row
     X1(i,1)=table2array(RawMetData(i,5));
end
bcount=(input("Enter the number of bins you want, for eg. 28: "));
[BinC,BEdges]=histcounts(X1,bcount);
BinC=BinC.*100./sum(BinC);
%windspeedbin=linspace(0,20,11);
%more than or equal to 1m/s change only then significant 
% 12 continuos datapoints of decreasing then it is decreasing
%
figure1 = figure('WindowState','maximized');
axes1 = axes('Parent',figure1);
hold(axes1,'on');

h=histogram('BinEdges',BEdges,'BinCounts',BinC);
%h.Normalization = 'countdensity';
% xlim([0 30])
ylabel('Frequency (%)','FontWeight','bold','FontName','Times');
xlabel('WindSpeed (m/s)','FontWeight','bold','FontName','Times',...
    'Color',[0.635294117647059 0.07843137254902 0.184313725490196]);
titletext=sprintf("WindSpeed-Frequency (No. of Bins: %d)",bcount);
title({titletext},'Color',[0.635294117647059 0.07843137254902 0.184313725490196]);
box(axes1,'on');
set(axes1,'FontName','Times','FontSize',15,'FontWeight','bold','XColor',...
    [0.635294117647059 0.07843137254902 0.184313725490196],'YColor',...
    [0.635294117647059 0.07843137254902 0.184313725490196],'ZColor',...
    [0.635294117647059 0.07843137254902 0.184313725490196]);
%% Saving the plot image 
saveas(gcf,'..//Results//FrequencyHistogram(25 bins).png')