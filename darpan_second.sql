/*

	* These queries involves relations darpan_table2 and darpan2_daily_logs
	* These queries needed to be checked if issue occurs

*/

SELECT *FROM darpan2_daily_logs WHERE datadate = '2024-07-30'
SELECT *FROM darpan_table2
DELETE FROM darpan_table2 WHERE datadate = '2024-07-30'
UPDATE darpan_table2 SET datadate ='2024-07-31', datadate1 = '07/31/2024'
