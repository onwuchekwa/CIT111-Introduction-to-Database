-- ========================================================================
USE ap;
-- ========================================================================

-- ========================================================================
-- Query 1: #8-01
-- ========================================================================
SELECT invoice_total,
	FORMAT(invoice_total, 1) AS total_invoice,
    CONVERT(invoice_total, SIGNED) AS total_convert,
    CAST(invoice_total AS SIGNED) AS total_cast
FROM invoices;

-- ========================================================================
-- Query 2: #8-02
-- ========================================================================
SELECT invoice_date, 
	CAST(invoice_date AS DATETIME) AS total_datetime,
	CAST(invoice_date AS CHAR(7)) AS invoice_char7
FROM invoices;