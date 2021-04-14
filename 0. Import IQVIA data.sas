
data redivis_export;
/* 
	SPECIFY THE PATH TO YOUR DOWNLOADED CSV BELOW:
*/

<<<<<<< HEAD
infile 'C:\Users\panyue\Box\1 Healing Communities\DATA_NYS\PAN\2.14.2 IQVIA\Import\V2.15\Projected_Naloxone_Distributions.csv' 
=======
infile 'C:\Users\panyue\Box\1 Healing Communities\DATA_NYS\PAN\2.14.2 IQVIA\Import\V2.12\Projected_Naloxone_Distributions.csv' 
>>>>>>> master
/*infile 'C:\Users\panyu\Box\Yue Pan from old laptop 2015\DR FEASTER\Healing Communities\2.14.2 IQVIA\Projected_Naloxone_Distributions.csv' */


delimiter = ',' MISSOVER DSD firstobs=2;


	informat PROJECTED_NRX 32. ;
	informat PROJECTED_NQTY 32. ;
	informat PROJECTED_TRX 32. ;
	informat PROJECTED_TQTY 32. ;
	informat PROJECTED_TCOST 32. ;
	informat PROJECTED_TPRICE 32. ;
	informat MONTH_YEAR_CODE 32. ;
	informat PRODUCT_DESCRIPTION $50. ;
	informat COMBINED_MOLECULE $50. ;
	informat STATE_CODE $50. ;
	informat COUNTY_TERRITORY $50. ;
	informat DSPNSD_NDC_CODE 32. ;
	informat DAYS_SUPPLY_NUMBER 32. ;
	informat PAY_TYPE_DESC $50. ;
	

input 
	PROJECTED_NRX
	PROJECTED_NQTY
	PROJECTED_TRX
	PROJECTED_TQTY
	PROJECTED_TCOST
	PROJECTED_TPRICE
	MONTH_YEAR_CODE
	PRODUCT_DESCRIPTION $
	COMBINED_MOLECULE $
	STATE_CODE $
	COUNTY_TERRITORY $
	DSPNSD_NDC_CODE
	DAYS_SUPPLY_NUMBER
	PAY_TYPE_DESC $
;







data redivis_export;
	retain PROJECTED_NRX PROJECTED_NQTY PROJECTED_TRX PROJECTED_TQTY PROJECTED_TCOST PROJECTED_TPRICE MONTH_YEAR_CODE PRODUCT_DESCRIPTION COMBINED_MOLECULE STATE_CODE COUNTY_TERRITORY DSPNSD_NDC_CODE DAYS_SUPPLY_NUMBER PAY_TYPE_DESC;
set redivis_export;
    

	format PROJECTED_NRX BEST32. ;
	format PROJECTED_NQTY BEST32. ;
	format PROJECTED_TRX BEST32. ;
	format PROJECTED_TQTY BEST32. ;
	format PROJECTED_TCOST BEST32. ;
	format PROJECTED_TPRICE BEST32. ;
	format MONTH_YEAR_CODE BEST32. ;
	format DSPNSD_NDC_CODE BEST32. ;
	format DAYS_SUPPLY_NUMBER BEST32. ;

RUN;
PROC CONTENTS data=redivis_export;
RUN;
QUIT;
	
