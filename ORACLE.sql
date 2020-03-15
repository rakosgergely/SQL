PI CONSTANT NUMBER = 3.12 ;

-- ------------------------------------------------ -- 
-- ------------------LOOPS---------------------- --
-- ------------------------------------------------ --
	-- BASIC LOOP

	DECLARE 
	   x number := 10; 
	BEGIN 
	   LOOP 
		  dbms_output.put_line(x); 
		  x := x + 10; 
		  IF x > 50 THEN 
			 exit; 
		  END IF; 
	   END LOOP; 
	   -- after exit, control resumes here  
	   dbms_output.put_line('After Exit x is: ' || x); 
	END; 

	-- WHILE LOOP

	DECLARE 
	   a number(2) := 10; 
	BEGIN 
	   WHILE a < 20 LOOP 
		  dbms_output.put_line('value of a: ' || a); 
		  a := a + 1; 
	   END LOOP; 
	END; 

	-- FOR LOOP

	DECLARE 
	   a number(2); 
	BEGIN 
	   FOR a in 10 .. 20 LOOP 
		  dbms_output.put_line('value of a: ' || a); 
	  END LOOP; 
	END; 

-- ---------------------------------------------------- --
-- ---------------------NESTED_LOOPS-------------- --
-- ---------------------------------------------------- --

	-- BASIC_NESTED_LOOPS
		
		LOOP 
			Sequence of statements1 
				   LOOP 
					  Sequence of statements2 
				   END LOOP; 
		END LOOP;
	--WHILE_NESTED_LOOPS
	
	WHILE condition1 LOOP 
		sequence_of_statements1 
		   WHILE condition2 LOOP 
					sequence_of_statements2 
		   END LOOP; 
	END LOOP; 
	
	
	-- FOR_ NESTED_LOOPS
		
		FOR counter1 IN initial_value1 .. final_value1 LOOP 
			sequence_of_statements1 
				   FOR counter2 IN initial_value2 .. final_value2 LOOP 
					  sequence_of_statements2 
				   END LOOP; 
		END LOOP;
		
-- ---------------------------------------------------- --
-- ---------------------VARRAY_TYPE---------------- --
-- ---------------------------------------------------- --	
		
		-- CREATE OR REPLACE TYPE varray_type_name IS VARRAY(n) of <element_type>
		
		CREATE Or REPLACE TYPE namearray AS VARRAY(3) OF VARCHAR2(10); 
		
		CURSOR c_customers is 
		SELECT  name FROM customers; 
		type c_list is varray (6) of customers.name%type; 
		name_list c_list := c_list(); 
		counter integer :=0; 
	
-- ---------------------------------------------------- --
-- ---------------------PROCEDURE----------------- --
-- ---------------------------------------------------- --	

		DECLARE 
		   a number; 
		   b number; 
		   c number;
		PROCEDURE findMin(x IN number, y IN number, z OUT number) IS 
		BEGIN 
			   IF x < y THEN 
				  z:= x; 
			   ELSE 
				  z:= y; 
			   END IF; 
		END;   
		BEGIN 
			   a:= 23; 
			   b:= 45; 
			   findMin(a, b, c); 
			   dbms_output.put_line(' Minimum of (23, 45) : ' || c); 
		END; 
	
-- ---------------------------------------------------- --
-- ---------------------FUNCTION-------------------- --
-- ---------------------------------------------------- --		

	DECLARE 
	   num number; 
	   factorial number;  
	   
	FUNCTION fact(x number) 
	RETURN number  
	IS 
	   f number; 
	BEGIN 
	   IF x=0 THEN 
		  f := 1; 
	   ELSE 
		  f := x * fact(x-1); 
	   END IF; 
	RETURN f; 
	END;  

	
