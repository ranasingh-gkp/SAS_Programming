libname out "/folders/myshortcuts/my_folder/EPG194/output";


data out.Storm_cat5;
SET pg1.storm_summary;
where MaxWindMPH>=156 and StartDate >= "01JAN2000"d;
keep Season Basin Name Type MaxWindMPH;  
*drop;
run;




data eu_occ2016;
    set pg1.eu_occ;
    where YearMon like "2016%";
    format Hotel ShortStay Camp comma17.;
    drop geo;
run;




data fox;
    set pg1.np_species;
    where Category='Mammal' and Common_Names like '%Fox%' 
        and Common_Names not like '%Squirrel%';    
    drop Category Record_Status Occurrence Nativeness;
run;

proc sort data=fox;
    by Common_Names;
run;

