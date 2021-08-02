-- ========================================================================
USE ap;
-- ========================================================================

-- ========================================================================
-- Query 1: #9-01
-- ========================================================================
SELECT invoice_total,
	ROUND(invoice_total, 1) AS one_digit,
    ROUND(invoice_total) AS zero_digit
FROM invoices;

-- ========================================================================
-- Query 2: #9-02
-- ========================================================================
SELECT start_date,
	DATE_FORMAT(start_date, '%b/%d/%y') AS format1,
	DATE_FORMAT(start_date, '%c/%e/%y') AS format2,
	DATE_FORMAT(start_date, '%l:%i %p') AS twelve_hour,
	DATE_FORMAT(start_date, '%c/%e/%y %l:%i %p') AS format3
FROM ex.date_sample;

-- ========================================================================
-- Query 3: #9-03
-- ========================================================================
SELECT vendor_name,
	UPPER(vendor_name) AS vendor_name_upper,
    vendor_phone,
    RIGHT(vendor_phone, 4) AS last_digits,
    TRIM('('FROM REPLACE(REPLACE(vendor_phone,'-','.'),') ','.')) AS phone_with_dots,
    SUBSTRING_INDEX(SUBSTRING(vendor_name, LOCATE(' ', vendor_name, 1)),' ', 2) AS second_word
FROM vendors;

-- ========================================================================
-- Query 4: #9-04
-- ========================================================================
SELECT invoice_number, invoice_date,
    DATE_ADD(invoice_date, INTERVAL 30 DAY) AS date_plus_30_days,
    payment_date,
    DATEDIFF(payment_date, invoice_date) AS days_to_pay,
    MONTH(invoice_date) AS month,
	YEAR(invoice_date) AS year
FROM invoices
WHERE invoice_date BETWEEN '2014-05-01' AND '2014-05-31';