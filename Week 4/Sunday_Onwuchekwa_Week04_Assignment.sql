-- ==========================================================
-- USE AP DATABASE
-- ==========================================================
use ap;

-- ==========================================================
-- Query 1: #6
-- ==========================================================
SELECT vendor_name, vendor_contact_last_name, vendor_contact_first_name
FROM vendors
ORDER BY vendor_contact_last_name, vendor_contact_first_name ASC;

-- ==========================================================
-- Query 2: #7
-- ==========================================================
SELECT CONCAT(vendor_contact_last_name, ', ', vendor_contact_first_name) AS full_name
FROM vendors
WHERE vendor_contact_last_name REGEXP '^[A,B,C,E]'
ORDER BY vendor_contact_last_name, vendor_contact_first_name ASC;

-- ==========================================================
-- Query 3: #8
-- ==========================================================
SELECT invoice_due_date AS "Due Date", invoice_total AS "Invoice Total", invoice_total * 0.1000 AS "10%",
	invoice_total + (invoice_total * 0.1) AS "Plus 10%"
FROM Invoices
WHERE invoice_total BETWEEN 500 and 1000
ORDER BY invoice_due_date DESC;

-- ==========================================================
-- Query 4: #9
-- ==========================================================
SELECT invoice_number, invoice_total, payment_total + credit_total AS payment_credit_total,
	invoice_total - (payment_total + credit_total) AS balance_due
FROM invoices
WHERE invoice_total - (payment_total + credit_total) > 50
ORDER BY balance_due DESC
LIMIT 5;

-- ==========================================================
-- Query 5: #10
-- ==========================================================
SELECT invoice_number, invoice_date, invoice_total - (payment_total + credit_total) AS balance_due,
	payment_date
FROM invoices
WHERE payment_date IS NULL;

-- ==========================================================
-- Query 6: #11
-- ==========================================================
SELECT DATE_FORMAT(CURRENT_DATE(), '%m-%d-%Y') AS "current_date";

-- ==========================================================
-- Query 6: #12
-- ==========================================================
SELECT 50000 AS "starting_principal", 50000 * 0.065 AS "interest", 50000 + 50000 * 0.065 AS "principal_plus_interest"