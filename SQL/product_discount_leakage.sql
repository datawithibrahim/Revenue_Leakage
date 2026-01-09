/* 
    Hidden Revenue Leakage at Product Level
    (Pricing & Discount)
    Business Problem
    
    They sell a lot, but margins feel weak
*/

-- Product Discount Leakage

SELECT 
    Product,
    COUNT(*) as deals_closed,
    ROUND(AVG(sales_price), 2) AS avg_list_price,
    ROUND(AVG(close_value), 2) AS avg_realized_price,
    ROUND(AVG(sales_price - close_value), 2) AS avg_discount
FROM crm_clean_master_data
GROUP BY Product
ORDER BY avg_discount DESC;