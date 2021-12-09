Select MARK.Segment, MARK.Total_Revenue_of_Mark, JANET.Total_Revenue_of_Jannet from
(SELECT C.Segment AS Segment,SUM(B.Total_Charges) AS Total_Revenue_of_Mark from robot.bill AS B 
INNER JOIN robot.customer AS C ON B.Billing_Account= C.Billing_Account
INNER JOIN robot.customer_name AS N ON N.Customer_ID= C.customer_id
WHERE   N.First_Name REGEXP '^[A-L]' AND B.Account_Status='paying' 
GROUP BY C.Segment 
ORDER BY C.Segment) AS MARK
INNER JOIN
(SELECT C.Segment as Segment, SUM(B.Total_Charges) AS Total_Revenue_of_Jannet FROM robot.bill AS B 
INNER JOIN robot.customer AS C ON B.Billing_Account= C.Billing_Account
INNER JOIN robot.customer_name AS N ON N.Customer_ID= C.customer_id
WHERE   N.First_Name REGEXP '^[M-Z]' AND  B.Account_Status='paying' 
GROUP BY C.Segment
ORDER BY C.Segment) AS JANET
ON MARK.Segment=JANET.Segment

