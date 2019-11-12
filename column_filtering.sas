

data storm_length;
     set pg1.storm_summary;
     drop Hem_EW Hem_NS lat lon;
     StormLength = EndDate-StartDate;
run;



data storm_windavg;
    set pg1.storm_range;
    WindAvg=mean(wind1, wind2, wind3, wind4);
    WindRange=range(of wind1-wind4);
run;


/*Character Function	What it Does
UPCASE (char) LOWCASE(char)    	Changes letters in a character string to uppercase or lowercase
PROPCASE (char,<delimiters>)	Changes the first letter of each word to uppercase and other letters to lowercase
CATS (char1, char2, ...)	     Concatenates character strings and removes leading and trailing blanks from each argument
SUBSTR (char, position, <length>)   	Returns a substring from a character string*/


data pacific;
    set pg1.storm_summary;
    drop type Hem_EW Hem_NS MinPressure Lat Lon;
    where substr(Basin,2,1)="P";
run; 



/*
MONTH (SAS-date)	Returns a number from 1 through 12 that represents the month
YEAR (SAS-date)	Returns the four-digit year
DAY (SAS-date)	Returns a number from 1 through 31 that represents the day of the month
WEEKDAY (SAS-date)	Returns a number from 1 through 7 that represents the day of the week (Sunday=1)
QTR (SAS-date)	Returns a number from 1 through 4 that represents the quarter*/


/*
TODAY ()	Returns the current date as a numeric SAS date value (no argument is required because the function reads the system clock)
MDY (month, day, year)	Returns a SAS date value from numeric month, day, and year values
YRDIF (startdate, enddate, 'AGE')	Calculates a precise age between two dates */


data np_summary_update;
    set pg1.np_summary;
    SqMiles = Acres*.0015625;
    Camping=sum(OtherCamping, TentCampers, RVCampers, BackcountryCampers);
    format SqMiles Camping commas4.;
    keep Reg ParkName DayVisits OtherLodging Acres SqMiles Camping;
    run;
    
 
data eu_occ_total;
    set pg1.eu_occ;
    Year=substr(YearMon,1,4);
    Month=substr(YearMon,6,2);
    ReportDate=MDY(Month,1,Year);
    Total=sum(Hotel,ShortStay,Camp);
    format Hotel ShortStay Camp Total comma17.
           ReportDate monyy7.;
    keep Country Hotel ShortStay Camp ReportDate Total;
run;  
