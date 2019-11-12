LIBNAME pg1 base "/folders/myshortcuts/my_folder/EPG194/data";

/* calaculating freq statics of np_summary*/
proc freq data=pg1.np_species;
    tables Abundance Conservation_Status;
    where Species_ID like "YOSE%" and
          Category="Mammal";
run;

proc print data=pg1.np_species;
    var Species_ID Category Scientific_Name Common_Names;
    where Species_ID like "YOSE%" and
          Category="Mammal";
run;



/* defining macro variable*/ 
%let ParkCode=ZION;
%let SpeciesCat=Bird;

proc freq data=pg1.np_species;
    tables Abundance Conservation_Status;
    where Species_ID like "&ParkCode%" and
          Category="&SpeciesCat";
run;

proc print data=pg1.np_species;
    var Species_ID Category Scientific_Name Common_Names;
    where Species_ID like "&ParkCode%" and
          Category="&SpeciesCat";
run;
