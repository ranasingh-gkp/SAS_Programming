LIBNAME pg1 base "/folders/myshortcuts/my_folder/EPG194/data";

 proc sort data=pg1.storm_summary out=storm_sort;
     where Basin in("NA" "na");
     by descending MaxWindMPH;
 run;
 
 proc sort data=pg1.np_largeparks out=np_sort;
	by Reg descending DayVisits;
	where Type="NP";
 run;
 
 
 proc sort data=pg1.np_largeparks
		  out=park_clean
		  dupout=park_dups  /*ALL DUPLICATE ROWS IN SEPERATE TABLE */
		  noduprecs;
    by _all_;
run;