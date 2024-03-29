
PROC SQL;
   CREATE TABLE IQVIA_00 AS 
   SELECT DISTINCT 
		  t1.*, 
		  INPUT(substr(CAT(T1.MONTH_YEAR_CODE),1,4),4.) AS YEAR,
	      input(SUBSTR(CAT(T1.MONTH_YEAR_CODE),5,2),2.) AS MONTH,
		  CASE WHEN CALCULATED MONTH IN (1,2,3) THEN 1
			   WHEN CALCULATED MONTH IN (4,5,6) THEN 2
			   WHEN CALCULATED MONTH IN (7,8,9) THEN 3
			   WHEN CALCULATED MONTH IN (10,11,12) THEN 4 
		       ELSE 9999999 END AS QUARTER,
          t2.ReporterId,
/*		  CHECK MISSING*/
/*		  T3.PROJECTED_TRX AS PROJECTED_TRX_CHECK*/
		  1 AS COUNT
      FROM WORK.REDIVIS_EXPORT_1 t1
           LEFT JOIN MAP.REPORTER_LIST t2 ON (propcase(t1.COUNTY) = propcase(t2.county)) 
										AND T1.STATE_CODE=T2.STATE
/*		   LEFT JOIN REDIVIS_EXPORT t3 ON */
/*					t1.PROJECTED_TRX=T3.PROJECTED_TRX AND */
/*					T1.STATE_CODE=T3.STATE_CODE AND*/
/*					t1.COUNTY_TERRITORY=T3.COUNTY_TERRITORY AND*/
/*					t1.MONTH_YEAR_CODE=T3.MONTH_YEAR_CODE*/
;
QUIT;








