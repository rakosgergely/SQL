-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE heinz_kettler_baan_final_v2;

--
-- Drop procedure `TABLE_ROW_COUNTER_ACCORDING_TO_CLIENT_AND_YEAR`
--
DROP PROCEDURE IF EXISTS TABLE_ROW_COUNTER_ACCORDING_TO_CLIENT_AND_YEAR;

--
-- Set default database
--
USE heinz_kettler_baan_final_v2;

DELIMITER $$

--
-- Create procedure `TABLE_ROW_COUNTER_ACCORDING_TO_CLIENT_AND_YEAR`
--
CREATE DEFINER = 'gra'@'%'
PROCEDURE TABLE_ROW_COUNTER_ACCORDING_TO_CLIENT_AND_YEAR (IN_START varchar(10))
BEGIN
  -- DECALRE TABLE SCHEMA
  DECLARE CURRENT_SCHEMA varchar(100);
  -- DECLAER COUNTER FOR LOOP
  DECLARE COUNTER int;
  DECLARE COUNTER_380 int;
  DECLARE COUNTER_600 int;
  DECLARE COUNTER_610 int;
  DECLARE COUNTER_740 int;
  -- DECLARE CURRENT TABLE NAME
  DECLARE RELEVANT_TABLES_NAME varchar(300);
  -- DECLARE CURRENT TABLE COUNT
  DECLARE RELEVANT_TABLES_NAME_COUNT int;
  -- DECLARE FREQUETNLY DATE COLUMN
  DECLARE CURRENT_FREQUENTLY varchar(10);
  -- DECLARE PERIOD_FROM AND PERIOD_TO
  DECLARE PERIOD_FROM varchar(4);
  DECLARE PERIOD_TO varchar(4);
  -- IS EXSIST
  DECLARE IS_EX boolean;
    
  SET CURRENT_SCHEMA = 'heinz_kettler_baan_final_v2';
  SET IS_EX=FALSE;


  -- CREATE TABLE FOR STORED DATA
   
  DROP TABLE IF EXISTS heinz_kettler_baan_viewbuilding.DATA_FROM_DB;
  CREATE TABLE heinz_kettler_baan_viewbuilding.DATA_FROM_DB (
    _ROW_NO_ bigint AUTO_INCREMENT PRIMARY KEY,
    TABLE_SCHEMA varchar(100),
    TABLE_NAME varchar(100),
    MANDANT varchar(10),
    COLUMN_NAME varchar(10),
    PERIOD_FROM varchar(4),
    PREIOD_TO varchar(4),
    TABLE_COUNT int
  )
  ;


  -- TABLES WHERE MANDT=380
  DROP TABLE IF EXISTS heinz_kettler_baan_viewbuilding.`CLIENT_380`;
  CREATE TABLE heinz_kettler_baan_viewbuilding.`CLIENT_380`
  ENGINE = MYISAM
  SELECT
    TABLE_NAME
  FROM information_schema.tables
  WHERE RIGHT(TABLE_NAME, 3) LIKE '380'
  AND TABLE_SCHEMA = 'heinz_kettler_baan_final_v2';

  -- TABLES WHERE MANDT=600
  DROP TABLE IF EXISTS heinz_kettler_baan_viewbuilding.`CLIENT_600`;
  CREATE TABLE heinz_kettler_baan_viewbuilding.`CLIENT_600`
  ENGINE = MYISAM
  SELECT
    TABLE_NAME
  FROM information_schema.tables
  WHERE RIGHT(TABLE_NAME, 3) LIKE '600'
  AND TABLE_SCHEMA = 'heinz_kettler_baan_final_v2';

  -- TABLES WHERE MANDT=610
  DROP TABLE IF EXISTS heinz_kettler_baan_viewbuilding.`CLIENT_610`;
  CREATE TABLE heinz_kettler_baan_viewbuilding.`CLIENT_610`
  ENGINE = MYISAM
  SELECT
    TABLE_NAME
  FROM information_schema.tables
  WHERE RIGHT(TABLE_NAME, 3) LIKE '610'
  AND TABLE_SCHEMA = 'heinz_kettler_baan_final_v2';

  -- TABLES WHERE MANDT=740
  DROP TABLE IF EXISTS heinz_kettler_baan_viewbuilding.`CLIENT_740`;
  CREATE TABLE heinz_kettler_baan_viewbuilding.`CLIENT_740`
  ENGINE = MYISAM
  SELECT
    TABLE_NAME
  FROM information_schema.tables
  WHERE RIGHT(TABLE_NAME, 3) LIKE '740'
  AND TABLE_SCHEMA = 'heinz_kettler_baan_final_v2';


  -- ALL MANDANT TABLES IN ONE ONE
  DROP TABLE IF EXISTS heinz_kettler_baan_viewbuilding.ALL_CLIENT;
  CREATE TABLE heinz_kettler_baan_viewbuilding.ALL_CLIENT
  SELECT
    *
  FROM heinz_kettler_baan_viewbuilding.`CLIENT_380`
  UNION ALL
  SELECT
    *
  FROM heinz_kettler_baan_viewbuilding.`CLIENT_600`
  UNION ALL
  SELECT
    *
  FROM heinz_kettler_baan_viewbuilding.`CLIENT_610`
  UNION ALL
  SELECT
    *
  FROM heinz_kettler_baan_viewbuilding.`CLIENT_740`;



  -- CREATE TABLE FREQUETNLY COLUMNS DATE COLUMNS WITH TABLE NAMES
  -- TABLES WHERE MANDT=380
  DROP TABLE IF EXISTS heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_380`;
  CREATE TABLE heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_380`
  ENGINE = MYISAM
  SELECT
    B.TABLE_NAME,
    COLUMN_NAME 
  FROM information_schema.columns AS A
  JOIN information_schema.TABLES AS B ON A.TABLE_SCHEMA=B.TABLE_SCHEMA AND A.TABLE_NAME=B.TABLE_NAME
  WHERE A.TABLE_SCHEMA = 'heinz_kettler_baan_final_v2'
  AND DATA_TYPE = 'date' AND RIGHT(B.TABLE_NAME, 3) LIKE '380'
  GROUP BY TABLE_NAME

  ;


  -- TABLES WHERE MANDT=600
  DROP TABLE IF EXISTS heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_600`;
  CREATE TABLE heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_600`
  ENGINE = MYISAM
  SELECT
    B.TABLE_NAME,
    COLUMN_NAME 
  FROM information_schema.columns AS A
  JOIN information_schema.TABLES AS B ON A.TABLE_SCHEMA=B.TABLE_SCHEMA AND A.TABLE_NAME=B.TABLE_NAME
  WHERE A.TABLE_SCHEMA = 'heinz_kettler_baan_final_v2'
  AND DATA_TYPE = 'date' AND RIGHT(B.TABLE_NAME, 3) LIKE '600'
  GROUP BY TABLE_NAME
  ;


    -- TABLES WHERE MANDT=640
  DROP TABLE IF EXISTS heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_610`;
  CREATE TABLE heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_610`
  ENGINE = MYISAM
  SELECT
    B.TABLE_NAME,
    COLUMN_NAME 
  FROM information_schema.columns AS A
  JOIN information_schema.TABLES AS B ON A.TABLE_SCHEMA=B.TABLE_SCHEMA AND A.TABLE_NAME=B.TABLE_NAME
  WHERE A.TABLE_SCHEMA = 'heinz_kettler_baan_final_v2'
  AND DATA_TYPE = 'date' AND RIGHT(B.TABLE_NAME, 3) LIKE '610'
  GROUP BY TABLE_NAME
  ;

  -- TABLES WHERE MANDT=740
  DROP TABLE IF EXISTS heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_740`;
  CREATE TABLE heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_740`
  ENGINE = MYISAM
  SELECT
    B.TABLE_NAME,
    COLUMN_NAME 
  FROM information_schema.columns AS A
  JOIN information_schema.TABLES AS B ON A.TABLE_SCHEMA=B.TABLE_SCHEMA AND A.TABLE_NAME=B.TABLE_NAME
  WHERE A.TABLE_SCHEMA = 'heinz_kettler_baan_final_v2'
  AND DATA_TYPE = 'date' AND RIGHT(B.TABLE_NAME, 3) LIKE '740'
  GROUP BY TABLE_NAME
  ;

  -- WE HAVE TO ADDING PRIMARY KEY COLUMN
  ALTER TABLE heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_380` ADD COLUMN _ROW_NO_ bigint AUTO_INCREMENT PRIMARY KEY;
  ALTER TABLE heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_600` ADD COLUMN _ROW_NO_ bigint AUTO_INCREMENT PRIMARY KEY;
  ALTER TABLE heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_610` ADD COLUMN _ROW_NO_ bigint AUTO_INCREMENT PRIMARY KEY;
  ALTER TABLE heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_740` ADD COLUMN _ROW_NO_ bigint AUTO_INCREMENT PRIMARY KEY;
  ALTER TABLE heinz_kettler_baan_viewbuilding.ALL_CLIENT ADD COLUMN _ROW_NO_ bigint AUTO_INCREMENT PRIMARY KEY;