-- ---------------------------------------------------- --
-- ---------------------CURSOR---------------------- --
-- ---------------------------------------------------- --			

			DECLARE 
				   c_id customers.id%type; 
				   c_name customerS.No.ame%type; 
				   c_addr customers.address%type; 
				   CURSOR c_customers is 
					  SELECT id, name, address FROM customers; 
				BEGIN 
				   OPEN c_customers; 
				   LOOP 
				   FETCH c_customers into c_id, c_name, c_addr; 
					  EXIT WHEN c_customers%notfound; 
					  dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr); 
				   END LOOP; 
				   CLOSE c_customers; 
			END; 

			
-- ---------------------------------------------------- --
-- ---------------------EXCEPTION---------------------- --
-- ---------------------------------------------------- --				

DECLARE 
		   c_id customers.id%type := 8; 
		   c_name customerS.Name%type; 
		   c_addr customers.address%type; 
BEGIN 
		   SELECT  name, address INTO  c_name, c_addr 
		   FROM customers 
		   WHERE id = c_id;  
		   DBMS_OUTPUT.PUT_LINE ('Name: '||  c_name); 
		   DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr); 

		EXCEPTION 
		   WHEN no_data_found THEN 
			  dbms_output.put_line('No such customer!'); 
		   WHEN others THEN 
			  dbms_output.put_line('Error!'); 
END; 



/*

ACCESS_INTO_NULL	06530	-6530	It is raised when a null object is automatically assigned a value.
CASE_NOT_FOUND	06592	-6592	It is raised when none of the choices in the WHEN clause of a CASE statement is selected, and there is no ELSE clause.
COLLECTION_IS_NULL	06531	-6531	It is raised when a program attempts to apply collection methods other than EXISTS to an uninitialized nested table or varray, or the program attempts to assign values to the elements of an uninitialized nested table or varray.
DUP_VAL_ON_INDEX	00001	-1	It is raised when duplicate values are attempted to be stored in a column with unique index.
INVALID_CURSOR	01001	-1001	It is raised when attempts are made to make a cursor operation that is not allowed, such as closing an unopened cursor.
INVALID_NUMBER	01722	-1722	It is raised when the conversion of a character string into a number fails because the string does not represent a valid number.
LOGIN_DENIED	01017	-1017	It is raised when a program attempts to log on to the database with an invalid username or password.
NO_DATA_FOUND	01403	+100	It is raised when a SELECT INTO statement returns no rows.
NOT_LOGGED_ON	01012	-1012	It is raised when a database call is issued without being connected to the database.
PROGRAM_ERROR	06501	-6501	It is raised when PL/SQL has an internal problem.
ROWTYPE_MISMATCH	06504	-6504	It is raised when a cursor fetches value in a variable having incompatible data type.
SELF_IS_NULL	30625	-30625	It is raised when a member method is invoked, but the instance of the object type was not initialized.
STORAGE_ERROR	06500	-6500	It is raised when PL/SQL ran out of memory or memory was corrupted.
TOO_MANY_ROWS	01422	-1422	It is raised when a SELECT INTO statement returns more than one row.
VALUE_ERROR	06502	-6502	It is raised when an arithmetic, conversion, truncation, or sizeconstraint error occurs.
ZERO_DIVIDE	01476	1476	It is raised when an attempt is made to divide a number by zero.
*/


-- ---------------------------------------------------- --
-- ---------------------DDL,DML--------------------- --
-- ---------------------------------------------------- --	

-- A database manipulation (DML) statement (DELETE, INSERT, or UPDATE)

-- A database definition (DDL) statement (CREATE, ALTER, or DROP).

-- A database operation (SERVERERROR, LOGON, LOGOFF, STARTUP, or SHUTDOWN).


			CREATE OR REPLACE TRIGGER display_salary_changes 
			BEFORE DELETE OR INSERT OR UPDATE ON customers 
			FOR EACH ROW 
			WHEN (NEW.ID > 0) 
			DECLARE 
			   sal_diff number; 
			BEGIN 
			   sal_diff := :NEW.salary  - :OLD.salary; 
			   dbms_output.put_line('Old salary: ' || :OLD.salary); 
			   dbms_output.put_line('New salary: ' || :NEW.salary); 
			   dbms_output.put_line('Salary difference: ' || sal_diff); 
			END; 


