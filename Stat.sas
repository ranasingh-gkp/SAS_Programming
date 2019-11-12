LIBNAME pg1 base "/folders/myshortcuts/my_folder/EPG194/data";



PROC PRINT data=pg1.np_summary (obs=20);
VAR  Type TentCampers RVCampers ParkName DayVisits;
run;



/* calaculating mean statics of np_summary*/
PROC means data=pg1.np_summary;
VAR  TentCampers RVCampers DayVisits;
run;


/* calaculating univariate statics of np_summary*/
PROC univariate data=pg1.np_summary;
VAR  TentCampers RVCampers DayVisits;
run;



/* calaculating freq statics of np_summary*/
PROC freq data=pg1.np_summary;
tables  Reg Type;
run;


proc print data=pg1.storm_summary(obs=50);
   *commented WHERE statements;
   where name like "Z%";
run;


PROC PRINT data=pg1.np_summary;
VAR  Type TentCampers RVCampers ParkName DayVisits;
where Type='PRESERVE';
run;