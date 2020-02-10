-- Tábla 


CREATE DEFINER=`rwe`@`%` PROCEDURE `training_tab_rwe`(
  )
    SQL SECURITY INVOKER
BEGIN


	DECLARE v_row	bigint;
  DECLARE done int;
  DECLARE cur CURSOR FOR SELECT _row_no_ FROM nord_lb_kondor_viewbuilding.tabla;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
    SET done = 0;
DROP TABLE IF EXISTS nord_lb_kondor_viewbuilding.tabla;
CREATE TABLE IF NOT EXISTS nord_lb_kondor_viewbuilding.tabla
  SELECT a.ev,b.per,10000000.99 AS val,c.bukrs,1 as mandt,BINARY('D') AS lang_key
  FROM (SELECT 2000 AS ev
  UNION SELECT 2001
  UNION SELECT 2002
  UNION SELECT 2003
  UNION SELECT 2004
  UNION SELECT 2005
  UNION SELECT 2006
  UNION SELECT 2007
  UNION SELECT 2008
  UNION SELECT 2009
  UNION SELECT 2010
  UNION SELECT 2011
  UNION SELECT 2012
  UNION SELECT 2013
  UNION SELECT 2014
  UNION SELECT 2015) a
  JOIN (SELECT 1 AS per
  UNION SELECT 2
  UNION SELECT 3
  UNION SELECT 4
  UNION SELECT 5
  UNION SELECT 6
  UNION SELECT 7
  UNION SELECT 8
  UNION SELECT 9
  UNION SELECT 10
  UNION SELECT 11
  UNION SELECT 12
  UNION SELECT 13
  UNION SELECT 14
  UNION SELECT 15
  UNION SELECT 16) b ON TRUE
  JOIN (SELECT 'A' AS bukrs UNION SELECT 'B') c ON TRUE
  ;

ALTER TABLE nord_lb_kondor_viewbuilding.tabla add COLUMN _row_no_ bigint NOT NULL AUTO_INCREMENT PRIMARY KEY;

open cur;
    tabLoop: loop
        fetch cur into 
     v_row;
        if done = 1 then leave tabLoop; end if;

 UPDATE nord_lb_kondor_viewbuilding.tabla SET val=ROUND(RAND()*10000000,2);

       end loop tabLoop;
    close cur;	
END


-- Procedura


CREATE DEFINER=`rwe`@`%` PROCEDURE `training_proc_rwe`(in_ev int,in_perfrom int,in_perto int,in_buk varchar(1),in_mandt int,in_lang binary
  )
    SQL SECURITY INVOKER
BEGIN

  IF(in_perto<in_perfrom) THEN 
select 'A periodokat átnézném a helyedben...';
  else
	SELECT	SUM(val) AS summ FROM nord_lb_kondor_viewbuilding.tabla
    WHERE ev=in_ev and per BETWEEN in_perfrom AND in_perto and bukrs=in_buk and mandt=in_mandt and lang_key=in_lang;


END IF;
END



