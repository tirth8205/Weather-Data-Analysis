clear;
clc;
%filename = uigetfile('*.dat');
filename = '..//Raw Data//Raw Met Data.dat';
startRow = 2;
formatSpec = '%10f%7f%7f%8f%7f%f%[^\n\r]';
f1 = fopen(filename,'r');
dataArray = textscan(f1, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
%fclose(fileID);
RawMetData = table(dataArray{1:end-1}, 'VariableNames', {'Julianday','TRHPr','esWSW','D','WindSpeed','WindDirection'});
row=height(RawMetData);
for i=1:row 
    X1(i,1)=table2array(RawMetData(i,5));
end

figure1 = figure('WindowState','maximized');
axes1 = axes('Parent',figure1);
hold(axes1,'on');
histogram(X1,'BinWidth',2);
%plot(X1,Y1);
ylabel('Frequency','FontWeight','bold','FontName','Times');
% Create xlabel
xlabel('WindSpeed','FontWeight','bold','FontName','Times',...
    'Color',[0.635294117647059 0.07843137254902 0.184313725490196]);

% Create title
title('WindSpeed-JulianDay',...
    'Color',[0.635294117647059 0.07843137254902 0.184313725490196]);

box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Times','FontSize',15,'FontWeight','bold','XColor',...
    [0.635294117647059 0.07843137254902 0.184313725490196],'YColor',...
    [0.635294117647059 0.07843137254902 0.184313725490196],'ZColor',...
    [0.635294117647059 0.07843137254902 0.184313725490196]);