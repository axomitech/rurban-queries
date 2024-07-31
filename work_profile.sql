/*

	SQL Query for dispalying works profile from work_master_axilury
	Profile consisting of location i,e. state, district and cluster,
	Investment cgf, convergence, fs_cgf and fs_convergence
	MIS Status- whether ongoing, Completed or not started
	Expenditure - cgf expenditure, convergence expenditure
	Based on work id or work code provided in the query.

*/

/*

	Note: Sometime in case of works work id may not match the id part of a work code.
	In such situation the returned no. of rows may not matched the no. of work code provided.
	Here the id part is W-.......1884 but in work id column value id 1885

*/

SELECT 
	state_name,cluster_name,component_name,subcomponent,work_name,district_name,
        work_code,cgf_subcomponent_financial__dpr_physical_fin_target as dpr_cgf_amount,
        convergence_financial__dpr_physical_fin_target as dpr_convergence_amount,
        amount_as_per_fs_cgf__work_master as fs_cgf_amount,
        amount_as_per_fs_convergence__work_master as fs_convergence_amount,
        CASE 
            WHEN mis_status = 1 or mis_status = 2 or mis_status = 4 THEN 'Ongoing' 
            WHEN mis_status = 3 THEN 'Completed' 
            Else 'Not Started' END AS work_status,
        work_fund_type_dpr_physical_fin_target as work_type,work_type_work_master as work_category, 
        pfms_expenditure_cgf, previous_expenditure_cgf as cgf_vendor_expenditure,
        cluster_cgf_line_dept_release_amount_sum as line_dept_expenditure,convergence_expenditure as conv_exp,
        geo_tag_created_on as geotagged_on,
        (pfms_expenditure_cgf+ previous_expenditure_cgf +
        cluster_cgf_line_dept_release_amount_sum ) as cgf_exp
        from work_master_axilury
where work_id in (6075,1009,1900,1897,1795,1771,1884,1774,6361,2347,108207,31487,3054,2987,42121,10261,10257)
