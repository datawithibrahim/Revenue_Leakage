CREATE PROCEDURE sales_agent
AS 
BEGIN
	SELECT
    sales_agent,
    COUNT(*) AS deals_closed,
    SUM(close_value) AS total_revenue,
    ROUND(AVG(sales_cycle_days), 1) AS avg_cycle_days,
    ROUND(SUM(close_value) / COUNT(*), 2) AS avg_deal_size
FROM crm_clean_master_data
GROUP BY sales_agent
HAVING COUNT(*) >= 5
ORDER BY total_revenue DESC;

END;
GO
