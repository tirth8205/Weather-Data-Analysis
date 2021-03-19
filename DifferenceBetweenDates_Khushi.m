%%Program to find difference between two dates
clear;
clc;
day1=input("Enter start day e.g 15: "); %%starting day 
if day1>=1 && day1<=31
    month1=input("Enter start month e.g 02: ");%%starting month
    if month1>=1 && month1<=12
      year1=input("Enter start year e.g. 2001:" );%%starting year
      day2=input("Enter end day e.g 15: ");%%ending day 
      if day2>=1 && day2<=31
        month2=input("Enter end month e.g 02: "); %%ending month
        if month2>=1 && month2<=12
            year2=input("Enter end year e.g. 2001: ");%%ending year
        else 
            disp("Wrong month input")
        end
      else
          disp("Wrong date input")
      end
    else
        disp("Wrong month input")
    end
else
    disp("Wrong date input")
end
    
%%
dayCount=abs(day2-day1); %difference between the days datenum datestr datevec calduration input output commands
monthCount=0;
yearCount=0; %difference between the years
if year2>year1 
    for i=year1:year2-1
        if mod(i,4)==0
            yearCount=yearCount+366;
            month=[31,29,31,30,31,30,31,31,30,31,30,31]; %an array of days in months if leap year
            if month2>month1 
                for j=month1:month2-1
                monthCount=monthCount+month(j);
                end
            else
                for j=month2:month1-1
                monthCount=monthCount+month(j);
                end  
            end
        else 
            yearCount=yearCount+365;
        end
    end
 %%
elseif year2==year1 
             if mod(year1,4)==0
               month=[31,29,31,30,31,30,31,31,30,31,30,31]; %an array of days in months if leap year
                if month2>month1 
                    for j=month1:month2-1
                    monthCount=monthCount+month(j);
                    end
                else
                    for j=month2:month1-1
                    monthCount=monthCount+month(j);
                    end  
                end
            
            else
                month=[31,28,31,30,31,30,31,31,30,31,30,31];
                if month2>month1 
                    for j=month1:month2-1
                    monthCount=monthCount+month(j);
                    end
                else
                    for j=month2:month1-1
                    monthCount=monthCount+month(j);
                    end  
                end
            end
%%
elseif year2<year1 
            for i=year2:year1-1
                if mod(i,4)==0
                     yearCount=yearCount+366;
                     month=[31,29,31,30,31,30,31,31,30,31,30,31]; %an array of days in months if leap year
                    if month2>month1
                        for j=month1:month2-1
                        monthCount=monthCount+month(j);
                        end
                    else
                        for j=month2:month1-1
                        monthCount=monthCount+month(j);
                        end  
                    end
                else
                    yearCount=yearCount+365;
                end
            end
end

%%   
    
totalDiff=dayCount+monthCount+yearCount; %total difference 
    
disp("Difference is (without including the end/start day) : ") %%depending on the dates wither the start date or the end date is excluded
disp(totalDiff)
%%
           