-- ---------------------------------------------------- --
-- ---------------------UNDO_REDO----------------- --
-- ---------------------------------------------------- --	

/*


What is Undo in Oracle
Oracle database creates and manages information that is used to roll back. Here, this information refers to the records on transactions before they are committed. 
These records are also called undo.

Undo tablespace is a specific tablespace that only stores undo information. Therefore, it is not possible to create any tables/indexes etc. to undo tablespaces. 
Each database contains zero or more undo tablespaces. In Oracle, there is an automatic undo management mode. Every Oracle instance is assigned with a single undo tablespace.
These undo tablespaces manage to undo data using undo segments.

Difference Between Undo and Redo in Oracle
Generally, undo records support multiple tasks. These help to roll back transactions and to recover the database. It is also possible to analyze data of an earlier point in time 
by using the Oracle Flashback query. Furthermore, there is a possibility of recovering from logical corruptions using Oracle flashback features.

When issuing a ROLLBACK statement, undo records help to undo changes made to the database by the uncommitted transaction. At the time of recovering the database, 
the undo records allows undoing any uncommitted changes applied to form the redo log to the datafiles. Furthermore, undo records provide read consistency.

What is Redo in Oracle
Oracle provides redo logs. These logs contain files with a history of all changes made to the database. Each redo log file has a set of redo records or redo entries.
A redo record stores a set of change vectors which denotes a change made to a single block in the database. These files protect the database from system 
failures due to disk failures etc. Furthermore, it is important to multiplex the redo log files to avoid information loss during a disk failure.

Difference Between Undo and Redo in Oracle
Definition
Undo is a record of a transaction before it is committed in Oracle RDBMS. In contrast, an entry in redo log files that holds a group of change vectors in Oracle RDBMS.

*/
/*

-- ---------------------------------------------------- --
-- ------------------------DDL------------------------- --
-- ---------------------------------------------------- --	
DDL is short name of Data Definition Language, which deals with database schemas and descriptions, of how the data should reside in the database.

CREATE - to create a database and its objects like (table, index, views, store procedure, function, and triggers)
ALTER - alters the structure of the existing database
DROP - delete objects from the database
TRUNCATE - remove all records from a table, including all spaces allocated for the records are removed
COMMENT - add comments to the data dictionary
RENAME - rename an object

-- ---------------------------------------------------- --
-- -------------------------DML------------------------ --
-- ---------------------------------------------------- --	
DML is short name of Data Manipulation Language which deals with data manipulation and includes most common SQL statements such SELECT, INSERT, UPDATE, DELETE, etc., and it is used to store, modify, retrieve, delete and update data in a database.
SELECT - retrieve data from a database
INSERT - insert data into a table
UPDATE - updates existing data within a table
DELETE - Delete all records from a database table
MERGE - UPSERT operation (insert or update)
CALL - call a PL/SQL or Java subprogram
EXPLAIN PLAN - interpretation of the data access path
LOCK TABLE - concurrency Control

-- ---------------------------------------------------- --
-- -------------------------DCL------------------------ --
-- ---------------------------------------------------- --	
DCL is short name of Data Control Language which includes commands such as GRANT and mostly concerned with rights, permissions and other controls of the database system.

GRANT - allow users access privileges to the database
REVOKE - withdraw users access privileges given by using the GRANT command

-- ---------------------------------------------------- --
-- -------------------------TCL------------------------ --
-- ---------------------------------------------------- --	
TCL is short name of Transaction Control Language which deals with a transaction within a database.

COMMIT - commits a Transaction
ROLLBACK - rollback a transaction in case of any error occurs
SAVEPOINT - to rollback the transaction making points within groups
SET TRANSACTION - specify characteristics of the transaction

*/
-- ---------------------------------------------------- --
-- ---------------------TRANSACTIONS--------------- --
-- ---------------------------------------------------- --	
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 ); 

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 ); 

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (3, 'kaushik', 23, 'Kota', 2000.00 ); 

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 ); 

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 ); 

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (6, 'Komal', 22, 'MP', 4500.00 ); 

