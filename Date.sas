LIBNAME pg1 base "/folders/myshortcuts/my_folder/EPG194/data";

/*===============Date formating=======*/
PROC PRINT data=pg1.storm_summary(obs=20);
	format StartDate DATE11.;
run;

/* calaculating freq statics of np_summary*/
PROC freq data=pg1.storm_summary;
	tables StartDate;
	FORMAT StartDate MONNAME.;
run;

proc freq data=pg1.storm_summary order=freq;
    tables StartDate;
    format startdate monname.;
run;