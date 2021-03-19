% %% Setup the Import Options and import the data
imports = delimitedTextImportOptions("NumVariables", 26);

% Specify range and delimiter
imports.DataLines = [1, 2785];
imports.Delimiter = ',';
%% Specify column names and types
imports.VariableNames = ["C", "VarName2", "VarName3", "VarName4", "VarName5", "VarName6", "VarName7", "VarName8", "VarName9", "VarName10", "VarName11", "VarName12", "VarName13", "VarName14", "VarName15", "VarName16", "VarName17", "VarName18", "VarName19", "VarName20", "VarName21", "VarName22", "VarName23", "VarName24", "VarName25", "VarName26"];
imports.VariableTypes = ["double", "datetime", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify variable properties
imports = setvaropts(imports, "VarName2", "InputFormat", "yyyy/MM/dd HH:mm:ss");
imports = setvaropts(imports, "C", "TrimNonNumeric", true);
imports = setvaropts(imports, "C", "ThousandsSeparator", ",");

% Import the data
% Testdata1 = readtable("/home/kali/Desktop/Summer Internship 2020/Testdata.dat", imports);
Testdata1 = readtable("..//Raw Data//Testdata.dat", imports);

for i=1:2785
   X(i,1)=(Testdata1(i,2));
   Y(i,1)=(Testdata1(i,4));       
end
figure1=figure('WindowState','maximized');
X1=table2array(X);
Y1=table2array(Y);
axes1 = axes('Parent',figure1,...
  'Position',[0.124244257460351 0.10875 0.740686919475172 0.825]);
% Create plot
plot(X1,Y1,'LineWidth',1,...
    'Color',[0.535294117647059 0.884313725490196 0.784313725490196]);
title('06042018//Time-Parameter Graph')
xlabel('Time')
ylabel('VarName4')

box(axes1,'on');
grid(axes1,'on');

% Set the remaining axes properties
set(axes1,'FontAngle','italic','FontName','Times','FontSize',12,...
    'FontWeight','bold');
% Create legend
legend(axes1,'show','VarName4');
          
% f3 = sprintf('/home/kali/Desktop/Summer Internship 2020/Plot_06042018');
f3 = sprintf('..//Results//Plot_06042018');

print(gcf,'-dpng', f3);
% saveas(gcf,(strcat(f3,'.fig')));
     