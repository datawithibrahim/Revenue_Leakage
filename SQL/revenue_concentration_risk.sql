/* 
	Key Person Risk
    What happens if out top 1-2 salesperson leave?
    It depends on few sales agents
*/ 

-- Revenue Concentration Risk

use revenue_leakage;

CREATE PROCEDURE revenue_concentration
AS
    BEGIN
        SELECT
        sales_agent,
        SUM(close_value) AS total_revenue,
        ROUND(
            SUM(close_value) * 100.0 /
            (SELECT SUM(close_value) FROM crm_clean_master_data),
            2
        ) AS revenue_contribution_pct
    FROM crm_clean_master_data
    GROUP BY sales_agent
    ORDER BY revenue_contribution_pct DESC;
END;
GO

EXEC revenue_concentration;