-- ---------------------------------------------------------------------------------
--  ------------------------------------380 LOOP------------------------------------
-- ---------------------------------------------------------------------------------
  SET `COUNTER_380` =(SELECT
      COUNT(*)
    FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_380`);
  -- SET THE COUNTER OF THE LOOP
  SET COUNTER = 1;

  WHILE COUNTER < `COUNTER_380` DO


    -- SET PERIOD_FROM PERIOD_TO IN MANDANT 380
    SET PERIOD_FROM = '1997';
    SET PERIOD_TO = '2016';
    -- SELECT TABLE IN LOOP
    SET RELEVANT_TABLES_NAME = (SELECT
        TABLE_NAME
      FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_380`
      WHERE _ROW_NO_ = COUNTER);


    -- WE CHECK THE FIVE MOST POPULAR DATA COLUMN ARE EXSIST IN THE TABLE

    -- SET THE MOST FREQUETLY DATA COLUMN
  -- -----------------------------------------------------------------------------------------------
-- -------------------------- FIRST FREQUETNLY DATE COLUMN --------------------------------------
-- -----------------------------------------------------------------------------------------------  
  SET CURRENT_FREQUENTLY = (SELECT
        COLUMN_NAME
      FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_380` WHERE _ROW_NO_=COUNTER
      );

    -- QUERY FOR INSERT
                -- FIRST FREQUETNLY DATE COLUMN
                SET @INSERTING = CONCAT('INSERT INTO heinz_kettler_baan_viewbuilding.DATA_FROM_DB(TABLE_SCHEMA,TABLE_NAME,MANDANT,COLUMN_NAME,PERIOD_FROM,PREIOD_TO,TABLE_COUNT)SELECT ','"',CURRENT_SCHEMA,'"',',','"', RELEVANT_TABLES_NAME,'"', ',', '380,','"',CURRENT_FREQUENTLY,'"',',', PERIOD_FROM, ',', PERIOD_TO, ',COUNT(*) FROM ', CURRENT_SCHEMA, '.', RELEVANT_TABLES_NAME,' WHERE YEAR(',CURRENT_FREQUENTLY,') BETWEEN ',PERIOD_FROM,' AND ',PERIOD_TO,' GROUP BY ', CURRENT_SCHEMA, ',', RELEVANT_TABLES_NAME, ';');
          

                -- DEBUG TABLE
                DROP TABLE IF EXISTS heinz_kettler_baan_viewbuilding.QUERIES;
                CREATE TABLE IF NOT EXISTS heinz_kettler_baan_viewbuilding.QUERIES
                 SELECT @INSERTING,CURRENT_SCHEMA,RELEVANT_TABLES_NAME,CURRENT_FREQUENTLY,PERIOD_FROM,PERIOD_TO;

                PREPARE res_stmt FROM @INSERTING;
          
                EXECUTE res_stmt;
                SET IS_EX=TRUE;
      
    



    SET COUNTER = COUNTER + 1;
  END WHILE;


-- ---------------------------------------------------------------------------------
--  ------------------------------------600 LOOP------------------------------------
-- ---------------------------------------------------------------------------------
 SET `COUNTER_600` =(SELECT
      COUNT(*)
    FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_600`);
  -- SET THE COUNTER OF THE LOOP
  SET COUNTER = 1;

  WHILE COUNTER < `COUNTER_600` DO


    -- SET PERIOD_FROM PERIOD_TO IN MANDANT 600
    SET PERIOD_FROM = '2016';
    SET PERIOD_TO = '2018';
    -- SELECT TABLE IN LOOP
    SET RELEVANT_TABLES_NAME = (SELECT
        TABLE_NAME
      FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_600`
      WHERE _ROW_NO_ = COUNTER);


    -- WE CHECK THE FIVE MOST POPULAR DATA COLUMN ARE EXSIST IN THE TABLE

    -- SET THE MOST FREQUETLY DATA COLUMN
  -- -----------------------------------------------------------------------------------------------
-- -------------------------- FIRST FREQUETNLY DATE COLUMN --------------------------------------
-- -----------------------------------------------------------------------------------------------  
  SET CURRENT_FREQUENTLY = (SELECT
        COLUMN_NAME
      FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_600` WHERE _ROW_NO_=COUNTER
      );

    -- QUERY FOR INSERT
                -- FIRST FREQUETNLY DATE COLUMN
                SET @INSERTING = CONCAT('INSERT INTO heinz_kettler_baan_viewbuilding.DATA_FROM_DB(TABLE_SCHEMA,TABLE_NAME,MANDANT,COLUMN_NAME,PERIOD_FROM,PREIOD_TO,TABLE_COUNT)SELECT ','"',CURRENT_SCHEMA,'"',',','"', RELEVANT_TABLES_NAME,'"', ',', '600,','"',CURRENT_FREQUENTLY,'"',',', PERIOD_FROM, ',', PERIOD_TO, ',COUNT(*) FROM ', CURRENT_SCHEMA, '.', RELEVANT_TABLES_NAME,' WHERE YEAR(',CURRENT_FREQUENTLY,') BETWEEN ',PERIOD_FROM,' AND ',PERIOD_TO,' GROUP BY ', CURRENT_SCHEMA, ',', RELEVANT_TABLES_NAME, ';');
          

                PREPARE res_stmt FROM @INSERTING;
          
                EXECUTE res_stmt;
                SET IS_EX=TRUE;
      
    



    SET COUNTER = COUNTER + 1;
  END WHILE;





