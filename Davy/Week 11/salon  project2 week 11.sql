#1 show the name, Type and price of items( products and services) purchased by each customer sorted by customer name
# product table, product_id transactiondetail and  transaction_id transaction table , use customer_id, customer table
USE salon
;

SELECT  CONCAT(c.first_name, ' ', c.last_name) AS First_last, p.name,p.type,p.price
     FROM product p
     JOIN transactiondetail td
     USING (product_id)
     JOIN transaction t
     USING(transaction_id)
     JOIN customer c
     USING(customer_id)
    ORDER BY c.last_name
  ; 
  
  #2 show the total spend of each customer sorted by spend descending
  #
  SELECT CONCAT(c.first_name, ' ', c.last_name) AS First_last,
      SUM(p.price * td.quantity) AS total
  FROM product p
     JOIN transactiondetail td
     USING (product_id)
     JOIN transaction t
     USING(transaction_id)
     JOIN customer c
     USING(customer_id)
    GROUP BY c.customer_id
    ORDER BY SUM(p.price * td.quantity) DESC
    ;
    
    #3 show the total revenue generated by each employee sorted by revenue descending
    #SELECT CONCAT(e.emp_first_name, ' ', e.emp_last_name) AS First_last,
      SUM(p.price * td.quantity) AS total
  FROM product p
     JOIN transactiondetail td
     USING (product_id)
     JOIN transaction t
     USING(transaction_id)
     JOIN employee e
     USING(employee_id)
    GROUP BY e.employee_id
    ORDER BY SUM(p.price * td.quantity) DESC
    ;
    
    #4 show each employee with their title, hire date manager and manager title
    SELECT CONCAT(e.emp_first_name, ' ', e.emp_last_name) AS First_last, e.title, e.hire_date
         CONCAT(e.emp_first_name, ' ', e.emp_last_name) AS Manager,
         el.title
      FROM employee e
      JOIN employee el
      ON e.location_id = e.location_id
      AND el.title IN('owner','manager')
     ;
    
    
     




