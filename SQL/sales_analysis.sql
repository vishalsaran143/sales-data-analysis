-- ============================================================
--         SALES ANALYSIS QUERIES (2015-2018)
-- ============================================================


-- ============================================================
-- STEP 1: Year-wise Sales & Growth Trend (YoY %)
-- ============================================================

SELECT 
    Year,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(
        ((SUM(Sales) - LAG(ROUND(SUM(Sales), 2)) OVER (ORDER BY Year))
        / LAG(SUM(Sales)) OVER (ORDER BY Year)) * 100, 2
    ) AS YOY_Growth_Percent
FROM sales
GROUP BY Year;


-- ============================================================
-- STEP 2: Region-wise Sales Comparison (2016, 2017, 2018)
--         With Absolute Growth & Growth %
-- ============================================================

SELECT 
    region,
    ROUND(SUM(CASE WHEN Year = 2016 THEN Sales ELSE 0 END), 0) AS Sales_2016,

    -- Absolute Growth 2016 -> 2017
    ROUND((SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END) -
           SUM(CASE WHEN Year = 2016 THEN Sales ELSE 0 END)), 2) AS Abs_Growth_16_17,

    -- Growth % 2016 -> 2017
    ROUND(
        (SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END) -
         SUM(CASE WHEN Year = 2016 THEN Sales ELSE 0 END)) * 100 /
        NULLIF(SUM(CASE WHEN Year = 2016 THEN Sales ELSE 0 END), 0), 2
    ) AS Growth_2016_to_2017,

    ROUND(SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END), 0) AS Sales_2017,

    -- Absolute Growth 2017 -> 2018
    ROUND((SUM(CASE WHEN Year = 2018 THEN Sales ELSE 0 END) -
           SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END)), 2) AS Abs_Growth_17_18,

    -- Growth % 2017 -> 2018
    ROUND(
        (SUM(CASE WHEN Year = 2018 THEN Sales ELSE 0 END) -
         SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END)) * 100 /
        NULLIF(SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END), 0), 2
    ) AS Growth_2017_to_2018,

    ROUND(SUM(CASE WHEN Year = 2018 THEN Sales ELSE 0 END), 0) AS Sales_2018

FROM Sales
WHERE Year IN (2016, 2017, 2018)
GROUP BY region;


-- ============================================================
-- STEP 3: Category-wise Sales in West Region (2016, 2017, 2018)
-- ============================================================

SELECT 
    Category,
    ROUND(SUM(CASE WHEN Year = 2016 THEN Sales ELSE 0 END), 2) AS Sales_2016,

    ROUND((SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END) -
           SUM(CASE WHEN Year = 2016 THEN Sales ELSE 0 END)), 2) AS Growth_2016_2017,

    ROUND(SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END), 2) AS Sales_2017,

    ROUND((SUM(CASE WHEN Year = 2018 THEN Sales ELSE 0 END) -
           SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END)), 2) AS Growth_2017_2018,

    ROUND(SUM(CASE WHEN Year = 2018 THEN Sales ELSE 0 END), 2) AS Sales_2018

FROM sales
WHERE Region = 'West'
GROUP BY Category;


-- ============================================================
-- STEP 4: Sub-Category Sales in West Region
--         (Technology & Office Supplies only)
-- ============================================================

SELECT 
    Category,
    `Sub-Category`,
    ROUND(SUM(CASE WHEN Year = 2016 THEN Sales ELSE 0 END), 2) AS Sales_2016,

    ROUND((SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END) -
           SUM(CASE WHEN Year = 2016 THEN Sales ELSE 0 END)), 2) AS Growth_2016_2017,

    ROUND(SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END), 2) AS Sales_2017,

    ROUND((SUM(CASE WHEN Year = 2018 THEN Sales ELSE 0 END) -
           SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END)), 2) AS Growth_2017_2018,

    ROUND(SUM(CASE WHEN Year = 2018 THEN Sales ELSE 0 END), 2) AS Sales_2018

FROM sales
WHERE Region = 'West'
  AND Category IN ('Technology', 'Office Supplies')
GROUP BY Category, `Sub-Category`;


-- ============================================================
-- STEP 5: Sub-Category Growth Contribution %
--         (Which sub-category drove the most growth?)
-- ============================================================

WITH growth_data AS (
    SELECT 
        `Sub-Category`,

        -- Absolute Growth 2016 -> 2017
        ROUND((SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END) -
               SUM(CASE WHEN Year = 2016 THEN Sales ELSE 0 END)), 2) AS g_16_17,

        -- Absolute Growth 2017 -> 2018
        ROUND((SUM(CASE WHEN Year = 2018 THEN Sales ELSE 0 END) -
               SUM(CASE WHEN Year = 2017 THEN Sales ELSE 0 END)), 2) AS g_17_18

    FROM sales
    WHERE Region = 'West'
      AND Category IN ('Technology', 'Office Supplies')
    GROUP BY `Sub-Category`
)

SELECT 
    `Sub-Category`,
    g_16_17  AS Abs_Growth_16_17,
    g_17_18  AS Abs_Growth_17_18,

    -- Contribution % 2016 -> 2017
    ROUND(
        g_16_17 * 100.0 / NULLIF(SUM(g_16_17) OVER (), 0), 2
    ) AS Contribution_16_17,

    -- Contribution % 2017 -> 2018
    ROUND(
        g_17_18 * 100.0 / NULLIF(SUM(g_17_18) OVER (), 0), 2
    ) AS Contribution_17_18

FROM growth_data
ORDER BY Contribution_17_18 DESC;


-- ============================================================
--  END OF FILE
-- ============================================================
