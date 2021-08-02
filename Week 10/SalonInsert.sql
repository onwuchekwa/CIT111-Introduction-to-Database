-- ========================================================================
USE salon;
-- ========================================================================
-- ========================================================================
-- INSERT INTO LOCATION TABLE
-- ========================================================================
INSERT INTO location
VALUES 
	(DEFAULT, '100 N Main St.', 'Suite 3', 'Rexburg', 'ID', '83441');
SET @Loc1 = last_insert_id();

INSERT INTO location
VALUES 
	(DEFAULT, '200 N Center St.', NULL, 'Rigby', 'ID', '83442');
SET @Loc2 = last_insert_id();
    
-- ========================================================================
-- INSERT INTO CUSTOMER TABLE
-- ========================================================================
INSERT INTO customer
VALUES 
	(DEFAULT, 'Jeana', 'Bradford', 'jb@gmail.com', '1112223333'),
	(DEFAULT, 'Sandra', 'Hobbs', 'sh@gmail.com', '1112223334');

INSERT INTO customer
VALUES 
	(DEFAULT, 'Ryan', 'Taylor', 'rt@gmail.com', '1112223335');
SET @Cust3 = last_insert_id();

INSERT INTO customer
VALUES 
	(DEFAULT, 'Michelle', 'Drake', 'md@gmail.com', '1112223336');
SET @Cust4 = last_insert_id();

INSERT INTO customer
VALUES 
	(DEFAULT, 'Heidi', 'Nolan', 'hn@gmail.com', '1112223337');
SET @Cust5 = last_insert_id();

INSERT INTO customer
VALUES 
	(DEFAULT, 'Karen', 'Smith', 'ks@gmail.com', '1112223338');
SET @Cust6 = last_insert_id();

INSERT INTO customer
VALUES 
	(DEFAULT, 'Jose', 'Mendez', 'jm@gmail.com', '1112223339');
SET @Cust7 = last_insert_id();

-- ========================================================================
-- INSERT INTO EMPLOYEE TABLE
-- ========================================================================
INSERT INTO employee
VALUES 
	(DEFAULT, 'Jenny', 'Jensen', 'Owner', '2013-06-15', NULL, 'jensenj@salon.com', '2081112222', @Loc1, DEFAULT);
SET @Emp1 = last_insert_id();

INSERT INTO employee
VALUES 
	(DEFAULT, 'Haley', 'Lopez', 'Assistant Manager', '2013-08-23', NULL, 'lopezh@salon.com', '2083334444', @Loc1, '1');
SET @Emp2 = last_insert_id();

INSERT INTO employee
VALUES 
	(DEFAULT, 'Robert', 'Green', 'Associate', '2014-01-03', NULL, 'greenr@salon.com', '2085556666', @Loc1, '2');
SET @Emp3 = last_insert_id();

INSERT INTO employee
VALUES 
	(DEFAULT, 'Olive', 'Adams', 'Manager', '2015-07-12', NULL, 'adamso@salon.com', '2087778888', @Loc2, '1');
SET @Emp4 = last_insert_id();

INSERT INTO employee
VALUES 
	(DEFAULT, 'Julie', 'Davis', 'Associate', '2015-10-20', NULL, 'davisj@salon.com', '2089990000', @Loc2, '4');
    
-- ========================================================================
-- INSERT INTO PRODUCT TABLE
-- ========================================================================
INSERT INTO product
VALUES 
	(DEFAULT, 'Shampoo', 'Product', '8 oz', 4.95);
SET @Prod1 = last_insert_id();

INSERT INTO product
VALUES 
	(DEFAULT, 'Shampoo', 'Product', '16 oz', 8.95);
SET @Prod2 = last_insert_id();

INSERT INTO product
VALUES 
	(DEFAULT, 'Conditioner', 'Product', '12 oz', 4.95);
SET @Prod3 = last_insert_id();

INSERT INTO product
VALUES 
	(DEFAULT, 'Hairspray', 'Product', '8 oz', 7.95),
    (DEFAULT, 'Shampoo', 'Service', NULL, 8.00);

INSERT INTO product
VALUES 
    (DEFAULT, 'Men Hair Cut', 'Service', NULL, 15.00);
SET @Prod6 = last_insert_id();

INSERT INTO product
VALUES 
	(DEFAULT, 'Women Hair Cut', 'Service', NULL, 25.00);
SET @Prod7 = last_insert_id();

INSERT INTO product
VALUES 
	(DEFAULT, 'Color', 'Service', NULL, 50.00);
SET @Prod8 = last_insert_id();

INSERT INTO product
VALUES 
	(DEFAULT, 'Perm', 'Service', NULL, 60.00);
SET @Prod9 = last_insert_id();

-- ========================================================================
-- INSERT INTO TRANSACTION TABLE
-- ========================================================================
INSERT INTO transaction
VALUES 
	(DEFAULT, @Emp1, @Cust7, '2019-03-25');
SET @Tran1 = last_insert_id();

INSERT INTO transaction
VALUES 
	(DEFAULT, @Emp1, @Cust6, '2019-03-25');
SET @Tran2 = last_insert_id();

INSERT INTO transaction
VALUES 
	(DEFAULT, @Emp2, @Cust5, '2019-03-25');
SET @Tran3 = last_insert_id();

INSERT INTO transaction
VALUES 
	(DEFAULT, @Emp3, @Cust4, '2019-03-25');
SET @Tran4 = last_insert_id();

INSERT INTO transaction
VALUES 
	(DEFAULT, @Emp4, @Cust3, '2019-03-25');
SET @Tran5 = last_insert_id();

-- ========================================================================
-- INSERT INTO TRANSACTIONDETAIL TABLE
-- ========================================================================
INSERT INTO transactiondetail
VALUES 
	(DEFAULT, @Tran1, @Prod1, 2),
    (DEFAULT, @Tran1, @Prod6, 1),
    (DEFAULT, @Tran2, @Prod9, 1),
    (DEFAULT, @Tran2, @Prod3, 3),
    (DEFAULT, @Tran3, @Prod8, 1),
    (DEFAULT, @Tran4, @Prod7, 1),
    (DEFAULT, @Tran4, @Prod2, 1),
    (DEFAULT, @Tran5, @Prod6, 1);