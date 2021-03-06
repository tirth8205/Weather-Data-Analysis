%% Import data from text file.
% Script for importing data from the following text file:
%
%    /Users/tirth_8205/Dropbox/CDC-Internship/Raw Data/Testdata.dat
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2020/06/01 15:29:38

%% Initialize variables.
filename = '/Users/tirth_8205/Dropbox/CDC-Internship/Raw Data/Testdata.dat';

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%14s%10s%4s%11s%4s%11s%4s%11s%4s%11s%4s%11s%4s%11s%4s%11s%4s%11s%4s%11s%4s%11s%4s%11s%4s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string',  'ReturnOnError', false);

%% Remove white space around all cell columns.
dataArray{2} = strtrim(dataArray{2});

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^[-/+]*\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end


%% Split data into numeric and string columns.
rawNumericColumns = raw(:, [3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]);
rawStringColumns = string(raw(:, [1,2]));


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Make sure any text containing <undefined> is properly converted to an <undefined> categorical
idx = (rawStringColumns(:, 1) == "<undefined>");
rawStringColumns(idx, 1) = "";

%% Create output variable
Testdata = table;
Testdata.C20180406 = categorical(rawStringColumns(:, 1));
Testdata.VarName2 = rawStringColumns(:, 2);
Testdata.VarName3 = cell2mat(rawNumericColumns(:, 1));
Testdata.VarName4 = cell2mat(rawNumericColumns(:, 2));
Testdata.VarName5 = cell2mat(rawNumericColumns(:, 3));
Testdata.VarName6 = cell2mat(rawNumericColumns(:, 4));
Testdata.VarName7 = cell2mat(rawNumericColumns(:, 5));
Testdata.VarName8 = cell2mat(rawNumericColumns(:, 6));
Testdata.VarName9 = cell2mat(rawNumericColumns(:, 7));
Testdata.VarName10 = cell2mat(rawNumericColumns(:, 8));
Testdata.VarName11 = cell2mat(rawNumericColumns(:, 9));
Testdata.VarName12 = cell2mat(rawNumericColumns(:, 10));
Testdata.VarName13 = cell2mat(rawNumericColumns(:, 11));
Testdata.VarName14 = cell2mat(rawNumericColumns(:, 12));
Testdata.VarName15 = cell2mat(rawNumericColumns(:, 13));
Testdata.VarName16 = cell2mat(rawNumericColumns(:, 14));
Testdata.VarName17 = cell2mat(rawNumericColumns(:, 15));
Testdata.VarName18 = cell2mat(rawNumericColumns(:, 16));
Testdata.VarName19 = cell2mat(rawNumericColumns(:, 17));
Testdata.VarName20 = cell2mat(rawNumericColumns(:, 18));
Testdata.VarName21 = cell2mat(rawNumericColumns(:, 19));
Testdata.VarName22 = cell2mat(rawNumericColumns(:, 20));
Testdata.VarName23 = cell2mat(rawNumericColumns(:, 21));
Testdata.VarName24 = cell2mat(rawNumericColumns(:, 22));
Testdata.VarName25 = cell2mat(rawNumericColumns(:, 23));
Testdata.VarName26 = cell2mat(rawNumericColumns(:, 24));

%% Clear temporary variables
clearvars filename formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R idx;