-- ---------------------------------------------------------------------------------
--  ------------------------------------610 LOOP------------------------------------
-- ---------------------------------------------------------------------------------
 SET `COUNTER_610` =(SELECT
      COUNT(*)
    FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_610`);
  -- SET THE COUNTER OF THE LOOP
  SET COUNTER = 1;

  WHILE COUNTER < `COUNTER_610` DO


    -- SET PERIOD_FROM PERIOD_TO IN MANDANT 380
    SET PERIOD_FROM = '1996';
    SET PERIOD_TO = '2020';
    -- SELECT TABLE IN LOOP
    SET RELEVANT_TABLES_NAME = (SELECT
        TABLE_NAME
      FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_610`
      WHERE _ROW_NO_ = COUNTER);


    -- WE CHECK THE FIVE MOST POPULAR DATA COLUMN ARE EXSIST IN THE TABLE

    -- SET THE MOST FREQUETLY DATA COLUMN
  -- -----------------------------------------------------------------------------------------------
-- -------------------------- FIRST FREQUETNLY DATE COLUMN --------------------------------------
-- -----------------------------------------------------------------------------------------------  
  SET CURRENT_FREQUENTLY = (SELECT
        COLUMN_NAME
      FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_610` WHERE _ROW_NO_=COUNTER
      );

    -- QUERY FOR INSERT
                -- FIRST FREQUETNLY DATE COLUMN
                SET @INSERTING = CONCAT('INSERT INTO heinz_kettler_baan_viewbuilding.DATA_FROM_DB(TABLE_SCHEMA,TABLE_NAME,MANDANT,COLUMN_NAME,PERIOD_FROM,PREIOD_TO,TABLE_COUNT)SELECT ','"',CURRENT_SCHEMA,'"',',','"', RELEVANT_TABLES_NAME,'"', ',', '610,','"',CURRENT_FREQUENTLY,'"',',', PERIOD_FROM, ',', PERIOD_TO, ',COUNT(*) FROM ', CURRENT_SCHEMA, '.', RELEVANT_TABLES_NAME,' WHERE YEAR(',CURRENT_FREQUENTLY,') BETWEEN ',PERIOD_FROM,' AND ',PERIOD_TO,' GROUP BY ', CURRENT_SCHEMA, ',', RELEVANT_TABLES_NAME, ';');
          

                PREPARE res_stmt FROM @INSERTING;
          
                EXECUTE res_stmt;
                SET IS_EX=TRUE;
      
    



    SET COUNTER = COUNTER + 1;
  END WHILE;


  
-- ---------------------------------------------------------------------------------
--  ------------------------------------600 LOOP------------------------------------
-- ---------------------------------------------------------------------------------
 SET `COUNTER_600` =(SELECT
      COUNT(*)
    FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_600`);
  -- SET THE COUNTER OF THE LOOP
  SET COUNTER = 1;

  WHILE COUNTER < `COUNTER_600` DO


    -- SET PERIOD_FROM PERIOD_TO IN MANDANT 600
    SET PERIOD_FROM = '2016';
    SET PERIOD_TO = '2018';
    -- SELECT TABLE IN LOOP
    SET RELEVANT_TABLES_NAME = (SELECT
        TABLE_NAME
      FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_600`
      WHERE _ROW_NO_ = COUNTER);


    -- WE CHECK THE FIVE MOST POPULAR DATA COLUMN ARE EXSIST IN THE TABLE

    -- SET THE MOST FREQUETLY DATA COLUMN
  -- -----------------------------------------------------------------------------------------------
-- -------------------------- FIRST FREQUETNLY DATE COLUMN --------------------------------------
-- -----------------------------------------------------------------------------------------------  
  SET CURRENT_FREQUENTLY = (SELECT
        COLUMN_NAME
      FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_600` WHERE _ROW_NO_=COUNTER
      );

    -- QUERY FOR INSERT
                -- FIRST FREQUETNLY DATE COLUMN
                SET @INSERTING = CONCAT('INSERT INTO heinz_kettler_baan_viewbuilding.DATA_FROM_DB(TABLE_SCHEMA,TABLE_NAME,MANDANT,COLUMN_NAME,PERIOD_FROM,PREIOD_TO,TABLE_COUNT)SELECT ','"',CURRENT_SCHEMA,'"',',','"', RELEVANT_TABLES_NAME,'"', ',', '600,','"',CURRENT_FREQUENTLY,'"',',', PERIOD_FROM, ',', PERIOD_TO, ',COUNT(*) FROM ', CURRENT_SCHEMA, '.', RELEVANT_TABLES_NAME,' WHERE YEAR(',CURRENT_FREQUENTLY,') BETWEEN ',PERIOD_FROM,' AND ',PERIOD_TO,' GROUP BY ', CURRENT_SCHEMA, ',', RELEVANT_TABLES_NAME, ';');
          

                PREPARE res_stmt FROM @INSERTING;
          
                EXECUTE res_stmt;
                SET IS_EX=TRUE;
      
    



    SET COUNTER = COUNTER + 1;
  END WHILE;