COMMIT;

ROLLBACK;

 DECLARE EXIT HANDLER FOR SQLEXCEPTION  
    BEGIN 
        ROLLBACK; 
    END; 

	
SET AUTOCOMMIT ON; 

SET AUTOCOMMIT OFF;	

-- ---------------------------------------------------- --
-- ---------------------DATE&TIME------------------- --
-- ---------------------------------------------------- --	
/*

YEAR	
-4712 to 9999 (excluding year 0)	Any nonzero integer

MONTH	
01 to 12	0 to 11

DAY	
01 to 31 (limited by the values of MONTH and YEAR, according to the rules of the calendar for the locale)	Any nonzero integer

HOUR	
00 to 23	0 to 23

MINUTE	
00 to 59	0 to 59

SECOND	
00 to 59.9(n), where 9(n) is the precision of time fractional seconds
The 9(n) portion is not applicable for DATE.
0 to 59.9(n), where 9(n) is the precision of interval fractional seconds

TIMEZONE_HOUR	
-12 to 14 (range accommodates daylight savings time changes)
Not applicable for DATE or TIMESTAMP.
Not applicable

TIMEZONE_MINUTE	
00 to 59
Not applicable for DATE or TIMESTAMP.
Not applicable

TIMEZONE_REGION	
Not applicable for DATE or TIMESTAMP.	Not applicable

TIMEZONE_ABBR	
Not applicable for DATE or TIMESTAMP.

ADD_MONTHS(x, y);
Adds y months to x.

LAST_DAY(x);
Returns the last day of the month.

MONTHS_BETWEEN(x, y);
Returns the number of months between x and y.

NEXT_DAY(x, day);
Returns the datetime of the next day after x.

NEW_TIME;
Returns the time/day value from a time zone specified by the user.

ROUND(x [, unit]);
Rounds x.

SYSDATE();
Returns the current datetime.

TRUNC(x [, unit]);
Truncates x.

*/


-- ---------------------------------------------------- --
-- ---------------------SEQUENCES------------------- --
-- ---------------------------------------------------- --	

/*
A sequence is a list of integers in which their orders are important. 
For example, the (1,2,3,4,5) and (5,4,3,2,1) are totally different sequences even though they have the same members.
*/
	
CREATE SEQUENCE item_seq;

-- A sequence is a list of integers in which their orders are important. For example, the (1,2,3,4,5) and (5,4,3,2,1) are totally different sequences even though they have
-- the same members.


SELECT item_seq.NEXTVAL
FROM b;


SELECT item_seq.NEXTVAL
FROM   dual
CONNECT BY level <= 5;-- The following statement uses the item_seq sequence repeatedly in an SQL statement:


/*
This example uses the item_seq sequence in the INSERT statements to populate values for the item_id column of the items table:
*/

INSERT INTO items(item_id) VALUES(item_seq.NEXTVAL);
INSERT INTO items(item_id) VALUES(item_seq.NEXTVAL);
 
COMMIT;



-- The following example uses the ALTER SEQUENCE to set the maximum value for the item_seq to 100:

ALTER SEQUENCE item_seq MAXVALUE 100;

-- To remove an existing sequence from the database, you use the DROP SEQUENCE statement. 
DROP SEQUENCE item_seq;


-- Oracle provides the CREATE SEQUENCE system privilege to allow you to create, alter, and drop sequences.
GRANT CREATE SEQUENCE 
TO user_name;

GRANT CREATE ANY SEQUENCE, 
    ALTER ANY SEQUENCE, 
    DROP ANY SEQUENCE, 
    SELECT ANY SEQUENCE 
TO user_name;



-- ---------------------------------------------------- --
-- ---------------------GOTO--------------------------- --
-- ---------------------------------------------------- --	

