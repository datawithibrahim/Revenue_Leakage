/* Growth exixts but cash flow is weak 
    Business Problem - 
    Revenue looks good on paper, But cash flow is tight
*/

-- Industry Speed vs Value

    SELECT
        sector,
        COUNT(*) AS deals_closed,
        ROUND(AVG(close_value), 2) AS avg_deal_size,
        ROUND(AVG(sales_cycle_days), 2) AS avg_cycle_days
    FROM crm_clean_master_data
    GROUP BY sector
    ORDER BY avg_cycle_days DESC;

