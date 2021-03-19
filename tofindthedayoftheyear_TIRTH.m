%% Program to find Date of the Year
clear; clc; 
Day=(input("Enter Day, e.g. 15 :"));%%to take the value from the user
if (Day>=1 && Day <=365)
    if Day>0 && Day<=31
    "January "+(Day-0);
elseif Day>31 && Day<=59
    "February "+(Day-31) ; %#ok<*VUNUS>  %% Subrtracting 31 Days, as there are 31 Days in the previous month.
elseif Day>59 && Day<=90 
    "March "+(Day-59);
elseif Day>90 && Day<=120
    "april "+(Day-90);
elseif Day>120 && Day<=151
    "May "+(Day-120) ;
elseif Day>151 && Day<=182
    "June "+(Day-151);
elseif Day>182 && Day<=213
    "July "+(Day-182);
elseif Day>213 && Day<=243
    "August "+(Day-213);
elseif Day>243 && Day<=274
    "September " +(Day-243);
elseif Day>274 && Day<=304
    "October "+(Day-274);
elseif Day>304 && Day<=334
    "November "+(Day-304);
elseif Day>334 && Day<=365
    "December "+(Day-334);
    end
    disp(ans);
else disp("Invalid Input, Please enter between 1 and 365");
end
