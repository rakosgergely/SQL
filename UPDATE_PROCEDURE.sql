DELIMITER $$
DROP PROCEDURE IF EXISTS carl_zeiss_cas_final.UPDATE_COLUMNS_PROC$$
CREATE PROCEDURE carl_zeiss_cas_final.UPDATE_COLUMNS_PROC(IN_COLUMN varchar(60),IN_SCHEMA varchar(80),IN_TABLE varchar(80))
BEGIN

DECLARE LOOP_COUNTER int DEFAULT 3;

DECLARE CURRENT_TABLE_COUNTER int DEFAULT 1;

DECLARE CURRENT_COLUMN varchar(80);

IF(IN_COLUMN='ALL')THEN
        
  DROP TABLE IF EXISTS carl_zeiss_cas_viewbuilding.CURRENT_TABLE_COLUMNS;
  CREATE TABLE carl_zeiss_cas_viewbuilding.CURRENT_TABLE_COLUMNS
  SELECT COLUMN_NAME,TABLE_NAME FROM information_schema.COLUMNS WHERE TABLE_NAME=IN_TABLE AND TABLE_SCHEMA=IN_SCHEMA AND DATA_TYPE LIKE'VARCHAR%';

  ALTER TABLE carl_zeiss_cas_viewbuilding.CURRENT_TABLE_COLUMNS ADD COLUMN _row_no_ bigint AUTO_INCREMENT PRIMARY KEY;

  SET CURRENT_TABLE_COUNTER=(SELECT MAX(_ROW_NO_) FROM carl_zeiss_cas_viewbuilding.CURRENT_TABLE_COLUMNS);
          

            WHILE (LOOP_COUNTER<=CURRENT_TABLE_COUNTER) DO
                  
                  SET CURRENT_COLUMN=(SELECT COLUMN_NAME FROM carl_zeiss_cas_viewbuilding.CURRENT_TABLE_COLUMNS WHERE _ROW_NO_=LOOP_COUNTER); 

                  SET @UPDATE=CONCAT('UPDATE ','`',IN_SCHEMA,'`','.','`',IN_TABLE,'`',' SET ','`',CURRENT_COLUMN,'`','=if(','`',CURRENT_COLUMN,'`','="NULL",NULL,','`',CURRENT_COLUMN,'`',');');

                  PREPARE res_stmt FROM @UPDATE;
            
                  EXECUTE res_stmt;
                  
                  SET LOOP_COUNTER=LOOP_COUNTER+1;

          
            END WHILE;
ELSE
                 
               

               SET @UPDATE=CONCAT('UPDATE ','`',IN_SCHEMA,'`','.','`',IN_TABLE,'`',' SET ','`',IN_COLUMN,'`','=if(','`',IN_COLUMN,'`','="NULL",NULL,','`',IN_COLUMN,'`',');');

              /*
               DROP TABLE IF EXISTS UPD;
               CREATE TABLE UPD SELECT CONCAT('UPDATE ','`',IN_SCHEMA,'`','.','`',IN_TABLE,'`',' SET ','`',IN_COLUMN,'`','=if(','`',IN_COLUMN,'`','="NULL",NULL,','`',IN_COLUMN,'`',');') AS INU;
              */
                   
               PREPARE res_stmt FROM @UPDATE;
            
               EXECUTE res_stmt;
             
END IF;
END $$
DELIMITER;