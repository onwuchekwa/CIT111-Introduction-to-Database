-- ========================================================================
USE ap;
-- ========================================================================

-- ========================================================================
-- Query 1: #1
-- ========================================================================
SELECT v.vendor_id, SUM(invoice_total) AS invoice_total_sum
FROM vendors v JOIN invoices i
	ON v.vendor_id = i.vendor_id
GROUP BY vendor_id;

-- ========================================================================
-- Query 2: #2
-- ========================================================================
SELECT vendor_name, SUM(payment_total) AS payment_total_sum
FROM vendors v JOIN invoices i
	ON v.vendor_id = i.vendor_id
GROUP BY vendor_name
ORDER BY payment_total_sum DESC;

-- ========================================================================
-- Query 3: #3
-- ========================================================================
SELECT vendor_name, COUNT(invoice_id) AS invoice_count, 
	SUM(invoice_total) AS invoice_total_sum
FROM vendors v JOIN invoices i
	ON v.vendor_id = i.vendor_id
GROUP BY vendor_name
ORDER BY invoice_count DESC;

-- ========================================================================
-- Query 4: #4
-- ========================================================================
SELECT account_description, COUNT(ili.account_number) AS line_item_count,
	SUM(line_item_amount) AS line_item_amount_sum
FROM general_ledger_accounts gla JOIN invoice_line_items ili
	ON gla.account_number = ili.account_number
GROUP BY account_description
HAVING line_item_count > 1
ORDER BY line_item_amount_sum DESC;

-- ========================================================================
-- Query 5: #5
-- ========================================================================
SELECT account_description, COUNT(ili.account_number) AS line_item_count,
	SUM(line_item_amount) AS line_item_amount_sum
FROM general_ledger_accounts gla JOIN invoice_line_items ili
	ON gla.account_number = ili.account_number
    JOIN invoices i ON ili.invoice_id = i.invoice_id
WHERE i.invoice_date BETWEEN '2014-04-01' AND '2014-06-30'
GROUP BY account_description
HAVING line_item_count > 1
ORDER BY line_item_amount_sum DESC;

-- ========================================================================
-- Query 6: #6
-- ========================================================================
SELECT account_number, SUM(line_item_amount) AS 'line_item_sum'
FROM invoice_line_items
GROUP BY account_number WITH ROLLUP;

-- ========================================================================
-- Query 7: #8
-- ========================================================================
SELECT vendor_name, COUNT(DISTINCT(account_number)) AS number_of_gl_accounts
FROM vendors v JOIN invoices i
	ON v.vendor_id = i.vendor_id
    JOIN invoice_line_items ili 
		ON i.invoice_id = ili.invoice_id
GROUP BY vendor_name
HAVING number_of_gl_accounts > 1
ORDER BY vendor_name;