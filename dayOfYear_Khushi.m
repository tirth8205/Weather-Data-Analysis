%%
clear all;
clc;
day=(input("Enter Day e.g 15:")); %Date input
m=(input("Enter Month e.g. 02:")); %Month input
year=(input("Enter year e.g. 2020:"));%Year input
daysInFeb=28;%for non leap year
total=0;%the total number of days, final answer
%%
if mod(year,4)==0
    month=[31,29,31,30,31,30,31,31,30,31,30,31]; %an array of days in months if leap year
else
    month=[31,28,31,30,31,30,31,31,30,31,30,31]; %an array of days in months if non leap year
end
%%
for i=1:m-1
      total = total+month(i); 
end
      total=total+day;

%%
disp(total)
