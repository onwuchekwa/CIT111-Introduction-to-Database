-- ========================================================================
USE ap;
-- ========================================================================

-- ========================================================================
-- Query 1: #1
-- ========================================================================
INSERT INTO terms 
	(terms_id, terms_description, terms_due_days) 
VALUES
	(6, 'Net due 120 days', 120);
    
SELECT * 
FROM terms
WHERE terms_id = 6;

-- ========================================================================
-- Query 2: #2
-- ========================================================================
UPDATE terms
	SET terms_description = 'Net due 125 days',
		terms_due_days = 125
WHERE terms_id = 6;

SELECT * 
FROM terms
WHERE terms_id = 6;

-- ========================================================================
-- Query 3: #3
-- ========================================================================
DELETE FROM terms
WHERE terms_id = 6;

SELECT * 
FROM terms
WHERE terms_id = 6;

-- ========================================================================
-- Query 4: #4
-- ========================================================================
INSERT INTO invoices
VALUES
	(NULL, 32, 'AX-014-027', '2014/01/08', 434.58, 0.00, 0.00, 2, '2014/08/31', NULL);

SELECT *
FROM invoices 
WHERE invoice_number = 'AX-014-027';

-- ========================================================================
-- Query 5: #5
-- ========================================================================
INSERT INTO Invoice_Line_Items
	(invoice_id, invoice_sequence, account_number, line_item_amount, line_item_description)
VALUES 	
	((SELECT invoice_id 
	FROM invoices 
	WHERE invoice_number = 'AX-014-027'), 
		1, 160, 180.23, 'Hard Drive'),
	((SELECT invoice_id 
    FROM invoices 
    WHERE invoice_number = 'AX-014-027'), 
		2, 527, 254.35, 'Exchange Server update');

SELECT * 
FROM Invoice_Line_Items
WHERE invoice_id IN 
	(SELECT invoice_id FROM invoices WHERE invoice_number = 'AX-014-027');
    
-- ========================================================================
-- Query 6: #6
-- ========================================================================
UPDATE invoices
	SET credit_total = .10 * invoice_total,
		payment_total = invoice_total - credit_total
WHERE invoice_number = 'AX-014-027';        

SELECT *
FROM invoices
WHERE invoice_number = 'AX-014-027';

-- ========================================================================
-- Query 7: #7
-- ========================================================================
UPDATE vendors
	SET default_account_number = 403
WHERE vendor_id = 44;

SELECT *
FROM vendors
WHERE vendor_id = 44;

-- ========================================================================
-- Query 8: #8
-- ========================================================================
UPDATE invoices
	SET terms_id = 2
WHERE vendor_id IN (SELECT vendor_id
   FROM vendors
   WHERE default_terms_id = 2);
   
SELECT *
FROM invoices
 WHERE Vendor_id IN (SELECT vendor_id
   FROM vendors
   WHERE default_terms_id = 2);
   
-- ========================================================================
-- Query 9: #9
-- ========================================================================
DELETE FROM invoice_Line_Items
WHERE invoice_id = (SELECT invoice_id
  FROM invoices
	WHERE invoice_number = 'AX-014-027');

DELETE FROM invoices
WHERE invoice_number = 'AX-014-027';

SELECT *
FROM invoices
WHERE invoice_number = 'AX-014-027';      