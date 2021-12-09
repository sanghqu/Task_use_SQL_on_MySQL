SELECT M.Total_Revenue_of_Mark, J.Total_Revenue_of_Jannet FROM
(SELECT SUM(B.Total_Charges) AS Total_Revenue_of_Mark 
FROM robot.bill AS B INNER JOIN robot.customer AS C ON B.Billing_Account= C.Billing_Account
INNER JOIN robot.customer_name AS N ON N.Customer_ID= C.customer_id
WHERE   N.First_Name REGEXP '^[A-L]') AS M,
(SELECT SUM(B.Total_Charges) AS Total_Revenue_of_Jannet 
FROM robot.bill AS B INNER JOIN robot.customer AS C ON B.Billing_Account= C.Billing_Account
INNER JOIN robot.customer_name AS N ON N.Customer_ID= C.customer_id
WHERE   N.First_Name REGEXP '^[M-Z]' ) AS J;

