-- ============================================
-- DEEP DIVE ANALYSIS — WHY Behind the Numbers
-- ============================================


-- -----------------------------------------------
-- 1. Revenue Per Order — Efficiency Analysis
-- -----------------------------------------------
-- WHAT we found: Copiers grew 4x in West region
-- WHY it matters: Is Copiers actually the most efficient product?
-- FINDING: Copiers generates ₹2020 per order vs Binders ₹138
--           Sales team spends 17x more effort on Binders for less return

SELECT 
    `Sub-Category`,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Sales) / COUNT(DISTINCT `Order ID`), 2) AS Revenue_Per_Order,
    CASE 
        WHEN SUM(Sales) / COUNT(DISTINCT `Order ID`) >= 300 THEN 'High Efficiency'
        WHEN SUM(Sales) / COUNT(DISTINCT `Order ID`) >= 220 THEN 'Medium Efficiency'
        ELSE 'Low Efficiency'
    END AS Efficiency_Tag
FROM sales
WHERE Region = 'West'
GROUP BY `Sub-Category`
ORDER BY Revenue_Per_Order DESC;

-- BUSINESS INSIGHT:
-- Copiers = 23 orders → ₹46,469 revenue (₹2020 per order)
-- Binders = 397 orders → ₹55,173 revenue (₹138 per order)
-- Shifting sales team focus from Binders to Copiers = same effort, 14x more revenue per order


-- -----------------------------------------------
-- 2. Central Region Decline — WHY 2018 mein gira?
-- -----------------------------------------------
-- WHAT we found: Central region declined in 2018
-- WHY it matters: Was it all products or one specific product?
-- FINDING: Copiers alone dropped 79% in Central — while growing in West

SELECT 
    Year,
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
WHERE Region = 'Central'
GROUP BY Year, `Sub-Category`
ORDER BY `Sub-Category`, Year;

-- BUSINESS INSIGHT:
-- Copiers in Central: 2017 → ₹17,499 | 2018 → ₹3,679 (-79% drop)
-- Same product (Copiers) was growing in West region during same period
-- This is NOT a product problem — it is a regional execution/distribution problem
-- Recommendation: Investigate Central region sales team performance for Copiers


-- -----------------------------------------------
-- 3. Phones Decline — WHY aur Kab Se?
-- -----------------------------------------------
-- WHAT we found: Phones was top product but now declining in West
-- WHY it matters: Is this a product problem or a regional problem?
-- FINDING: Phones is declining ONLY in West — East grew 69% in 2018

SELECT 
    Year,
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
WHERE `Sub-Category` = 'Phones'
GROUP BY Year, Region
ORDER BY Region, Year;

-- BUSINESS INSIGHT:
-- Phones in West:  2015 → ₹29,527 | 2018 → ₹24,432 (declining)
-- Phones in East:  2015 → ₹20,523 | 2018 → ₹35,952 (+69% growth)
-- Phones is NOT a dying product — West region strategy for Phones is failing
-- Recommendation: Study East region Phones strategy and replicate in West




-- -----------------------------------------------
-- 4. Season Analysis — Konse season mein kya bikta hai?
-- -----------------------------------------------
-- WHAT we found: Copiers sabse efficient product hai
-- WHY it matters: Kya Copiers har season consistent hai ya seasonal hai?
-- FINDING: Copiers Spring mein ₹3,053 per order — Fall mein sirf ₹1,049 per order

SELECT 
    season,
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(SUM(Sales) / COUNT(DISTINCT `Order ID`), 2) AS Revenue_Per_Order
FROM sales
WHERE Region = 'West'
    AND `Sub-Category` IN ('Copiers', 'Phones', 'Binders')
GROUP BY season, `Sub-Category`
ORDER BY `Sub-Category`, Revenue_Per_Order DESC;

-- BUSINESS INSIGHT:
-- Copiers Spring: ₹3,053 per order — PEAK performance
-- Copiers Fall:   ₹1,049 per order — 3x less than Spring
-- Copiers is NOT just an efficient product — it is a Spring-driven product
-- Strategy: Double down on Copiers in Spring
--           Targeted push in Fall — demand exists but untapped
-- Warning: Do NOT judge Copiers performance by Fall numbers alone