-- ---------------------------------------------------------------------------------
--  ------------------------------------600 LOOP------------------------------------
-- ---------------------------------------------------------------------------------
 SET `COUNTER_600` =(SELECT
      COUNT(*)
    FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_600`);
  -- SET THE COUNTER OF THE LOOP
  SET COUNTER = 1;

  WHILE COUNTER < `COUNTER_600` DO


    -- SET PERIOD_FROM PERIOD_TO IN MANDANT 600
    SET PERIOD_FROM = '2016';
    SET PERIOD_TO = '2018';
    -- SELECT TABLE IN LOOP
    SET RELEVANT_TABLES_NAME = (SELECT
        TABLE_NAME
      FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_600`
      WHERE _ROW_NO_ = COUNTER);


    -- WE CHECK THE FIVE MOST POPULAR DATA COLUMN ARE EXSIST IN THE TABLE

    -- SET THE MOST FREQUETLY DATA COLUMN
  -- -----------------------------------------------------------------------------------------------
-- -------------------------- FIRST FREQUETNLY DATE COLUMN --------------------------------------
-- -----------------------------------------------------------------------------------------------  
  SET CURRENT_FREQUENTLY = (SELECT
        COLUMN_NAME
      FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_600` WHERE _ROW_NO_=COUNTER
      );

    -- QUERY FOR INSERT
                -- FIRST FREQUETNLY DATE COLUMN
                SET @INSERTING = CONCAT('INSERT INTO heinz_kettler_baan_viewbuilding.DATA_FROM_DB(TABLE_SCHEMA,TABLE_NAME,MANDANT,COLUMN_NAME,PERIOD_FROM,PREIOD_TO,TABLE_COUNT)SELECT ','"',CURRENT_SCHEMA,'"',',','"', RELEVANT_TABLES_NAME,'"', ',', '600,','"',CURRENT_FREQUENTLY,'"',',', PERIOD_FROM, ',', PERIOD_TO, ',COUNT(*) FROM ', CURRENT_SCHEMA, '.', RELEVANT_TABLES_NAME,' WHERE YEAR(',CURRENT_FREQUENTLY,') BETWEEN ',PERIOD_FROM,' AND ',PERIOD_TO,' GROUP BY ', CURRENT_SCHEMA, ',', RELEVANT_TABLES_NAME, ';');
          

                PREPARE res_stmt FROM @INSERTING;
          
                EXECUTE res_stmt;
                SET IS_EX=TRUE;
      
    



    SET COUNTER = COUNTER + 1;
  END WHILE;


-- ---------------------------------------------------------------------------------
--  ------------------------------------740 LOOP------------------------------------
-- ---------------------------------------------------------------------------------
 SET `COUNTER_740` =(SELECT
      COUNT(*)
    FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_740`);
  -- SET THE COUNTER OF THE LOOP
  SET COUNTER = 1;

  WHILE COUNTER < `COUNTER_740` DO


    -- SET PERIOD_FROM PERIOD_TO IN MANDANT 600
    SET PERIOD_FROM = '2003';
    SET PERIOD_TO = '2018';
    -- SELECT TABLE IN LOOP
    SET RELEVANT_TABLES_NAME = (SELECT
        TABLE_NAME
      FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_740`
      WHERE _ROW_NO_ = COUNTER);


    -- WE CHECK THE FIVE MOST POPULAR DATA COLUMN ARE EXSIST IN THE TABLE

    -- SET THE MOST FREQUETLY DATA COLUMN
  -- -----------------------------------------------------------------------------------------------
-- -------------------------- FIRST FREQUETNLY DATE COLUMN --------------------------------------
-- -----------------------------------------------------------------------------------------------  
  SET CURRENT_FREQUENTLY = (SELECT
        COLUMN_NAME
      FROM heinz_kettler_baan_viewbuilding.`FREQUENTLY_DATE_COLUMNS_740` WHERE _ROW_NO_=COUNTER
      );

    -- QUERY FOR INSERT
                -- FIRST FREQUETNLY DATE COLUMN
                SET @INSERTING = CONCAT('INSERT INTO heinz_kettler_baan_viewbuilding.DATA_FROM_DB(TABLE_SCHEMA,TABLE_NAME,MANDANT,COLUMN_NAME,PERIOD_FROM,PREIOD_TO,TABLE_COUNT)SELECT ','"',CURRENT_SCHEMA,'"',',','"', RELEVANT_TABLES_NAME,'"', ',', '740,','"',CURRENT_FREQUENTLY,'"',',', PERIOD_FROM, ',', PERIOD_TO, ',COUNT(*) FROM ', CURRENT_SCHEMA, '.', RELEVANT_TABLES_NAME,' WHERE YEAR(',CURRENT_FREQUENTLY,') BETWEEN ',PERIOD_FROM,' AND ',PERIOD_TO,' GROUP BY ', CURRENT_SCHEMA, ',', RELEVANT_TABLES_NAME, ';');
          

                PREPARE res_stmt FROM @INSERTING;
          
                EXECUTE res_stmt;
                SET IS_EX=TRUE;
      
    



    SET COUNTER = COUNTER + 1;
  END WHILE;










END
$$

DELIMITER ;