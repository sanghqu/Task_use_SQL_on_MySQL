SELECT C.Segment, CONCAT(ROUND((SUM(B.Total_Charges)/(SELECT SUM(bill.Total_Charges) AS TOTAL FROM robot.bill)*100),3), '%') 
AS Percent_cancel_in_total  FROM robot.bill AS B
INNER JOIN robot.customer AS C ON B.Billing_Account=C.Billing_Account
WHERE B.Account_Status='cancelled'
GROUP BY C.Segment
ORDER BY C.Segment
