SQL> CREATE USER MHAMILTON
    IDENTIFIED BY 1234;

User created.

Answer to Question 2
====================

SQL> CONNECT
Enter user-name: MHAMILTON
Enter password:
ERROR:
ORA-01045: user MHAMILTON lacks CREATE SESSION privilege; logon denied


Answer to Question 3
====================

SQL> GRANT CREATE SESSION, CREATE TABLE, ALTER ANY TABLE
    TO MHAMILTON;

Grant succeede


Answer to Question 4
====================
SQL> CREATE ROLE customerrep;

Role created.

SQL> GRANT INSERT, DELETE
    ON orders
    TO customerrep;

Grant succeeded.

SQL> GRANT INSERT, DELETE
    ON orderitems
    TO customerrep;

Grant succeeded.


Answer to Question 5
====================

SQL> GRANT customerrep
    TO MHAMILTON;

Grant succeeded.

Answer to Question 6
====================
SQL> CONNECT
Enter user-name: MHAMILTON
Enter password:
Connected.

SQL> SELECT * FROM user_sys_privs;

USERNAME                       PRIVILEGE                                ADM
------------------------------ ---------------------------------------- ---
MHAMILTON                      CREATE TABLE                             NO
MHAMILTON                      ALTER ANY TABLE                          NO
MHAMILTON                      CREATE SESSION                           NO

Answer to Question 7
====================
SQL> REVOKE delete
    ON orders
    FROM customerrep;

Revoke succeeded.

SQL> REVOKE delete
    ON orderitems
    FROM customerrep;

Revoke succeeded.

Answer to Question 8
====================
SQL> REVOKE customerrep
    FROM MHAMILTON;

Revoke succeeded.

Answer to Question 9
====================
SQL> DROP ROLE customerrep;

Role dropped.

Answer to Question 10
====================
SQL> DROP USER MHAMILTON;

User dropped.



			Advanced Challenge
			------------------


Answer to Question 1
====================

            |ACCOUNT MANAGERS   |  DATA ENTRY CLERKS  |  THE REPRESENTETIVES 
----------------------------------------------------------------------------
TABLES      |books, customers,  |books, author,       |customers, orders, 
	    |orders, orderitems,|orderitems, promotion|books
	    |promotion		|bookauthor, publisher|
----------------------------------------------------------------------------


Answer to Question 2
====================

ACCOUNT MANAGERS need to manage the customers previous ordes or books, hence they must have a privilege to view all the orders and
data about all customers, such as their name, order number, maybe an address to send some promotions etc. However, they should not make any changes 
to those tables, exept the promotion table.

DATA ENTRY CLERKS have to update inventories, so they must have access for updating all the tables that are related to the inventiry.
Such as books, author, publisher, orderitems (to see how many items have been sold), bookauthor, publisher. AND VIEW the gifts in the promotion table.
No permition to drop or creat tables as well as delete records. Because they should get a permission from supervisor in order to delete any record.

THE REPRESENTETIVES need to have privilege to update information about customers AND their order, add new customers to the database, AND view information about books.


Answer to Question 3
====================
ACCOUNT MANAGERS ROLE (acct_mgrs) -- VIEW all data from tables: books, customers, orders, orderitems, promotion. EDITE: promotion table.

DATA ENTRY CLERKS ROLE (data_clerk) -- VIEW, UPDATE, and CREATE records FOR: books, author, orderitems, bookauthor, publisher tables. Only VIEW for thr promotion table;
				
THE REPRESENTETIVES ROLE (cust_repres) -- VIEW, UPDATE, and CREATE records about customers and their orders. Tables: customers, orders.They also should have a permissin to view 
the books table to assist customers with providing any infomation about books, such as price, discount, pubdate etc.

Answer to Question 4
====================
					ACCOUNT MANAGERS 
					----------------

CREATE ROLE acct_mgrs;

GRANT CREATE SESSION 
TO acct_mgrs;

GRANT SELECT
ON books
TO acct_mgrs;

GRANT SELECT
ON customers
TO acct_mgrs;

GRANT SELECT
ON orderitems
TO acct_mgrs;

GRANT SELECT
ON orders
TO acct_mgrs;


GRANT SELECT, INSERT, UPDATE
ON promotion
TO acct_mgrs;

					DATA ENTRY CLERKS  
					----------------

CREATE ROLE data_clerk;

GRANT CREATE SESSION 
TO data_clerk;

GRANT SELECT, INSERT, UPDATE
ON books
TO data_clerk;

GRANT SELECT, INSERT, UPDATE
ON author
TO data_clerk;

GRANT SELECT, INSERT, UPDATE
ON orderitems
TO data_clerk;

GRANT SELECT
ON promotion
TO data_clerk;

GRANT SELECT, INSERT, UPDATE
ON bookauthor
TO data_clerk;

GRANT SELECT, INSERT, UPDATE
ON publisher
TO data_clerk;

 					THE REPRESENTETIVES
					-------------------
CREATE ROLE cust_repres;

GRANT CREATE SESSION 
TO cust_repres;

GRANT SELECT, INSERT, UPDATE
ON customers
TO cust_repres;

GRANT SELECT, INSERT, UPDATE
ON orders
TO cust_repres;

GRANT SELECT
ON books
TO cust_repres;


Answer to Question 5
====================
ACCOUNT MANAGERS : I gave them a permission to view the following tables: books, customers, orders, orderitems, promotion, because they need to have access to inforamtion 
about books, customers, orders, and promotions to performe marketing activities. They also must manage the promotion table, hence they need be ablo to create and update records in the table.

DATA ENTRY CLERKS : They must update infomation about the inventory, so I gave them permission to view, create, and update infomation in the following tables : books, author, orderitems, bookauthor, publisher tables.

THE REPRESENTETIVES : They work with customers, so they must have an access to the information about customers, their orders, and books. They also should be able to create and  update records in the customer and orders tables, 
but not in the books table.
					
