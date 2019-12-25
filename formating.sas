***********************************************************;
*  Formatting Data Values in Results                      *;
***********************************************************;
*  Syntax and Example                                     *;
*                                                         *;
*    FORMAT col-name(s) format;                           *;
*                                                         *;
*    <$>format-name<w>.<d>                                *;
*                                                         *;
*    Common formats:                                      *;
*       dollar10.2 -> $12,345.67                          *;
*       dollar10.  -> $12,346                             *;
*       comma8.1   -> 9,876.5                             *;
*       date7.     -> 01JAN17                             *;
*       date9.     -> 01JAN2017                           *;
*       mmddyy10.  -> 12/31/2017                          *;
*       ddmmyy8.   -> 31/12/17                            *;
***********************************************************;
LIBNAME pg1 base "/folders/myshortcuts/my_folder/EPG194/data";
proc print data=pg1.class_birthdate;
	format Height Weight 3. Birthdate date9.;
run;	

***********************************************************;
*  Demo                                                   *;
*    1) Write a PROC PRINT step to list the data in       *;
*       PG1.STORM_DAMAGE. Highlight the step and run the  *;
*       selected code.                                    *;
*    2) Add a FORMAT statement to apply the MMDDYY10.     *;
*       format to Date, DOLLAR16. to Cost, and COMMA5. to *;
*       Deaths. Highlight the step and run the selected   *;
*       code.                                             *;
*    3) Change the width of MMDDYY to 8 and DOLLAR to 14. *;
*       Highlight the step and run the selected code.     *;
*       Change MMDDYY to 6 and DOLLAR to 10. Highlight    *;
*       the step and run the selected code again. What    *;
*       happens to the formatted values?                  *;
***********************************************************;

*Write a PROC PRINT step and FORMAT statement;
