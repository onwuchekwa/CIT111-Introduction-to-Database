#1
 INSERT INTO  terms (terms_id, terms_description, terms_due_days)
 VALUES (6,'Net due 120 days', 120)
    ;
    SELECT*
     FROM terms
     WHERE terms_id = 6
     ;
    
    #2
     UPDATE terms 
     SET terms_description = 'Net due 125 days',
        terms_due_days= 125
     WHERE terms_id = 6
     ;
     
     SELECT*
     FROM terms
     WHERE terms_id = 6
     ;
     
     #3
     DELETE FROM terms
      WHERE terms_id = 6
      ;
      
      SELECT*
      FROM terms
      WHERE terms_id = 6
      ;
      
      #4
      INSERT INTO invoices 
      VALUES (NULL, 32,'AX-014-027', '2014-8-1', 434.58,0,0,2,'2014-8-31', NULL)
      ;
      SELECT*
      FROM invoices
      WHERE invoice_number = 'AX-014-027'
      ;
      
 #5
INSERT INTO invoice_line_items (invoice_id, invoice_sequence, account_number, line_item_amount, line_item_description)
VALUES ((SELECT invoice_id
  FROM invoices
        WHERE invoice_number = 'AX-014-027'),
        1,
        160,
        180.23,
        'Hard drive'),
        ((SELECT invoice_id
  FROM invoices
        WHERE invoice_number = 'AX-014-027'),
        2,
        527,
        254.35,
        'Exchange Server update')
;
SELECT *
FROM Invoice_Line_Items
WHERE invoice_id = (SELECT invoice_id
  FROM invoices
        WHERE invoice_number = 'AX-014-027')
        ;
        
        #6
UPDATE invoices
SET credit_total = invoice_total * .10,
  payment_total = invoice_total - credit_total
WHERE invoice_number = 'AX-014-027'
;        
SELECT *
FROM invoices
WHERE invoice_number = 'AX-014-027'
;

#7
UPDATE vendors
SET default_account_number = 403
WHERE vendor_id = 44
;

SELECT*
FROM vendors
WHERE vendor_id = 44
;

#8
UPDATE invoices
SET terms_id = 2
WHERE Vendor_id IN (SELECT vendor_id
   FROM vendors
   WHERE default_terms_id = 2)
   ;
   
   
SELECT *
FROM invoices
 WHERE Vendor_id IN (SELECT vendor_id
   FROM vendors
   WHERE default_terms_id = 2)
   ;
   
   #9
   DELETE FROM invoice_line_items
WHERE invoice_id = (SELECT invoice_id
  FROM invoices
        WHERE invoice_number = 'AX-014-027')
;

DELETE FROM invoices
WHERE invoice_number = 'AX-014-027'
;

SELECT *
FROM invoices
WHERE invoice_number = 'AX-014-027'
;
                FROM invoices
                WHERE invoice_number = 'AX-014-027'),
                1,
                          
      