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
isLeap1=0; %variable to check for leap year
isValid1=1; %variable to check for validity of input dates
if (year1>=1800 && year1<=9999)
    if (mod(year1,4)==0)
        isLeap1=1;
    end
    if(month1>=1 && month2<=12)
        if(month1==2)
            if(isLeap1==1 && day1<=29 && day1>=1) %for february
                  isValid1=1;
            elseif (day1>28)
                isValid1=0;
            end
        elseif (month1==4 || month1==6 || month1==9 || month1==11) %for months with 30 days
            if(day1>30)
                isValid1=0;
            end
        else %for months with 31 days
            if(day1>31)
                isValid1=0;
            end
        end
    else 
        isValid1=0;
    end
else
    isValid1=0;
end
if(isValid1==1) % if the start dates is valid only then the program moves forward
isLeap2=0; %similar check for the end date
isValid2=1;
if (year2>=1800 && year2<=9999)
    if (mod(year2,4)==0)
        isLeap2=1;
    end
    if(month2>=1 && month2<=12)
        if(month2==2)
            if(isLeap2==1 && day2<=29) %for february
                  isValid2=1;
            elseif (day2>28)
                isValid2=0;
            end
        elseif (month2==4 || month2==6 || month2==9 || month2==11) %for months with 30 days
            if(day2>30)
                isValid2=0;
            end
        else %for months with 31 days 
            if(day2>31)
                isValid2=0;
            end
        end
    else 
        isValid2=0;
    end
else
    isValid2=0;
end
else 
    disp('Invalid Date Inputs')
end
if(isValid1==1 && isValid2==1) %% if and only if both the date are valid, the program will move forward
    StartDate=datenum(year1,month1,day1); % returns the number of days passed since January 0,0000 for start date
    EndDate=datenum(year2,month2,day2); %returns the number of days passed since January 0, 0000 for end date
    DifferenceBetweenDates=abs(StartDate-EndDate); % Difference between the StartDate and EndDate will be the difference between the dates
    disp('Number of days between these two dates are (without including the start or end date depending on the input: ')
    disp(DifferenceBetweenDates)
else
    disp('Invalid Dates Input')
end