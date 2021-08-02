#1
SELECT invoice_total,
    FORMAT ( invoice_total,1) AS ' Invoice Total Formatted',
    CONVERT ( invoice_total, SIGNED) AS ' Invoice Total converted',
    CAST ( invoice_total AS SIGNED) AS 'Invoice Total Casted'
 FROM invoices
 ;
 
 #2
 SELECT invoi_date,
   CAST(invoice_date AS DATETIME) AS 'Date and Time',
   CAST(invoice_date AS CHAR(7)) AS 'Year-Month'
   FROM invoices
   ;