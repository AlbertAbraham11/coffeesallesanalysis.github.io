--- PROJECT: COFFEE SHOP SALES ANALYSIS 

SELECT 'COFFEE SHOP SALES INSIGHTS' AS PROJECT;

SELECT 
    COUNT(*) AS Total_Transactions,
    '£' + FORMAT(SUM(money), 'N2') AS Total_Revenue,
    '£' + FORMAT(AVG(money),'N2') AS Avg_Transaction_Value
FROM Coffee_Sales;


--- TOP PERFORMING COFFEE DRINKS BY REVENUE

SELECT 
    coffee_name,
    COUNT(*) AS Transactions,
    '£' + FORMAT(SUM(money),'N2') AS Revenue,
   '£'+ FORMAT(AVG(money),'N2') AS Avg_Price
FROM Coffee_Sales
GROUP BY coffee_name
ORDER BY Revenue DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;


--- THIS SHOWS AT WHAT TIME PEOPLE BUY MOST

SELECT 
    HOURS_IN_A_DAY,
    COUNT(*) AS Transactions,
    '£'+ FORMAT(SUM(money),'N2') AS Revenue
FROM Coffee_Sales
GROUP BY HOURS_IN_A_DAY
ORDER BY HOURS_IN_A_DAY;


--- THIS ARRANGES WEEKDAYS IN PROPER ORDER AND SHOWS WHICH DAYS ARE BUSIEST

SELECT 
    Weekday,
    COUNT(*) AS Transactions,
    '£'+ FORMAT(SUM(money),'N2') AS Revenue
FROM Coffee_Sales
GROUP BY Weekday
ORDER BY CASE
            WHEN Weekday = 'Monday' THEN 1
            WHEN Weekday = 'Tuesday' THEN 2
            WHEN Weekday = 'Wednesday' THEN 3
            WHEN Weekday = 'Thursday' THEN 4
            WHEN Weekday = 'Friday' THEN 5
            WHEN Weekday = 'Saturday' THEN 6
            WHEN Weekday = 'Sunday' THEN 7
         END;


 --- COMPARES CARD VS CASH SALES

 SELECT 
    PAYMENT_METHOD,
    COUNT(*) AS Transactions,
    '£' + FORMAT(SUM(money),'N2') AS Revenue,
    '£' + FORMAT(AVG(money),'N2') AS Avg_Ticket
FROM Coffee_Sales
GROUP BY PAYMENT_METHOD;






