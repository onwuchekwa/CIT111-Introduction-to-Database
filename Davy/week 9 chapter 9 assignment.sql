#1
SELECT invoice_total,
   ROUND(invoice_total,1) AS 'Rounded Total'
   ROUND(invoice_total,1) AS 'Whole Number'
   FROM Invoices
   ;
   
   #2 
   SELECT start_date,
   DATE_FORMART(start_date,'%b/%d/%y') AS 'Month/Day/Year',
   DATE_FORMART(start_date, '%c/%e/%y') AS 'Month/Day/Year',
   DATE_FORMART(start_date, '%l:%i %p') AS 'Time',
    DATE_FORMART(start_date, '%c/%e/%y %l:%i %p') AS 'Date Time'
   FROM ex.date_simple
   ;
   
   #3
   SELECT vendor_name,
     UPPER(vendor_name) AS 'UPPER',
	 vendor_phone,
     RIGHT (vendor_phone, 4) AS 'Last 4',
     TRIM('(' FROM REPLACE(REPLACE(vendor_phone,'-','-'),')','-')) AS 'Phone Reformat',
     SUBSTRING_INDEX(SUBSTRING(vendor_name, LOCATE(' ', vendor_name, 1)),' ', 2)
     FROM vendors
     ;
     
     #4
     SELECT invoice_number, invoice_date,
        DATE_ADD(invoice_date, INTERVAL 30 DAY) AS 'Plus 30 Days',
        Payment_date,
        DATEDIFF(payment_date, invoice_date) AS days_to_pay,
        MONTH(invoice_date) AS 'Invoice Month',
        YEAR(invoice_date) AS 'Year'
	FROM Invoices
    WHERE invoice_date BETWEEN '2014-05-01' AND '2014-05-31'
    ;
    