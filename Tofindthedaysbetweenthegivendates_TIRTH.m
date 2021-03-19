%% program to find the days between the given dates
clear;clc;
day=(input("Enter the start date, e.g. 15 :"));
if (day<1 || day>31)
   disp ("Invalid Input")
end 
month=(input("Enter the start month, e.g. 08:"));
if (month<1 || month>12)
    disp ("Invalid Input")
end
copyofmonthvariable=month+1;
copyofmonth=month;
year=(input("Enter the start year, e.g. 2016:"));
if (year<0000 || (month==2 && mod(year,4)==0 && day>29) || (month==2 && mod(year,4)~=0 && day>28))
    disp ("Invalid Input")
end
copyofyear=year;
formatOut = 'ddmmyyyy';
currentdate=datestr(now,formatOut);
d=str2double(currentdate(1:2));
m=str2double(currentdate(3:4));
y=str2double(currentdate(5:8));
leap=[31,29,31,30,31,30,31,31,30,31,30,31]; %an array of days in months if it is a leap year
notleap=[31,28,31,30,31,30,31,31,30,31,30,31]; %an array of days in months if it is not a leap year
if (day>d && month>m && copyofyear>=y)
    disp ("Please Enter within the Limit")
end
if (month == 01 ||month == 03 ||month == 05 ||month == 07 ||month == 08 ||month == 10 ||month == 12)
    countervariable=31;
elseif (month == 04 ||month == 06 ||month == 09 ||month == 11)
    countervariable=30;
elseif (month == 02 && mod(year,4)==0)
    countervariable=29;
else
    countervariable=28;
end        
countd=0; %to store the total no. of Days
countm=0; %to store the total no. of Months
copyofday=day;
cod=day;
if(y>=year)
while (copyofday<=countervariable && copyofmonth~=m)
countd=countd+1;
copyofday=copyofday+1;
end
end
differencebetweentheyears=y-year;
while(differencebetweentheyears>=1)
while (copyofmonthvariable<=12)
    if(mod(year,4)==0)
        countm=countm+leap(copyofmonthvariable);
    else
        countm=countm+notleap(copyofmonthvariable);
    end
    copyofmonthvariable=copyofmonthvariable+1;
end
year=year+1;
differencebetweentheyears = differencebetweentheyears-1;
copyofmonthvariable=1;
end
temp=m-1;
if(copyofyear<y)
while(temp>=1)
      if mod(y,4)==0
        countm=countm+leap(temp);
       else
        countm=countm+notleap(temp);
      end
      temp=temp-1;
end
else
    while(temp>month)
      if mod(y,4)==0
        countm=countm+leap(temp);
       else
        countm=countm+notleap(temp);
      end
      temp=temp-1;
    end
end
if (copyofyear==y && copyofmonth==m)
while (d>=cod)
    countd=countd+1;
    d=d-1;
end
else
    while (d>=1)
    countd=countd+1;
    d=d-1;
    end
end
countt=countd+countm;
if ((day<1 || day>31)||(month<1 || month>12)||(year<0000 || (month==2 && mod(copyofyear,4)==0 && day>29) || (month==2 && mod(copyofyear,4)~=0 && day>28))||(day>d && month>m && copyofyear>=y))
    disp ("Please Enter the Inputs Again");
else
    disp (countt)
end