/*
The GOTO statement allows you to transfer control to a labeled block or statement. The following illustrates the syntax of the GOTO statement:
*/
BEGIN
  GOTO second_message;
 
  <<first_message>>
  DBMS_OUTPUT.PUT_LINE( 'Hello' );
  GOTO the_end;
 
  <<second_message>>
  DBMS_OUTPUT.PUT_LINE( 'PL/SQL GOTO Demo' );
  GOTO first_message;
 
  <<the_end>>
  DBMS_OUTPUT.PUT_LINE( 'and good bye...' );
 
END;

-- ---------------------------------------------------- --
-- ---------------------EXCEPTIONS--------------------- --
-- ---------------------------------------------------- --	

/*
PL/SQL treats all errors that occur in an anonymous block, procedure, or function as exceptions. 
The exceptions can have different causes such as coding mistakes, bugs, even hardware failures.
*/

DECLARE
    l_name customers.name%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    -- get the customer
    SELECT name INTO l_name
    FROM customers
    WHERE customer_id <= l_customer_id;
    
    -- show the customer name   
    dbms_output.put_line('Customer name is ' || l_name);
 
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Customer ' || l_customer_id ||  ' does not exist');
END;



-- TYPES


DECLARE
    l_name customers.NAME%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    -- get the customer
    SELECT NAME INTO l_name
    FROM customers
    WHERE customer_id > l_customer_id;
    
    -- show the customer name   
    dbms_output.put_line('Customer name is ' || l_name);
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Customer ' || l_customer_id ||  ' does not exist');
        WHEN TOO_MANY_ROWS THEN
            dbms_output.put_line('The database returns more than one customer');    
END;


-- ---------------------------------------------------- --
-- ----------------AGGREGATE_FUNCTIONS----------------- --
-- ---------------------------------------------------- --	
-- REGR_COUNT() functions never return null, but either a number or zero (0). 
/*
APPROX_COUNT_DISTINCT	

AVG	Return the average of values of a set

COLLECT	

CORR	

CORR_*	

COUNT	Return the number of values in a set or number of rows in a table

COVAR_POP	

COVAR_SAMP	

CUME_DIST	

DENSE_RANK	

FIRST	

GROUP_ID	

GROUPING	

GROUPING_ID	

LAST	

LISTAGG	Aggregate strings from multiple rows into a single string by concatenating them

MAX	Return the maximum value in a set of values

MEDIAN	

MIN	Return the minimum value in a set of values

PERCENT_RANK	

PERCENTILE_CONT	

PERCENTILE_DISC	

RANK	

REGR_ (Linear Regression) Functions	

STATS_BINOMIAL_TEST	

STATS_CROSSTAB	

STATS_F_TEST	

STATS_KS_TEST	

STATS_MODE	

STATS_MW_TEST	

STATS_ONE_WAY_ANOVA	

STATS_T_TEST_*	

STATS_WSR_TEST	

STDDEV	

STDDEV_POP	

STDDEV_SAMP	

SUM	Returns the sum of values in a set of values

SYS_OP_ZONE_ID	

SYS_XMLAGG	

VAR_POP	

VAR_SAMP	

VARIANCE	

XMLAGG	
*/

-- ---------------------------------------------------- --
-- -------------ANALYTIC_FUNCTIONS--------------------- --
-- ---------------------------------------------------- --	

/*
CUME_DIST	Calculate the cumulative distribution of a value in a set of values

DENSE_RANK	Calculate the rank of a row in an ordered set of rows with no gaps in rank values.

FIRST_VALUE	Get the value of the first row in a specified window frame.

LAG	Provide access to a row at a given physical offset that comes before the current row without using a self-join.

LAST_VALUE	Get the value of the last row in a specified window frame.

LEAD	Provide access to a row at a given physical offset that follows the current row without using a self-join.

NTH_VALUE	Get the Nth value in a set of values.

NTILE	Divide an ordered set of rows into a number of buckets and assign an appropriate bucket number to each row.

PERCENT_RANK	Calculate the percent rank of a value in a set of values.

RANK	Calculate the rank of a value in a set of values

ROW_NUMBER	Assign a unique sequential integer starting from 1 to each row in a partition or in the whole result
*/


