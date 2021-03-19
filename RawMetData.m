clear all;
filename =uigetfile('.dat');
startRow = 2;

formatSpec = '%10.6f%6.3f%7f%8f%7f%f%[^\n\r]';

f1= fopen(filename,'r');
dataArray = textscan(f1, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(f1);

RawMetData1= table(dataArray{1:end-1}, 'VariableNames', {'Julianday','TRHPr','esWSW','D','VarName5','VarName6'});