-- ---------------------------------------------------- --
-- -------------------STRING_FUNCTIONS----------------- --
-- ---------------------------------------------------- --	
/*
ASCII	ASCII(‘A’)	65	Returns an ASCII code value of a character.

CHR	CHR(’65’)	‘A’	Converts a numeric value to its corresponding ASCII character.

CONCAT	CONCAT(‘A’,’BC’)	‘ABC’	Concatenate two strings and return the combined string.

CONVERT	CONVERT( ‘Ä Ê Í’, ‘US7ASCII’, ‘WE8ISO8859P1’ )	 ‘A E I’	Convert a character string from one character set to another.

DUMP	DUMP(‘A’)	Typ=96 Len=1: 65	Return a string value (VARCHAR2) that includes the datatype code, length measured in bytes, and internal representation of a specified expression.

 INITCAP	 INITCAP(‘hi  there’)	‘Hi There’	Converts the first character in each word in a specified string to uppercase and the rest to lowercase.

 INSTR	INSTR( ‘This is a playlist’, ‘is’)	3	Search for a substring and return the location of the substring in a string

 LENGTH	LENGTH(‘ABC’)	3	Return the number of characters (or length) of a specified string

 LOWER	LOWER(‘Abc’)	‘abc’	Return a string with all characters converted to lowercase.

 LPAD	LPAD(‘ABC’,5,’*’)	‘**ABC’	Return a string that is left-padded with the specified characters to a certain length.

 LTRIM	LTRIM(‘ ABC ‘)	‘ABC  ‘	Remove spaces or other specified characters in a set from the left end of a string.

 REGEXP_COUNT	REGEXP_COUNT(‘1 2 3 abc’,’\d’)	3	Return the number of times a pattern occurs in a string.

 REGEXP_INSTR	REGEXP_INSTR( ‘Y2K problem’,’\d+’)	2	Return the position of a pattern in a string.

 REGEXP_LIKE	REGEXP_LIKE( ‘Year of 2017′,’\d+’ )	true	Match a string based on a regular expression pattern.

 REGEXP_REPLACE	REGEXP_REPLACE( ‘Year of 2017′,’\d+’, ‘Dragon’ )	 ‘Year of Dragon’	Replace substring in a string by a new substring using a regular expression.

 REGEXP_SUBSTR	REGEXP_SUBSTR( ‘Number 10’, ‘\d+’ )	 10	Extract substrings from a string using a pattern of a regular expression.

 REPLACE	REPLACE(‘JACK AND JOND’,’J’,’BL’);	 ‘BLACK AND BLOND’	Replace all occurrences of a substring by another substring in a string.

 RPAD	 RPAD(‘ABC’,5,’*’)	‘ABC**’	Return a string that is right-padded with the specified characters to a certain length.

 RTRIM	RTRIM(‘ ABC ‘)	‘ ABC’	Remove all spaces or specified character in a set from the right end of a string.

 SOUNDEX	SOUNDEX(‘sea’)	‘S000’	Return a phonetic representation of a specified string.

 SUBSTR	SUBSTR(‘Oracle Substring’, 1, 6 )	‘Oracle’	Extract a substring from a string.

 TRANSLATE	 TRANSLATE(‘12345’, ‘143’, ‘bx’)	 ‘b2x5’	Replace all occurrences of characters by other characters in a string.

 TRIM	TRIM(‘ ABC ‘)	‘ABC’	Remove the space character or other specified characters either from the start or end of a string.

 UPPER	UPPER(‘Abc’)	‘ABC’	Convert all characters in a specified string to uppercase.
*/


-- ---------------------------------------------------- --
-- ---------COMPARISION_FUNCTIONS-------------- --
-- ---------------------------------------------------- --	
/*
COALESCE – show you how to substitute null with a more meaningful alternative.

DECODE – learn how to add if-then-else logic to a SQL query.

NVL – return the first argument if it is not null, otherwise, returns the second argument.

NVL2 – show you how to substitute a null value with various options.

NULLIF – return a null if the first argument equals the second one, otherwise, returns the first argument.

*/
