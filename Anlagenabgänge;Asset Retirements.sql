-- --------------------------------------------------------------------------------------------------------------------------------------------- --
-- 				  													README				 														 --
-- Language keys: Please use only the required language keys. Comment out the not needed ones in the LANGUAGE_KEYS table creation procedure.	 -- 
-- Filtering: Please filter the Client (Mandant), Company Code (Buchungskreis), Fiscal Year (Geschäftsjahr), Chart of Accounts (Kontenplan)		 --
-- in the MAIN TABLE at the WHERE condition according to the system description. 	 															 --
-- --------------------------------------------------------------------------------------------------------------------------------------------- --

-- ##BEGIN_VIEW##

FI___ASSET_RETIREMENTS_DYN;Anlagenabgänge;Asset Retirements;Sorties d`Immobilisations;0
FI___ASSET_RETIREMENTS_PROC

-- ##TRANSACTION_CODE##

S_ALR_87012052

-- ##OPTIMIZE##

LEVEL_1;MANDT;1
LEVEL_2;BUKRS;1

-- ##LANGUAGES##

de;en;fr

-- ##DICTIONARY##

AFABE;Bewertungsbereich;Depreciation Area;Tableau d`Évaluation;1
AFABE_TXT;Bewertungsbereich Bezeichnung;Depreciation Area Description;Tableau d`Évaluation Désignation;1
KTANSW;Bestandskonto AHK;Balance Sheet Account APC;Compte Bilan CAP;1
ANLKL;Anlagenklasse;Asset Class;Catégorie d`Immobilisations;1
ANLN1;Anlage;Asset;Immobilisation;1
ANLN2;Unternummer;Subnumber;Numéro Subsidiaire;1
AKTIV;Aktivierungsdatum;Capitalization Date;Date Mise en Service;1
ANLN_TXT;Anlage Bezeichnung;Asset Description;Immobilisation Désignation;1
DEAKT;Deaktivierungsdatum;Deactivation Date;Date de Mise Hors Service;1
ANLN_TXT2;Anlage Bezeichnung 2;Asset Description 2;Immobilisation Désignation 2;1
BELNR;Belegnummer;Document Number;No Piece;1
BUDAT;Buchungsdatum;Posting Date;Date Comptable;1
BWASL;Bewegungsart;Transaction Type;Code Mouvement;1
BZDAT;Bezugsdatum;Value Date;Date de Référence;1
XBLNR;Referenz;Reference;Référence;1
MENGE;Menge;Quantity;Quantité;1
MSEH3;Basismengeneinheit;Base Unit of Measure;Unité de Quantité de Base;1
SGTXT;Text;Text;Texte;1
WAERS;Währung;Currency;Devise;1
ANBTR;Abgang;Retirement;Sortie;1
ANAFA;Abgang AfA;Retiring Depreciation;Sortie Amortissement;1
BOOKA;Abgang Buchwert;Retiring Book Value;Sortie Valeur Comptable;1
ERLBT;Abgangserlös;Retirement Revenue;Produit Cession;1
MINERL;Mindererlös;Loss;Moins-Value;1
MEHERL;Mehrerlös;Gain;Plus-Value;1
VERKO;Abgangskosten;Costs of Retirement;Frais de Sortie;1
MANDT;Mandant;Client;Mandant;1
BUKRS;Buchungskreis;Company Code;Société;1
GJAHR;Geschäftsjahr;Fiscal Year;Exercice Comptable;1
KTOPL;Kontenplan;Chart of Accounts;Plan Comptable;1
LNRAN;Laufende Nummer;Sequence Number;Numéro Courant;1
LANG_KEY;Sprachschlüssel;Language Key;Code Langue;1

-- ##KEYS##

CREATE INDEX _mandt_bukrs_anln1_anln2_adatu_bdatu_anlgr_xafbe ON database_final.ANLB (MANDT, BUKRS, ANLN1, ANLN2, ADATU, BDATU, ANLGR, XAFBE); 
CREATE INDEX _mandt_bukrs_anln1_anln2_adatu_bdatu ON database_final.ANLB (MANDT, BUKRS, ANLN1, ANLN2, ADATU, BDATU); 
CREATE INDEX _mandt_bukrs_anln1_anln2_gjahr_lnran_afabe ON database_final.ANEP (MANDT, BUKRS, ANLN1, ANLN2, GJAHR, LNRAN, AFABE);
CREATE INDEX _mandt_bukrs_anln1_anln2_gjahr_lnran_afabe ON database_final.ANEA (MANDT, BUKRS, ANLN1, ANLN2, GJAHR, LNRAN, AFABE);
CREATE INDEX _mandt_bukrs_anln1_anln2_adatu_bdatu ON database_final.ANLZ (MANDT, BUKRS, ANLN1, ANLN2, ADATU, BDATU);  
CREATE INDEX _mandt_bukrs_anln1_anln2_gjahr_lnran ON database_final.ANEK (MANDT, BUKRS, ANLN1, ANLN2, GJAHR, LNRAN);
CREATE INDEX _mandt_anlkl_afapl_afabe_adatu_bdatu ON database_final.ANKB (MANDT, ANLKL, AFAPL, AFABE, ADATU, BDATU);
CREATE INDEX _mandt_ktopl_ktogr_afasl_afaber ON database_final.T095P (MANDT, KTOPL, KTOGR, AFASL, AFABER);
CREATE INDEX _mandt_kokrs_kostl_datab_datbi ON database_final.CSKS (MANDT, KOKRS, KOSTL, DATAB, DATBI);
CREATE INDEX _mandt_kokrs_kostl_datbi_spras ON database_final.CSKT (MANDT, KOKRS, KOSTL, DATBI, SPRAS);
CREATE INDEX _mandt_afapl_afaber_spras ON database_final.T093T (MANDT, AFAPL, AFABER, SPRAS);
CREATE INDEX _mandt_ktopl_saknr_spras ON database_final.SKAT (MANDT, KTOPL, SAKNR, SPRAS);
CREATE INDEX _mandt_ktopl_ktogr_afabe ON database_final.T095 (MANDT, KTOPL, KTOGR, AFABE);
CREATE INDEX _mandt_bukrs_anln1_anln2 ON database_final.ANLA (MANDT, BUKRS, ANLN1, ANLN2);
CREATE INDEX _mandt_afapl_afaber ON database_final.T093 (MANDT, AFAPL, AFABER);
CREATE INDEX _mandt_anlue_spras ON database_final.T087V (MANDT, ANLUE, SPRAS);
CREATE INDEX _mandt_gsber_spras ON database_final.TGSBT (MANDT, GSBER, SPRAS);
CREATE INDEX _mandt_bwasl_spras ON database_final.TABWT (MANDT, BWASL, SPRAS);
CREATE INDEX _mandt_bdatj_poper ON database_final.T009B (MANDT, BDATJ, POPER);
CREATE INDEX _mandt_periv_bdatj_reljr_poper ON database_final.T009B (MANDT, PERIV, BDATJ, RELJR, POPER); -- added on 2020-01-24 by Krisztián Horváth
CREATE INDEX _mandt_periv_bdatj_reljr ON database_final.T009B (MANDT, PERIV, BDATJ, RELJR); -- added on 2020-01-24 by Krisztián Horváth
CREATE INDEX _mandt_periv_bdatj_bumon_butag ON database_final.T009B (MANDT, PERIV, BDATJ, BUMON, BUTAG); -- added on 2020-01-24 by Krisztián Horváth
CREATE INDEX _mandt_periv_bdatj_bumon ON database_final.T009B (MANDT, PERIV, BDATJ, BUMON); -- added on 2020-01-24 by Krisztián Horváth
CREATE INDEX _mandt_periv_poper ON database_final.T009B (MANDT, PERIV, POPER); -- added on 2020-01-24 by Krisztián Horváth
CREATE INDEX _mandt_periv ON database_final.T009B (MANDT, PERIV); -- added on 2020-01-24 by Krisztián Horváth
CREATE INDEX _mandt_bukrs_afabe ON database_final.T093B (MANDT, BUKRS, AFABE);
CREATE INDEX _mandt_msehi_spras ON database_final.T006A (MANDT, MSEHI, SPRAS);
CREATE INDEX _mandt_anlkl_spras ON database_final.ANKT (MANDT, ANLKL, SPRAS);
CREATE INDEX _mandt_awtyp_awkey ON database_final.BKPF (MANDT, AWTYP, AWKEY);
CREATE INDEX _mandt_bukrs_afabe ON database_final.ANEP (MANDT, BUKRS, AFABE);
CREATE INDEX _client_addrnumber ON database_final.ADRC (CLIENT, ADDRNUMBER);
CREATE INDEX _mandt_bwagrp ON database_final.TABWG (MANDT, BWAGRP);
CREATE INDEX _mandt_bwagrp ON database_final.TABW (MANDT, BWAGRP);
CREATE INDEX _mandt_bukrs ON database_final.T093C (MANDT, BUKRS);
CREATE INDEX _mandt_bukrs ON database_final.T001 (MANDT, BUKRS);
CREATE INDEX _mandt_ktopl ON database_final.T004 (MANDT, KTOPL);
CREATE INDEX _mandt_bwasl ON database_final.TABW (MANDT, BWASL);
CREATE INDEX _mandt_periv ON database_final.T009 (MANDT, PERIV);
CREATE INDEX _mandt_anlkl ON database_final.ANKA (MANDT, ANLKL);
CREATE INDEX _mandt_werks_stand ON database_final.T499S (MANDT, WERKS, STAND);
CREATE INDEX _mandt_bukrs_gsber ON database_final.TKA02 (MANDT, BUKRS, GSBER);
CREATE INDEX _mandt_werks ON database_final.T001W (MANDT, WERKS);


-- ##REPORT_PARAMETERS##

in_anln1From;STRING;Anlagennummer von;Asset Number from;Numéro d`Immobilisation de
in_anln1To;STRING;Anlagennummer bis;Asset Number to;Numéro d`Immobilisation á
in_anln2From;STRING;Unternummer von;Subnumber from;Numéro Subsidiaire de
in_anln2To;STRING;Unternummer bis;Subnumber to;Numéro Subsidiaire á
in_anlklFrom;STRING;Anlagenklasse von;Asset Class from;Catégorie d`Immobilisations de
in_anlklTo;STRING;Anlagenklasse bis;Asset Class to;Catégorie d`Immobilisations á
in_gsberFrom;STRING;Geschäftsbereich von;Business Area from;Domaine d`Activité de
in_gsberTo;STRING;Geschäftsbereich bis;Business Area to;Domaine d`Activité á
in_kostlFrom;STRING;Kostenstelle von;Cost Center from;Centre de Couts de
in_kostlTo;STRING;Kostenstelle bis;Cost Center to;Centre de Couts á
in_werksFrom;STRING;Werk von;Plant from;Division de
in_werksTo;STRING;Werk bis;Plant to;Division á
in_stortFrom;STRING;Standort von;Location from;Localisation de
in_stortTo;STRING;Standort bis;Location to;Localisation á
in_anlueFrom;STRING;Anlagenübernummer von;Asset Super Number from;No Regroupement Immobilisations de
in_anlueTo;STRING;Anlagenübernummer bis;Asset Super Number to;No Regroupement Immobilisations á
in_reportDate;DATE;Berichtsdatum;Report Date;Date d`Analyse
in_afabe;STRING;Bewertungsbereich;Depreciation Area;Tableau d`Évaluation
in_ktanswFrom;STRING;Bestandskonto von;Balance Sheet Account from;Compte de Bilan de
in_ktanswTo;STRING;Bestandskonto bis;Balance Sheet Account to;Compte de Bilan á
in_aktivFrom;DATE;Aktivierungsdatum von;Capitalization Date from;Date de Mise en Service de
in_aktivTo;DATE;Aktivierungsdatum bis;Capitalization Date to;Date de Mise en Service á
in_deaktFrom;DATE;Deaktivierungsdatum von;Deactivation Date from;Date de Mise Hors Service de
in_deaktTo;DATE;Deaktivierungsdatum bis;Deactivation Date to;Date de Mise Hors Service á
in_bwaslFrom;STRING;Bewegungsart von;Transaction Type from;Code Mouvement de
in_bwaslTo;STRING;Bewegungsart bis;Transaction Type to;Code Mouvement á
in_budatFrom;DATE;Buchungsdatum von;Posting Date from;Date Comptable de
in_budatTo;DATE;Buchungsdatum bis;Posting Date to;Date Comptable á

-- ##REPORT_PARAMETER_REFERENCES##

in_anln1From;database_dynamic;FI___ASSET_RETIREMENTS;ANLN1;0;1;0;12;ANLN1;ANLN1_TXT
in_anln1To;database_dynamic;FI___ASSET_RETIREMENTS;ANLN1;0;1;0;12;ANLN1;ANLN1_TXT
in_anln2From;database_dynamic;FI___ASSET_RETIREMENTS;ANLN2;0;2;0;4;ANLN2;ANLN1
in_anln2To;database_dynamic;FI___ASSET_RETIREMENTS;ANLN2;0;2;0;4;ANLN2;ANLN1
in_anlklFrom;database_dynamic;FI___ASSET_RETIREMENTS;ANLKL;0;3;0;8;ANLKL;ANLKL_TXT
in_anlklTo;database_dynamic;FI___ASSET_RETIREMENTS;ANLKL;0;3;0;8;ANLKL;ANLKL_TXT
in_gsberFrom;database_dynamic;FI___ASSET_RETIREMENTS;GSBER;0;4;0;4;GSBER;GSBER_TXT
in_gsberTo;database_dynamic;FI___ASSET_RETIREMENTS;GSBER;0;4;0;4;GSBER;GSBER_TXT
in_kostlFrom;database_dynamic;FI___ASSET_RETIREMENTS___CSKS;KOSTL;0;5;0;10;KOSTL;KOSTL_TXT
in_kostlTo;database_dynamic;FI___ASSET_RETIREMENTS___CSKS;KOSTL;0;5;0;10;KOSTL;KOSTL_TXT
in_werksFrom;database_dynamic;FI___ASSET_RETIREMENTS;WERKS;0;6;0;4;WERKS;WERKS_TXT
in_werksTo;database_dynamic;FI___ASSET_RETIREMENTS;WERKS;0;6;0;4;WERKS;WERKS_TXT
in_stortFrom;database_dynamic;FI___ASSET_RETIREMENTS;STORT;0;7;0;0;STORT;STORT_TXT
in_stortTo;database_dynamic;FI___ASSET_RETIREMENTS;STORT;0;7;0;0;STORT;STORT_TXT
in_anlueFrom;database_dynamic;FI___ASSET_RETIREMENTS;ANLUE;0;8;0;0;ANLUE;ANLUE_TXT
in_anlueTo;database_dynamic;FI___ASSET_RETIREMENTS;ANLUE;0;8;0;0;ANLUE;ANLUE_TXT
in_reportDate;database_dynamic;FI___ASSET_RETIREMENTS;REPORT_DATE;1;0;0;0;REPORT_DATE;
in_afabe;database_dynamic;FI___ASSET_RETIREMENTS;AFABE;1;0;0;0;AFABE;AFABE_TXT
in_ktanswFrom;database_dynamic;FI___ASSET_RETIREMENTS;KTANSW;0;9;0;10;KTANSW;KTANSW_TXT
in_ktanswTo;database_dynamic;FI___ASSET_RETIREMENTS;KTANSW;0;9;0;10;KTANSW;KTANSW_TXT
in_aktivFrom;;;;0;10;0;0;;
in_aktivTo;;;;0;10;0;0;;
in_deaktFrom;;;;0;11;0;0;;
in_deaktTo;;;;0;11;0;0;;
in_bwaslFrom;database_dynamic;FI___ASSET_RETIREMENTS;BWASL;0;12;0;3;BWASL;BWASL_TXT
in_bwaslTo;database_dynamic;FI___ASSET_RETIREMENTS;BWASL;0;12;0;3;BWASL;BWASL_TXT
in_budatFrom;;;;0;13;0;0;;
in_budatTo;;;;0;13;0;0;;

-- ##VIEW##

DROP TABLE IF EXISTS FI___ASSET_RETIREMENTS_DYN;
CREATE TABLE FI___ASSET_RETIREMENTS_DYN
(
	AFABE		INT(2),
	AFABE_TXT	VARCHAR(50),
	KTANSW		VARCHAR(10),
	ANLKL		VARCHAR(8),
	ANLN1		VARCHAR(12),
	ANLN2		VARCHAR(4),
	AKTIV		DATE,
	ANLN_TXT	VARCHAR(50),
	DEAKT		DATE,
	ANLN_TXT2	VARCHAR(50),
	BELNR		VARCHAR(10),
	BUDAT		DATE,
	BZDAT		DATE,
	BWASL		VARCHAR(5),
	XBLNR		VARCHAR(20),
	MENGE		DECIMAL(20, 3),
	MSEH3		VARCHAR(5),
	SGTXT		VARCHAR(50),
	WAERS		VARCHAR(5),
	ANBTR		DECIMAL(30, 2),
	ANAFA		DECIMAL(30, 2),
	BOOKA		DECIMAL(30, 2),
	ERLBT		DECIMAL(30, 2),
	MINERL		DECIMAL(30, 2),
	MEHERL		DECIMAL(30, 2),
	VERKO		DECIMAL(30, 2),
	MANDT		VARCHAR(3),
	BUKRS		VARCHAR(4),
	GJAHR		INT(4),
	KTOPL		VARCHAR(4),
	LNRAN		INT,
	LANG_KEY	BINARY(1)
) CHARACTER SET	UTF8
  ENGINE 		MyISAM;

-- ##PROCEDURE_TEMP##
	
-- ---------------------- --
-- Table of language keys --
-- ---------------------- --
CREATE TABLE IF NOT EXISTS database_dynamic.LANGUAGE_KEYS
CHARACTER SET	UTF8
ENGINE			MyISAM
 SELECT BINARY('E') AS LANG_KEY
 UNION
SELECT BINARY('F') AS LANG_KEY
 UNION
 SELECT BINARY('D') AS LANG_KEY;

-- ------------------------------- --
-- Cost center search helper table --
-- ------------------------------- --
DROP TABLE IF EXISTS database_dynamic.FI___ASSET_RETIREMENTS___CSKS;
CREATE TABLE database_dynamic.FI___ASSET_RETIREMENTS___CSKS
CHARACTER SET	UTF8
ENGINE = MyISAM
  SELECT 
	  CSKS.MANDT																																			AS MANDT,
	  CSKS.KOSTL																																			AS KOSTL,
      CONCAT_WS(' ', RPAD(CSKS.KOKRS, 9, ' '), RPAD(CSKS.BUKRS, 9, ' '), RPAD(CSKS.KOSAR, 6, ' '), RPAD(CSKS.VERAK, 25, ' '), 																		
	  	RPAD(CSKS.VERAK_USER, 17, ' '), RPAD(IFNULL(CSKT.KTEXT, ''), 25, ' '), DATE_FORMAT(CSKS.DATAB, '%d.%m.%Y'), DATE_FORMAT(CSKS.DATBI, '%d.%m.%Y'))	AS KOSTL_TXT,
      LANG.LANG_KEY																																			AS LANG_KEY 
	FROM 
	  database_final.CSKS						AS CSKS
	  LEFT JOIN database_dynamic.LANGUAGE_KEYS	AS LANG	ON TRUE
	  LEFT JOIN database_final.CSKT				AS CSKT ON (CSKT.MANDT = CSKS.MANDT AND CSKT.KOKRS = CSKS.KOKRS AND CSKT.KOSTL = CSKS.KOSTL AND CSKT.DATBI = CSKS.DATBI AND CSKT.SPRAS = LANG.LANG_KEY);
   
  
-- ---------
-- FUNCTIONS 
-- ---------

-- -------------------------------------------------------------------------- --
-- Function getting the list type of an asset based on asset transaction type --
-- -------------------------------------------------------------------------- --
DELIMITER $$
DROP FUNCTION IF EXISTS database_dynamic.FI___GET_ASSET_LIST_TYPE $$
CREATE FUNCTION database_dynamic.FI___GET_ASSET_LIST_TYPE (in_mandt CHAR(3)	CHARACTER SET UTF8, 
														   in_bwasl CHAR(3)	CHARACTER SET UTF8)
RETURNS CHAR(3) CHARACTER SET UTF8 DETERMINISTIC
BEGIN
	DECLARE v_listType	CHAR(3) CHARACTER SET UTF8;
	DECLARE v_xzugne	CHAR(1) CHARACTER SET UTF8;
	DECLARE v_bwatyp	CHAR(1) CHARACTER SET UTF8;
	DECLARE v_gitcol	CHAR(1) CHARACTER SET UTF8;
	
	-- Get the transaction type group classification, curent-year aquisition indicator and transaction type category 
	SELECT 
		TABWG.GITCOL, 
		TABWG.XZUGNE, 
		TABWG.BWATYP
	  INTO 
		v_gitcol, 
		v_xzugne, 
		v_bwatyp
	  FROM 
		database_final.TABW 		AS TABW 
		JOIN database_final.TABWG	AS TABWG ON (TABWG.MANDT = TABW.MANDT AND TABWG.BWAGRP = TABW.BWAGRP)
	  WHERE 
		TABW.MANDT = in_mandt AND
		TABW.BWASL = in_bwasl;
	
	-- Set lit type based on the transaction type group classification
	IF(v_gitcol IN ('1', '5')) THEN
		
		-- Aquisition
		SET v_listType := 'ZUG';
		
	ELSEIF(v_gitcol IN ('2', '8')) THEN
		
		-- Retirement
		SET v_listType := 'ABG';
	
	ELSEIF(v_gitcol IN ('3', '4')) THEN

		-- Transfer
		SET v_listType := 'UMB';
	ELSE
	
		-- Any
		SET v_listType := 'ALL';
	
	END IF;
	
	-- If list type is asset transfer and curent-year aquisition indicator is active
	IF(v_listType = 'UMB' AND v_xzugne = 'X')
	
		-- Override list type from transfer to aquisition
		THEN SET v_listType := 'ZUG';
	
	END IF;
	
	-- If list type is auquisition and transaction type category is set to revalution
	IF(v_listType = 'ZUG' AND v_bwatyp = '6')
	
		-- Override list type from aquisition to any
		THEN SET v_listType := 'ALL';
	
	END IF;
	
	RETURN v_listType;
	
END $$

-- ---------------------------------------------------------------------------------------- --
-- Function getting the accounting document based on the reference transaction type and key --
-- ---------------------------------------------------------------------------------------- --
DROP FUNCTION IF EXISTS database_dynamic.FI___GET_ACCOUNTING_DOCUMENT $$
CREATE FUNCTION database_dynamic.FI___GET_ACCOUNTING_DOCUMENT (in_mandt CHAR(3)		CHARACTER SET UTF8,
															   in_bukrs CHAR(4)		CHARACTER SET UTF8, 
															   in_gjahr INT(4), 
															   in_awtyp CHAR(5)		CHARACTER SET UTF8, 
															   in_awkey CHAR(20)	CHARACTER SET UTF8)
RETURNS CHAR(10) CHARACTER SET UTF8 DETERMINISTIC
BEGIN
	DECLARE v_belnr CHAR(10) CHARACTER SET UTF8;
	
	-- Get the accounting document number
	SELECT 
		BELNR
	  INTO
		v_belnr
	  FROM
		database_final.BKPF
	  WHERE
		MANDT = in_mandt AND
		BUKRS = in_bukrs AND
		GJAHR = in_gjahr AND
		AWTYP = in_awtyp AND
		AWKEY = in_awkey
	  ORDER BY
		BELNR DESC
	  LIMIT 1;
			
	RETURN v_belnr;
	
END $$

-- -------------------------------------------------------------------------------- --
-- Function getting the fiscal year based on the given fiscal year variant and date --
-- -------------------------------------------------------------------------------- --
DROP FUNCTION IF EXISTS database_dynamic.FI___GET_FISCAL_YEAR $$
CREATE FUNCTION database_dynamic.FI___GET_FISCAL_YEAR (in_mandt CHAR(3)	CHARACTER SET UTF8, 
													   in_periv CHAR(2)	CHARACTER SET UTF8, 
													   in_date DATE)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE v_gjahr INT;
    DECLARE v_butag INT;
    DECLARE v_bumon INT;
    DECLARE v_xkale CHAR(1) CHARACTER SET UTF8;
    DECLARE v_xjabh CHAR(1) CHARACTER SET UTF8;
                
    -- Determine the calendar year/year dependance indicators
    SELECT 
		XKALE, 
		XJABH
      INTO 
		v_xkale, 
		v_xjabh
      FROM 
        database_final.T009
      WHERE 
        MANDT = in_mandt AND
        PERIV = in_periv;
    
    -- If the fiscal year does not differ from the calendar year 
    IF(v_xkale = 'X') THEN 
    
        -- Use calendar year
        SET v_gjahr := YEAR(in_date);
                   
    -- Else, map fiscal year
    ELSE
        
		-- Get the period
        SELECT 
            MIN(BUMON)
          INTO 
            v_bumon
          FROM 
            database_final.T009B
          WHERE 
            MANDT = in_mandt AND
            PERIV = in_periv AND
            BDATJ = IF(v_xjabh = 'X', YEAR(in_date), 0) AND
            BUMON >= MONTH(in_date);
			
		-- If there is a shift between montns
		IF(v_bumon > MONTH(in_date)) THEN
		
			-- Set the day to the fist day of the next month
			SET v_butag := 1;
		
		ELSE
		
			-- Use the given day of the month 
			SET v_butag := DAY(in_date);
		
		END IF;
		
		-- Get the last day of the period
        SELECT 
            MIN(BUTAG)
          INTO 
            v_butag
          FROM 
            database_final.T009B
          WHERE 
            MANDT = in_mandt AND
            PERIV = in_periv AND
            BDATJ = IF(v_xjabh = 'X', YEAR(in_date), 0) AND
            BUMON = v_bumon AND
            BUTAG >= v_butag;
			
		-- If there is a shift between montns
		IF(v_butag IS NULL) THEN
		
			-- Set the month
			SET v_bumon := v_bumon + 1;
		
			-- Get the last day of the period
			SELECT 
			  MIN(BUTAG)
			INTO 
			  v_butag
			FROM 
			  database_final.T009B
			WHERE 
			  MANDT = in_mandt AND
			  PERIV = in_periv AND
			  BDATJ = IF(v_xjabh = 'X', YEAR(in_date), 0) AND
			  BUMON = v_bumon AND
			  BUTAG >= 1;

		END IF;
        
        -- Get the fiscal year
        SELECT 
            IF(v_xjabh = 'X', BDATJ, YEAR(in_date)) + CAST(RELJR AS SIGNED)
          INTO 
            v_gjahr
          FROM 
            database_final.T009B
          WHERE 
             MANDT = in_mandt AND
             PERIV = in_periv AND
             BDATJ = IF(v_xjabh = 'X', YEAR(in_date), 0) AND
             BUMON = v_bumon AND
             BUTAG = v_butag;
    END IF;
                                   
    RETURN v_gjahr;

END $$

-- ---------------------------------------------------------------------------------- --
-- Function getting the fiscal period based on the given fiscal year variant and date --
-- ---------------------------------------------------------------------------------- --
DROP FUNCTION IF EXISTS database_dynamic.FI___GET_FISCAL_PERIOD $$
CREATE FUNCTION database_dynamic.FI___GET_FISCAL_PERIOD (in_mandt CHAR(3)	CHARACTER SET UTF8, 
														 in_periv CHAR(2)	CHARACTER SET UTF8,
														 in_date DATE)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE v_poper INT;
    DECLARE v_bumon INT;
    DECLARE v_butag INT;
    DECLARE v_xkale CHAR(1) CHARACTER SET UTF8;
    DECLARE v_xjabh CHAR(1) CHARACTER SET UTF8;
                
    -- Determine the calendar year/year dependance indicators
    SELECT 
        XKALE, 
		XJABH
      INTO 
        v_xkale, 
		v_xjabh
      FROM 
        database_final.T009
      WHERE 
        MANDT = in_mandt AND
        PERIV = in_periv;
    
    -- If the fiscal year does not differ from the calendar year
    IF(v_xkale = 'X') THEN 
    
		-- Use calendar month
		SET v_poper := MONTH(in_date);
                   
    -- Else, map fiscal period
    ELSE
	
		-- Get the period
        SELECT 
            MIN(BUMON)
          INTO 
            v_bumon
          FROM 
            database_final.T009B
          WHERE 
            MANDT = in_mandt AND
            PERIV = in_periv AND
            BDATJ = IF(v_xjabh = 'X', YEAR(in_date), 0) AND
            BUMON >= MONTH(in_date);
			
		-- If there is a shift between montns
		IF(v_bumon > MONTH(in_date)) THEN
		
			-- Set the day to the fist day of the next month
			SET v_butag := 1;
		
		ELSE
		
			-- Use the given day of the month 
			SET v_butag := DAY(in_date);
		
		END IF;
	
        -- Get the last day of the period
        SELECT 
            MIN(BUTAG)
          INTO 
            v_butag
          FROM 
            database_final.T009B
          WHERE 
            MANDT = in_mandt AND
            PERIV = in_periv AND
            BDATJ = IF(v_xjabh = 'X', YEAR(in_date), 0) AND
            BUMON = v_bumon AND
            BUTAG >= v_butag;
			
		-- If there is a shift between montns
		IF(v_butag IS NULL) THEN
		
			-- Set the month
			SET v_bumon := v_bumon + 1;
		
			-- Get the last day of the period
			SELECT 
			  MIN(BUTAG)
			INTO 
			  v_butag
			FROM 
			  database_final.T009B
			WHERE 
			  MANDT = in_mandt AND
			  PERIV = in_periv AND
			  BDATJ = IF(v_xjabh = 'X', YEAR(in_date), 0) AND
			  BUMON = v_bumon AND
			  BUTAG >= 1;

		END IF;
                        
        -- Get the fiscal period
        SELECT 
            IF(v_xjabh = 'X', POPER, MONTH(in_date))
          INTO 
            v_poper
          FROM 
            database_final.T009B
          WHERE 
             MANDT = in_mandt AND
             PERIV = in_periv AND
             BDATJ = IF(v_xjabh = 'X', YEAR(in_date), 0) AND
             BUMON = v_bumon AND
             BUTAG = v_butag;

    END IF;
                                   
    RETURN v_poper;

END $$

-- ----------------------------------------------------------------------------------- --
-- Function getting the report date based on the fiscal year variant and fiscal period --
-- ----------------------------------------------------------------------------------- --
DROP FUNCTION IF EXISTS database_dynamic.FI_AA___GET_REPORT_DATE $$
CREATE FUNCTION database_dynamic.FI_AA___GET_REPORT_DATE (in_mandt CHAR(3)	CHARACTER SET UTF8, 
														  in_periv CHAR(2)	CHARACTER SET UTF8, 
														  in_gjahr INT(4), 
														  in_poper INT(2))
RETURNS DATE DETERMINISTIC
BEGIN
	DECLARE v_reportDate	DATE;
	DECLARE v_xkale			CHAR(1) CHARACTER SET UTF8;
	DECLARE v_xjabh			CHAR(1) CHARACTER SET UTF8;
	
	-- Determine the calendar year/year dependance indicators
	SELECT 
		XKALE, 
		XJABH
	  INTO 
		v_xkale, 
		v_xjabh
	  FROM
		database_final.T009
	  WHERE
		MANDT = in_mandt AND
		PERIV = in_periv;
	
	SET in_poper := IF(in_poper > 12, 12, IF(in_poper < 1, 1, in_poper));
	
	-- If the fiscal year does not differ from the calendar year
	IF(v_xkale = 'X') THEN
		
		-- Use last day of the calendar month(last day of the year actually)
		SET v_reportDate := LAST_DAY(DATE(CONCAT_WS('-', in_gjahr, in_poper, '01')));
	
	-- Else, map report date
	ELSE
		-- If the fiscal year is year dependent
		IF(v_xjabh = 'X') THEN
		
	        SELECT 
				MAX(DATE(CONCAT_WS('-', BDATJ, BUMON, BUTAG)))
	          INTO 
				v_reportDate
	          FROM 
				database_final.T009B
	          WHERE 
				MANDT = in_mandt 	AND
	        	PERIV = in_periv	AND
	        	BDATJ + CAST(RELJR AS SIGNED) = in_gjahr AND
	        	POPER = in_poper;

		ELSE
			
			SELECT 
				MAX(LAST_DAY(DATE(CONCAT_WS('-', in_gjahr - CAST(RELJR AS SIGNED), BUMON, '01'))))
	          INTO 
				v_reportDate
	          FROM 
				database_final.T009B
	          WHERE 
				MANDT = in_mandt AND
	        	PERIV = in_periv AND
	        	POPER = in_poper;

		END IF;

	END IF;
			
	RETURN v_reportDate;
END $$

-- ---------------------------------------------------------------------- --
-- Function getting the last financial period of the given financial year --
-- ---------------------------------------------------------------------- --
DROP FUNCTION IF EXISTS database_dynamic.FI_AA___GET_LAST_FINANCIAL_PERIOD $$
CREATE FUNCTION database_dynamic.FI_AA___GET_LAST_FINANCIAL_PERIOD(in_mandt CHAR(3) CHARACTER SET UTF8, 
																   in_periv CHAR(2) CHARACTER SET UTF8, 
																   in_gjahr INT(4))
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE v_poper INT;
	DECLARE v_xkale CHAR(1) CHARACTER SET UTF8;
	DECLARE v_xjabh CHAR(1) CHARACTER SET UTF8;
	
	-- Determine the calendar year/year dependance indicators
	SELECT 
		XKALE, 
		XJABH
	  INTO 
		v_xkale, 
		v_xjabh
	  FROM 
		database_final.T009
	  WHERE 
		MANDT = in_mandt 	AND
		PERIV = in_periv;
		
	-- If the financial year does not differ from the calendar year
	IF(v_xkale = 'X') THEN
	
		SET v_poper := 12;
	
	-- Else translate calendar year to financial year
	ELSE
		-- If the financial year is year dependent
		IF(v_xjabh = 'X') THEN
	        SELECT
				MAX(POPER)
	          INTO
				v_poper
	          FROM
				database_final.T009B
	          WHERE
				MANDT = in_mandt 	AND
	        	PERIV = in_periv	AND
	        	BDATJ + CAST(RELJR AS SIGNED) = in_gjahr;
		
		ELSE
			-- The mapping is the same for all fiscal years
			SELECT
				MAX(POPER)
	          INTO
				v_poper
	          FROM
				database_final.T009B
	          WHERE
				MANDT = in_mandt AND
	        	PERIV = in_periv;
		END IF;
	END IF;
			
	RETURN IFNULL(v_poper, 12);

END $$

-- ----------------------------------------------------------------------------------- --
-- Function getting the report date based on the fiscal year variant and fiscal period --
-- ----------------------------------------------------------------------------------- --
DROP FUNCTION IF EXISTS database_dynamic.FI___GET_REPORT_DATE $$
CREATE FUNCTION database_dynamic.FI___GET_REPORT_DATE (in_mandt CHAR(3)	CHARACTER SET UTF8, 
													   in_periv CHAR(2)	CHARACTER SET UTF8, 
													   in_gjahr INT(4), 
													   in_poper INT(2))
RETURNS DATE DETERMINISTIC
BEGIN
	DECLARE v_reportDate	DATE;
	DECLARE v_xkale			CHAR(1) CHARACTER SET UTF8;
	DECLARE v_xjabh			CHAR(1) CHARACTER SET UTF8;
	
	-- Determine the calendar year/year dependance indicators
	SELECT 
		XKALE, 
		XJABH
	  INTO 
		v_xkale, 
		v_xjabh
	  FROM
		database_final.T009
	  WHERE
		MANDT = in_mandt AND
		PERIV = in_periv;
	
	SET in_poper := IF(in_poper > 12, 12, IF(in_poper < 1, 1, in_poper));
	
	-- If the fiscal year does not differ from the calendar year
	IF(v_xkale = 'X') THEN
		
		-- Use last day of the calendar month(last day of the year actually)
		SET v_reportDate := LAST_DAY(DATE(CONCAT_WS('-', in_gjahr, in_poper, '01')));
	
	-- Else, map report date
	ELSE
		-- If the fiscal year is year dependent
		IF(v_xjabh = 'X') THEN
		
	        SELECT 
				MAX(DATE(CONCAT_WS('-', BDATJ, BUMON, BUTAG)))
	          INTO 
				v_reportDate
	          FROM 
				database_final.T009B
	          WHERE 
				MANDT = in_mandt 	AND
	        	PERIV = in_periv	AND
	        	BDATJ + CAST(RELJR AS SIGNED) = in_gjahr AND
	        	POPER = in_poper;

		ELSE
			
			SELECT 
				MAX(LAST_DAY(DATE(CONCAT_WS('-', in_gjahr - CAST(RELJR AS SIGNED), BUMON, '01'))))
	          INTO 
				v_reportDate
	          FROM 
				database_final.T009B
	          WHERE 
				MANDT = in_mandt AND
	        	PERIV = in_periv AND
	        	POPER = in_poper;

		END IF;

	END IF;
			
	RETURN v_reportDate;
END $$

-- ---------------------------------------------------------------------- --
-- Function getting the last financial period of the given financial year --
-- ---------------------------------------------------------------------- --
DROP FUNCTION IF EXISTS database_dynamic.FI___GET_LAST_FISCAL_PERIOD $$
CREATE FUNCTION database_dynamic.FI___GET_LAST_FISCAL_PERIOD(in_mandt CHAR(3) CHARACTER SET UTF8, 
															 in_periv CHAR(2) CHARACTER SET UTF8, 
															 in_gjahr INT(4))
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE v_poper INT;
	DECLARE v_xkale CHAR(1) CHARACTER SET UTF8;
	DECLARE v_xjabh CHAR(1) CHARACTER SET UTF8;
	
	-- Determine the calendar year/year dependance indicators
	SELECT 
		XKALE, 
		XJABH
	  INTO 
		v_xkale, 
		v_xjabh
	  FROM 
		database_final.T009
	  WHERE 
		MANDT = in_mandt 	AND
		PERIV = in_periv;
		
	-- If the financial year does not differ from the calendar year
	IF(v_xkale = 'X') THEN
	
		SET v_poper := 12;
	
	-- Else translate calendar year to financial year
	ELSE
		-- If the financial year is year dependent
		IF(v_xjabh = 'X') THEN
	        SELECT
				MAX(POPER)
	          INTO
				v_poper
	          FROM
				database_final.T009B
	          WHERE
				MANDT = in_mandt 	AND
	        	PERIV = in_periv	AND
	        	BDATJ + CAST(RELJR AS SIGNED) = in_gjahr;
		
		ELSE
			-- The mapping is the same for all fiscal years
			SELECT
				MAX(POPER)
	          INTO
				v_poper
	          FROM
				database_final.T009B
	          WHERE
				MANDT = in_mandt AND
	        	PERIV = in_periv;
		END IF;
	END IF;
			
	RETURN IFNULL(v_poper, 12);

END $$

-- ------------------------------------------------------------- --
-- Function deciding the the deprecation area is real or derived --
-- ------------------------------------------------------------- --
DROP FUNCTION IF EXISTS database_dynamic.FI___IS_DERIVED_AREA $$
CREATE FUNCTION database_dynamic.FI___IS_DERIVED_AREA (in_mandt CHAR(3)	CHARACTER SET UTF8, 
													   in_bukrs CHAR(4)	CHARACTER SET UTF8, 
													   in_afabe INT(2))
RETURNS BOOLEAN DETERMINISTIC
BEGIN
	DECLARE v_xstore	BOOLEAN DEFAULT FALSE;
	DECLARE v_afapl		CHAR(4)	CHARACTER SET UTF8;
	
	-- Get the chart of depriciation
	SELECT 
		AFAPL
	  INTO
		v_afapl
	  FROM 
		database_final.T093C
	  WHERE
		MANDT = in_mandt AND
		BUKRS = in_bukrs;
	
	-- Get real/derived depriciation area indicator
	SELECT 
		IFNULL(XSTORE, '') != 'X'
	  INTO
		v_xstore
	  FROM 
		database_final.T093
	  WHERE
		MANDT = in_mandt AND
		AFAPL = v_afapl AND
		AFABER = in_afabe;

	RETURN IFNULL(v_xstore, FALSE);

END $$
DELIMITER ;

-- -----------
-- TEMP TABLES 
-- -----------

-- ---------------------------------- --
-- Table of derived deprecation areas --
-- ---------------------------------- --
DROP TABLE IF EXISTS database_viewbuilding.FI___DERIVED_AREAS;
CREATE TABLE database_viewbuilding.FI___DERIVED_AREAS
(
	INDEX (MANDT, BUKRS, AFABER)
) CHARACTER SET	UTF8 
  ENGINE		MyISAM
  SELECT DISTINCT
	  MANDT,
	  BUKRS,
	  AFABER,
	  ABVOR1,
	  AFABE1,
	  ANTEI1,
	  ABVOR2,
	  AFABE2,
	  ANTEI2,
	  ABVOR3,
	  AFABE3,
	  ANTEI3,
	  ABVOR4,
	  AFABE4,
	  ANTEI4	  
	FROM 
	  database_final.T093
	  JOIN database_final.T093C USING (MANDT, AFAPL)
	WHERE 
	  IFNULL(XSTORE, '') = '';
	 
-- ----------------------------- --
-- Table of asset document items --
-- ----------------------------- --
DROP TABLE IF EXISTS database_viewbuilding.FI___ASSET_DOCUMENT_ITEMS;
CREATE TABLE database_viewbuilding.FI___ASSET_DOCUMENT_ITEMS
(
	INDEX (MANDT, BUKRS, ANLN1, ANLN2, GJAHR, LNRAN)
) CHARACTER SET	UTF8 
  ENGINE		MyISAM
  SELECT
	  ANLN1,
	  ANLN2,
	  LNRAN,
	  BWASL,
	  BUZEI,
	  MANDT,
	  BUKRS,
	  GJAHR
	FROM 
	  database_final.ANEP
	GROUP BY
	  MANDT,
	  BUKRS,
	  ANLN1,
	  ANLN2,
	  GJAHR,
	  LNRAN;

-- ----------
-- MAIN TABLE
-- ----------
DROP TABLE IF EXISTS database_dynamic.FI___ASSET_RETIREMENTS;
CREATE TABLE database_dynamic.FI___ASSET_RETIREMENTS
(
	INDEX (MANDT, BUKRS, AFABE, GJAHR, REPORT_DATE),
	INDEX (MANDT, BUKRS, ANLN1, ANLN2),
	INDEX (MANDT, BWASL_O),
	INDEX (MANDT, ANLKL)
) CHARACTER SET	UTF8 
  ENGINE		MyISAM
  SELECT
	  ANEP.ANLN1																																		AS ANLN1,
	  ANEP.ANLN2																																		AS ANLN2,
	  ANLA.AKTIV 																																		AS AKTIV,
	  ANLA.TXT50 																																		AS ANLN_TXT,
	  ANLA.TXA50 																																		AS ANLN_TXT2,
	  ANEK.BUDAT						 																												AS BUDAT,
	  ANEP.BWASL																																		AS BWASL,
	  IF(ANEP.BZDAT = 0, NULL, ANEP.BZDAT) 																												AS BZDAT,
	  ANEK.XBLNR																																		AS XBLNR,
	  IF(ANEK.MENGE != 0, ANEK.MENGE, NULL)																												AS MENGE,
	  IFNULL(T006A.MSEH3, ANEK.MEINS)																													AS MSEH3,
	  IFNULL(database_dynamic.FI___GET_ACCOUNTING_DOCUMENT(ANEP.MANDT, ANEK.BUKRS, ANEK.GJAHR, ANEK.AWTYP, CONCAT(ANEK.BELNR, ANEK.AWORG)), ANEP.BELNR)	AS BELNR,
	  ANLA.ANLKL																																		AS ANLKL,
	  ANLZ.KOSTL																																		AS KOSTL,
	  ANLZ.WERKS																																		AS WERKS,
	  ANLZ.STORT																																		AS STORT,
	  ANLZ.GSBER																																		AS GSBER,
	  IF(T093.BUHBKT != '0', IFNULL(T095.KTANSW, T095B.KTANSW), T095B.KTANSW)																			AS KTANSW,
	  ANLA.ANLUE																																		AS ANLUE,
	  CAST(ANEP.AFABE AS UNSIGNED)																														AS AFABE,
	  T093T.AFBTXT																																		AS AFABE_TXT,
	  database_dynamic.FI___GET_REPORT_DATE(ANEK.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), 
		ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEK.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEK.GJAHR))				AS REPORT_DATE,
	  IFNULL(ANEA.AUFWL, 0) +
	    IFNULL(ANEA.AUFWV, 0) +
	    IFNULL(ANEP.ANBTR, 0)																															AS ANBTR,
	  IFNULL(ANEA.AUFNV, 0) +
	    IFNULL(ANEA.AUFNL, 0) +
		IFNULL(ANEA.NAFAL, 0) +
		IFNULL(ANEA.NAFAV, 0) +
		IFNULL(ANEA.SAFAL, 0) +
		IFNULL(ANEA.SAFAV, 0) +
		IFNULL(ANEA.AAFAL, 0) +
		IFNULL(ANEA.AAFAV, 0) +
		IFNULL(ANEA.MAFAV, 0) +
		IFNULL(ANEA.MAFAL, 0)																															AS ANAFA,
      IFNULL(ANEA.AUFWL, 0) +
		IFNULL(ANEA.AUFWV, 0) +
		IFNULL(ANEP.ANBTR, 0) +
		IFNULL(ANEA.AUFNV, 0) +
		IFNULL(ANEA.AUFNL, 0) +
		IFNULL(ANEA.NAFAL, 0) +
		IFNULL(ANEA.NAFAV, 0) +
		IFNULL(ANEA.SAFAL, 0) +
		IFNULL(ANEA.SAFAV, 0) +
		IFNULL(ANEA.AAFAL, 0) +
		IFNULL(ANEA.AAFAV, 0) +
		IFNULL(ANEA.MAFAV, 0) +
		IFNULL(ANEA.MAFAL, 0)             																												AS BOOKA,
	  IFNULL(ANEA.ERLBT, 0) 																															AS ERLBT,
	  IF(IFNULL(ANEA.ERLBT, 0) +
		 IFNULL(ANEP.ANBTR, 0) +
		 IFNULL(ANEA.AUFWV, 0) +
		 IFNULL(ANEA.AUFWL, 0) +
		 IFNULL(ANEA.NAFAL, 0) +
		 IFNULL(ANEA.NAFAV, 0) +
		 IFNULL(ANEA.SAFAL, 0) +
		 IFNULL(ANEA.SAFAV, 0) +
		 IFNULL(ANEA.AAFAL, 0) +
		 IFNULL(ANEA.AAFAV, 0) +
		 IFNULL(ANEA.MAFAV, 0) +
		 IFNULL(ANEA.MAFAL, 0) +
		 IFNULL(ANEA.AUFNV, 0) +
		 IFNULL(ANEA.AUFNL, 0) -
		 IFNULL(ANEA.VERKO, 0) > 0,
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
			   IFNULL(ANEA.ERLBT, 0) +
			   IFNULL(ANEP.ANBTR, 0) +
			   IFNULL(ANEA.AUFWV, 0) +
			   IFNULL(ANEA.AUFWL, 0) +
			   IFNULL(ANEA.NAFAL, 0) +
			   IFNULL(ANEA.NAFAV, 0) +
			   IFNULL(ANEA.SAFAL, 0) +
			   IFNULL(ANEA.SAFAV, 0) +
			   IFNULL(ANEA.AAFAL, 0) +
			   IFNULL(ANEA.AAFAV, 0) +
			   IFNULL(ANEA.MAFAV, 0) +
			   IFNULL(ANEA.MAFAL, 0) +
			   IFNULL(ANEA.AUFNV, 0) +
			   IFNULL(ANEA.AUFNL, 0) -
			   IFNULL(ANEA.VERKO, 0),
			   0),
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA.ERLBT, 0) +
			   IFNULL(ANEP.ANBTR, 0) +
			   IFNULL(ANEA.AUFWV, 0) +
			   IFNULL(ANEA.AUFWL, 0) +
			   IFNULL(ANEA.NAFAL, 0) +
			   IFNULL(ANEA.NAFAV, 0) +
			   IFNULL(ANEA.SAFAL, 0) +
			   IFNULL(ANEA.SAFAV, 0) +
			   IFNULL(ANEA.AAFAL, 0) +
			   IFNULL(ANEA.AAFAV, 0) +
			   IFNULL(ANEA.MAFAV, 0) +
			   IFNULL(ANEA.MAFAL, 0) +
			   IFNULL(ANEA.AUFNV, 0) +
			   IFNULL(ANEA.AUFNL, 0) -
			   IFNULL(ANEA.VERKO, 0))) 																													AS MINERL,
	  IF(IFNULL(ANEA.ERLBT, 0) +
		 IFNULL(ANEP.ANBTR, 0) +
		 IFNULL(ANEA.AUFWV, 0) +
		 IFNULL(ANEA.AUFWL, 0) +
		 IFNULL(ANEA.NAFAL, 0) +
		 IFNULL(ANEA.NAFAV, 0) +
		 IFNULL(ANEA.SAFAL, 0) +
		 IFNULL(ANEA.SAFAV, 0) +
		 IFNULL(ANEA.AAFAL, 0) +
		 IFNULL(ANEA.AAFAV, 0) +
		 IFNULL(ANEA.MAFAV, 0) +
		 IFNULL(ANEA.MAFAL, 0) +
		 IFNULL(ANEA.AUFNV, 0) +
		 IFNULL(ANEA.AUFNL, 0) -
		 IFNULL(ANEA.VERKO, 0) > 0,
		 IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
			0,
			IFNULL(ANEA.ERLBT, 0) +
			IFNULL(ANEP.ANBTR, 0) +
			IFNULL(ANEA.AUFWV, 0) +
			IFNULL(ANEA.AUFWL, 0) +
			IFNULL(ANEA.NAFAL, 0) +
			IFNULL(ANEA.NAFAV, 0) +
			IFNULL(ANEA.SAFAL, 0) +
			IFNULL(ANEA.SAFAV, 0) +
			IFNULL(ANEA.AAFAL, 0) +
			IFNULL(ANEA.AAFAV, 0) +
			IFNULL(ANEA.MAFAV, 0) +
			IFNULL(ANEA.MAFAL, 0) +
			IFNULL(ANEA.AUFNV, 0) +
			IFNULL(ANEA.AUFNL, 0) -
			IFNULL(ANEA.VERKO, 0)),
		 IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
			IFNULL(ANEA.ERLBT, 0) +
			IFNULL(ANEP.ANBTR, 0) +
			IFNULL(ANEA.AUFWV, 0) +
			IFNULL(ANEA.AUFWL, 0) +
			IFNULL(ANEA.NAFAL, 0) +
			IFNULL(ANEA.NAFAV, 0) +
			IFNULL(ANEA.SAFAL, 0) +
			IFNULL(ANEA.SAFAV, 0) +
			IFNULL(ANEA.AAFAL, 0) +
			IFNULL(ANEA.AAFAV, 0) +
			IFNULL(ANEA.MAFAV, 0) +
			IFNULL(ANEA.MAFAL, 0) +
			IFNULL(ANEA.AUFNV, 0) +
			IFNULL(ANEA.AUFNL, 0) -
			IFNULL(ANEA.VERKO, 0),
			0)) 																																		AS MEHERL,
	  IFNULL(ANEA.VERKO, 0)																																AS VERKO,
	  T093B.WAERS																																		AS WAERS,
	  ANEK.SGTXT																																		AS SGTXT,
	  ANLA.DEAKT																																		AS DEAKT,									
	  IF(ANLA.ZUGDT = 0, NULL, ANLA.ZUGDT)																												AS ZUGDT,
	  LANG.LANG_KEY																																		AS LANG_KEY,
	  ANLA.MANDT																																		AS MANDT,
	  ANLA.BUKRS																																		AS BUKRS,
	  ANEK.GJAHR																																		AS GJAHR,
	  T093C.AFAPL																																		AS AFAPL,
	  T001.KTOPL																																		AS KTOPL,
	  ANEK.LNRAN																																		AS LNRAN,
	  ANEP.BWASL																																		AS BWASL_O,
	  CAST(IFNULL(ANLB.XAFBE, '') AS CHAR(1))																											AS XAFBE,
	  COALESCE(ANEP.BUZEI, ITEM.BUZEI, ANEK.BUZEI)																										AS BUZEI,
	  CONCAT_WS(' ', RPAD(ANLA.BUKRS, 9, ' '), RPAD(ANLA.ANLKL, 13, ' '), RPAD(ANLA.TXT50, 55, ' '), RPAD(ANLA.KTOGR, 13, ' '), DATE_FORMAT(ANLA.AKTIV, '%d.%m.%Y'))	AS ANLN1_TXT,	
	  ANKT.TXK20																																						AS ANLKL_TXT,
	  TGSBT.GTEXT																																						AS GSBER_TXT,
	  CONCAT_WS(' ',RPAD(ADRC.NAME1, 45, ' '),RPAD(ADRC.NAME2, 45, ' '),RPAD(ADRC.CITY1, 45, ' '),RPAD(ADRC.POST_CODE1, 15, ' '),RPAD(ADRC.SORT1, 25, ' '),ADRC.SORT2)	AS WERKS_TXT,
	  CONCAT_WS(' ', RPAD(T499S.WERKS, 9, ' '), T499S.KTEXT)																											AS STORT_TXT,
	  T087V.ANLUE_TXT																																					AS ANLUE_TXT,
	  CONCAT_WS(' ', RPAD(T001.BUKRS, 9, ' '), COALESCE(SKAT.TXT50, SKAT2.TXT50))																						AS KTANSW_TXT,
	  TABWT.BWATXT																																						AS BWASL_TXT
	FROM 
	  database_final.ANEP 										AS ANEP
	  LEFT JOIN database_dynamic.LANGUAGE_KEYS					AS LANG 	ON TRUE
	  LEFT JOIN database_final.T093C							AS T093C	ON (T093C.MANDT = ANEP.MANDT AND T093C.BUKRS = ANEP.BUKRS)
	  LEFT JOIN database_final.T001								AS T001 	ON (T001.MANDT = ANEP.MANDT AND T001.BUKRS = ANEP.BUKRS)
	  LEFT JOIN database_final.ANEA								AS ANEA 	ON (ANEP.MANDT = ANEA.MANDT AND ANEP.BUKRS = ANEA.BUKRS AND ANEP.ANLN1 = ANEA.ANLN1 AND ANEP.ANLN2 = ANEA.ANLN2 AND ANEP.GJAHR = ANEA.GJAHR AND ANEP.LNRAN = ANEA.LNRAN AND ANEP.AFABE = ANEA.AFABE)
	  JOIN database_final.ANEK									AS ANEK 	ON (ANEK.MANDT = ANEP.MANDT AND ANEK.BUKRS = ANEP.BUKRS AND ANEK.ANLN1 = ANEP.ANLN1 AND ANEK.ANLN2 = ANEP.ANLN2 AND ANEK.GJAHR = ANEP.GJAHR AND ANEK.LNRAN = ANEP.LNRAN)
	  JOIN database_final.ANLA									AS ANLA 	ON (ANLA.MANDT = ANEP.MANDT AND ANLA.BUKRS = ANEP.BUKRS AND ANLA.ANLN1 = ANEP.ANLN1 AND ANLA.ANLN2 = ANEP.ANLN2)
	  JOIN database_final.ANLZ									AS ANLZ 	ON (ANLZ.MANDT = ANEP.MANDT AND ANLZ.BUKRS = ANEP.BUKRS AND ANLZ.ANLN1 = ANEP.ANLN1 AND ANLZ.ANLN2 = ANEP.ANLN2 AND database_dynamic.FI___GET_REPORT_DATE(ANEP.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP.GJAHR)) BETWEEN ANLZ.ADATU AND ANLZ.BDATU)
	  LEFT JOIN database_viewbuilding.FI___ASSET_DOCUMENT_ITEMS	AS ITEM		ON (ITEM.MANDT = ANEK.MANDT AND ITEM.BUKRS = ANEK.BUKRS AND ITEM.ANLN1 = ANEK.ANLN1 AND ITEM.ANLN2 = ANEK.ANLN2 AND ITEM.GJAHR = ANEK.GJAHR AND ITEM.LNRAN = ANEK.LNRAN)
	  LEFT JOIN database_final.ANLB								AS ANLB 	ON (ANLB.MANDT = ANEP.MANDT AND ANLB.BUKRS = ANEP.BUKRS AND ANLB.ANLN1 = ANEP.ANLN1 AND ANLB.ANLN2 = ANEP.ANLN2 AND ANLB.AFABE = ANEP.AFABE AND database_dynamic.FI___GET_REPORT_DATE(ANEP.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP.GJAHR)) BETWEEN ANLB.ADATU AND ANLB.BDATU)
	  LEFT JOIN database_final.TKA02							AS TKA02 	ON (TKA02.MANDT = ANLZ.MANDT AND TKA02.BUKRS = ANLZ.BUKRS AND TKA02.GSBER = ANLZ.GSBER)
	  LEFT JOIN database_final.TKA02							AS TKA02B 	ON (TKA02B.MANDT = ANLZ.MANDT AND TKA02B.BUKRS = ANLZ.BUKRS AND TKA02B.GSBER = '')
	  LEFT JOIN database_final.T093B							AS T093B	ON (T093B.MANDT = ANEP.MANDT AND T093B.BUKRS = ANEP.BUKRS AND T093B.AFABE = ANEP.AFABE)
	  LEFT JOIN database_final.T093								AS T093		ON (T093.MANDT = ANEP.MANDT AND T093.AFAPL = T093C.AFAPL AND T093.AFABER = ANEP.AFABE)	  
	  LEFT JOIN database_final.T095								AS T095 	ON (T095.MANDT = ANEP.MANDT AND T095.KTOPL = T001.KTOPL AND T095.KTOGR = ANLA.KTOGR AND T095.AFABE = ANEP.AFABE)
	  LEFT JOIN database_final.T095								AS T095B	ON (T095B.MANDT = ANEP.MANDT AND T095B.KTOPL = T001.KTOPL AND T095B.KTOGR = ANLA.KTOGR AND T095B.AFABE = 1)
	  LEFT JOIN database_final.T006A							AS T006A 	ON (T006A.MANDT = ANEP.MANDT AND T006A.MSEHI = ANEK.MEINS AND T006A.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.ANKT								AS ANKT 	ON (ANKT.MANDT = ANLA.MANDT AND ANKT.ANLKL = ANLA.ANLKL AND ANKT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.TGSBT							AS TGSBT 	ON (TGSBT.MANDT = ANLA.MANDT AND TGSBT.GSBER = ANLZ.GSBER AND TGSBT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.T001W							AS T001W 	ON (T001W.MANDT = ANLZ.MANDT AND T001W.WERKS = ANLZ.WERKS)	  
	  LEFT JOIN database_final.T499S							AS T499S 	ON (T499S.MANDT = ANLZ.MANDT AND T499S.WERKS = ANLZ.WERKS AND T499S.STAND = ANLZ.STORT)
	  LEFT JOIN database_final.T087V							AS T087V 	ON (T087V.MANDT = ANLA.MANDT AND T087V.ANLUE = ANLA.ANLUE AND T087V.SPRAS = LANG.LANG_KEY)	  
	  LEFT JOIN database_final.T004								AS T004		ON (T004.MANDT = T001.MANDT	AND T004.KTOPL = T001.KTOPL)
	  LEFT JOIN database_final.SKAT								AS SKAT		ON (SKAT.MANDT = ANEP.MANDT AND SKAT.KTOPL = T001.KTOPL AND SKAT.SAKNR = IF(T093.BUHBKT != '0', T095.KTANSW, T095B.KTANSW) AND SKAT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.SKAT								AS SKAT2 	ON (SKAT2.MANDT = ANEP.MANDT AND SKAT2.KTOPL = T001.KTOPL AND SKAT2.SAKNR = IF(T093.BUHBKT != '0', T095.KTANSW, T095B.KTANSW) AND BINARY(SKAT2.SPRAS) = BINARY(T004.DSPRA))
	  LEFT JOIN database_final.TABWT							AS TABWT 	ON (TABWT.MANDT = ANEP.MANDT AND TABWT.BWASL = ANEP.BWASL AND TABWT.SPRAS = LANG.LANG_KEY)	  
	  LEFT JOIN database_final.T093T							AS T093T	ON (T093T.MANDT = ANEP.MANDT AND T093T.AFAPL = T093C.AFAPL AND T093T.AFABER = ANEP.AFABE AND T093T.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.ADRC								AS ADRC		ON (ADRC.CLIENT = T001W.MANDT AND ADRC.ADDRNUMBER = T001W.ADRNR AND ADRC.NATION = '')
	WHERE
	  IFNULL(ANLB.ANLGR, '') = '' AND 
	  IFNULL(ANLB.XAFBE, '') = '' AND 
	  IFNULL(ANLA.XLOEV, '') = '' AND
	  (ANLA.DEAKT = 0 OR database_dynamic.FI___GET_FISCAL_YEAR(ANLA.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANLA.DEAKT) >= ANEP.GJAHR);

-- ------------------------------------------------- --
-- Insert transactions on derived depriciation areas --
-- ------------------------------------------------- --
INSERT INTO database_dynamic.FI___ASSET_RETIREMENTS
  SELECT                                                                                                                                                    
	  ANEP.ANLN1																																		AS ANLN1,
	  ANEP.ANLN2																																		AS ANLN2,
	  ANLA.AKTIV						 																												AS AKTIV,
	  ANLA.TXT50 																																		AS ANLN_TXT,
	  ANLA.TXA50 																																		AS ANLN_TXT2,
	  ANEK.BUDAT						 																												AS BUDAT,
	  ANEP.BWASL																																		AS BWASL,
	  IF(ANEP.BZDAT = 0, NULL, ANEP.BZDAT) 																												AS BZDAT,
	  ANEK.XBLNR																																		AS XBLNR,
	  IF(ANEK.MENGE != 0, ANEK.MENGE, NULL)																												AS MENGE,
	  IFNULL(T006A.MSEH3, ANEK.MEINS)																													AS MSEH3,
	  IFNULL(database_dynamic.FI___GET_ACCOUNTING_DOCUMENT(ANEP.MANDT, ANEK.BUKRS, ANEK.GJAHR, ANEK.AWTYP, CONCAT(ANEK.BELNR, ANEK.AWORG)), ANEP.BELNR)	AS BELNR,
	  ANLA.ANLKL																																		AS ANLKL,
	  ANLZ.KOSTL																																		AS KOSTL,
	  ANLZ.WERKS																																		AS WERKS,
	  ANLZ.STORT																																		AS STORT,
	  ANLZ.GSBER																																		AS GSBER,
	  COALESCE(IF(T095.KTSOPO != '', T095.KTSOPO, NULL), 				
			   IF(T093V.BUHBKT != '0', T095B.KTANSW, IF(T093V.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), 				
			   IF(T093X.BUHBKT != '0', T095C.KTANSW, IF(T093X.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), 				
			   IF(T093Y.BUHBKT != '0', T095D.KTANSW, IF(T093Y.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)),				
			   IF(T093Z.BUHBKT != '0', T095E.KTANSW, IF(T093Z.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)),
			   T095F.KTANSW)																															AS KTANSW,
	  ANLA.ANLUE																																		AS ANLUE,
	  CAST(AREA.AFABER AS UNSIGNED)																														AS AFABE,
	  T093T.AFBTXT																																		AS AFABE_TXT,
	  database_dynamic.FI___GET_REPORT_DATE(ANEK.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), 
		ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEK.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEK.GJAHR))				AS REPORT_DATE,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IFNULL(ANEA.AUFWL, 0) +
	      IFNULL(ANEA.AUFWV, 0) +
	      IFNULL(ANEP.ANBTR, 0)) +
	    IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
	      IFNULL(ANEP2.ANBTR, 0)), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IFNULL(ANEA3.AUFWL, 0) +
	      IFNULL(ANEA3.AUFWV, 0) +
	      IFNULL(ANEP3.ANBTR, 0)), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IFNULL(ANEA4.AUFWL, 0) +
	      IFNULL(ANEA4.AUFWV, 0) +
	      IFNULL(ANEP4.ANBTR, 0)), 0)																													AS ANBTR,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0)) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IFNULL(ANEA2.AUFNV, 0) +
	      IFNULL(ANEA2.AUFNL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IFNULL(ANEA3.AUFNV, 0) +
	      IFNULL(ANEA3.AUFNL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IFNULL(ANEA4.AUFNV, 0) +
	      IFNULL(ANEA4.AUFNL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0)), 0)																													AS ANAFA,
      IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IFNULL(ANEA.AUFWL, 0) +
		  IFNULL(ANEA.AUFWV, 0) +
		  IFNULL(ANEP.ANBTR, 0) +
		  IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0)) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
		  IFNULL(ANEP2.ANBTR, 0) +
		  IFNULL(ANEA2.AUFNV, 0) +
		  IFNULL(ANEA2.AUFNL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IFNULL(ANEA3.AUFWL, 0) +
		  IFNULL(ANEA3.AUFWV, 0) +
		  IFNULL(ANEP3.ANBTR, 0) +
		  IFNULL(ANEA3.AUFNV, 0) +
		  IFNULL(ANEA3.AUFNL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IFNULL(ANEA4.AUFWL, 0) +
		  IFNULL(ANEA4.AUFWV, 0) +
		  IFNULL(ANEP4.ANBTR, 0) +
		  IFNULL(ANEA4.AUFNV, 0) +
		  IFNULL(ANEA4.AUFNL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0)), 0)																													AS BOOKA,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * IFNULL(ANEA.ERLBT, 0) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * IFNULL(ANEA2.ERLBT, 0), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * IFNULL(ANEA3.ERLBT, 0), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * IFNULL(ANEA4.ERLBT, 0), 0)																	AS ERLBT,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IF(IFNULL(ANEA.ERLBT, 0) +
		  IFNULL(ANEP.ANBTR, 0) +
		  IFNULL(ANEA.AUFWV, 0) +
		  IFNULL(ANEA.AUFWL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0) +
		  IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) -
		  IFNULL(ANEA.VERKO, 0) > 0,
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
			   IFNULL(ANEA.ERLBT, 0) +
			   IFNULL(ANEP.ANBTR, 0) +
			   IFNULL(ANEA.AUFWV, 0) +
			   IFNULL(ANEA.AUFWL, 0) +
			   IFNULL(ANEA.NAFAL, 0) +
			   IFNULL(ANEA.NAFAV, 0) +
			   IFNULL(ANEA.SAFAL, 0) +
			   IFNULL(ANEA.SAFAV, 0) +
			   IFNULL(ANEA.AAFAL, 0) +
			   IFNULL(ANEA.AAFAV, 0) +
			   IFNULL(ANEA.MAFAV, 0) +
			   IFNULL(ANEA.MAFAL, 0) +
			   IFNULL(ANEA.AUFNV, 0) +
			   IFNULL(ANEA.AUFNL, 0) -
			   IFNULL(ANEA.VERKO, 0),
			   0),
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA.ERLBT, 0) +
			   IFNULL(ANEP.ANBTR, 0) +
			   IFNULL(ANEA.AUFWV, 0) +
			   IFNULL(ANEA.AUFWL, 0) +
			   IFNULL(ANEA.NAFAL, 0) +
			   IFNULL(ANEA.NAFAV, 0) +
			   IFNULL(ANEA.SAFAL, 0) +
			   IFNULL(ANEA.SAFAV, 0) +
			   IFNULL(ANEA.AAFAL, 0) +
			   IFNULL(ANEA.AAFAV, 0) +
			   IFNULL(ANEA.MAFAV, 0) +
			   IFNULL(ANEA.MAFAL, 0) +
			   IFNULL(ANEA.AUFNV, 0) +
			   IFNULL(ANEA.AUFNL, 0) -
			   IFNULL(ANEA.VERKO, 0)))) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IF(IFNULL(ANEA2.ERLBT, 0) +
		  IFNULL(ANEP2.ANBTR, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
		  IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0) +
		  IFNULL(ANEA2.AUFNV, 0) +
		  IFNULL(ANEA2.AUFNL, 0) -
		  IFNULL(ANEA2.VERKO, 0) > 0,
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
			   IFNULL(ANEA2.ERLBT, 0) +
			   IFNULL(ANEP2.ANBTR, 0) +
			   IFNULL(ANEA2.AUFWV, 0) +
			   IFNULL(ANEA2.AUFWL, 0) +
			   IFNULL(ANEA2.NAFAL, 0) +
			   IFNULL(ANEA2.NAFAV, 0) +
			   IFNULL(ANEA2.SAFAL, 0) +
			   IFNULL(ANEA2.SAFAV, 0) +
			   IFNULL(ANEA2.AAFAL, 0) +
			   IFNULL(ANEA2.AAFAV, 0) +
			   IFNULL(ANEA2.MAFAV, 0) +
			   IFNULL(ANEA2.MAFAL, 0) +
			   IFNULL(ANEA2.AUFNV, 0) +
			   IFNULL(ANEA2.AUFNL, 0) -
			   IFNULL(ANEA2.VERKO, 0),
			   0),
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA2.ERLBT, 0) +
			   IFNULL(ANEP2.ANBTR, 0) +
			   IFNULL(ANEA2.AUFWV, 0) +
			   IFNULL(ANEA2.AUFWL, 0) +
			   IFNULL(ANEA2.NAFAL, 0) +
			   IFNULL(ANEA2.NAFAV, 0) +
			   IFNULL(ANEA2.SAFAL, 0) +
			   IFNULL(ANEA2.SAFAV, 0) +
			   IFNULL(ANEA2.AAFAL, 0) +
			   IFNULL(ANEA2.AAFAV, 0) +
			   IFNULL(ANEA2.MAFAV, 0) +
			   IFNULL(ANEA2.MAFAL, 0) +
			   IFNULL(ANEA2.AUFNV, 0) +
			   IFNULL(ANEA2.AUFNL, 0) -
			   IFNULL(ANEA2.VERKO, 0)))), 0) + 
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IF(IFNULL(ANEA3.ERLBT, 0) +
		  IFNULL(ANEP3.ANBTR, 0) +
		  IFNULL(ANEA3.AUFWV, 0) +
		  IFNULL(ANEA3.AUFWL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0) +
		  IFNULL(ANEA3.AUFNV, 0) +
		  IFNULL(ANEA3.AUFNL, 0) -
		  IFNULL(ANEA3.VERKO, 0) > 0,
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
			   IFNULL(ANEA3.ERLBT, 0) +
			   IFNULL(ANEP3.ANBTR, 0) +
			   IFNULL(ANEA3.AUFWV, 0) +
			   IFNULL(ANEA3.AUFWL, 0) +
			   IFNULL(ANEA3.NAFAL, 0) +
			   IFNULL(ANEA3.NAFAV, 0) +
			   IFNULL(ANEA3.SAFAL, 0) +
			   IFNULL(ANEA3.SAFAV, 0) +
			   IFNULL(ANEA3.AAFAL, 0) +
			   IFNULL(ANEA3.AAFAV, 0) +
			   IFNULL(ANEA3.MAFAV, 0) +
			   IFNULL(ANEA3.MAFAL, 0) +
			   IFNULL(ANEA3.AUFNV, 0) +
			   IFNULL(ANEA3.AUFNL, 0) -
			   IFNULL(ANEA3.VERKO, 0),
			   0),
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA3.ERLBT, 0) +
			   IFNULL(ANEP3.ANBTR, 0) +
			   IFNULL(ANEA3.AUFWV, 0) +
			   IFNULL(ANEA3.AUFWL, 0) +
			   IFNULL(ANEA3.NAFAL, 0) +
			   IFNULL(ANEA3.NAFAV, 0) +
			   IFNULL(ANEA3.SAFAL, 0) +
			   IFNULL(ANEA3.SAFAV, 0) +
			   IFNULL(ANEA3.AAFAL, 0) +
			   IFNULL(ANEA3.AAFAV, 0) +
			   IFNULL(ANEA3.MAFAV, 0) +
			   IFNULL(ANEA3.MAFAL, 0) +
			   IFNULL(ANEA3.AUFNV, 0) +
			   IFNULL(ANEA3.AUFNL, 0) -
			   IFNULL(ANEA3.VERKO, 0)))), 0) + 
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IF(IFNULL(ANEA4.ERLBT, 0) +
		  IFNULL(ANEP4.ANBTR, 0) +
		  IFNULL(ANEA4.AUFWV, 0) +
		  IFNULL(ANEA4.AUFWL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0) +
		  IFNULL(ANEA4.AUFNV, 0) +
		  IFNULL(ANEA4.AUFNL, 0) -
		  IFNULL(ANEA4.VERKO, 0) > 0,
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
			   IFNULL(ANEA4.ERLBT, 0) +
			   IFNULL(ANEP4.ANBTR, 0) +
			   IFNULL(ANEA4.AUFWV, 0) +
			   IFNULL(ANEA4.AUFWL, 0) +
			   IFNULL(ANEA4.NAFAL, 0) +
			   IFNULL(ANEA4.NAFAV, 0) +
			   IFNULL(ANEA4.SAFAL, 0) +
			   IFNULL(ANEA4.SAFAV, 0) +
			   IFNULL(ANEA4.AAFAL, 0) +
			   IFNULL(ANEA4.AAFAV, 0) +
			   IFNULL(ANEA4.MAFAV, 0) +
			   IFNULL(ANEA4.MAFAL, 0) +
			   IFNULL(ANEA4.AUFNV, 0) +
			   IFNULL(ANEA4.AUFNL, 0) -
			   IFNULL(ANEA4.VERKO, 0),
			   0),
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA4.ERLBT, 0) +
			   IFNULL(ANEP4.ANBTR, 0) +
			   IFNULL(ANEA4.AUFWV, 0) +
			   IFNULL(ANEA4.AUFWL, 0) +
			   IFNULL(ANEA4.NAFAL, 0) +
			   IFNULL(ANEA4.NAFAV, 0) +
			   IFNULL(ANEA4.SAFAL, 0) +
			   IFNULL(ANEA4.SAFAV, 0) +
			   IFNULL(ANEA4.AAFAL, 0) +
			   IFNULL(ANEA4.AAFAV, 0) +
			   IFNULL(ANEA4.MAFAV, 0) +
			   IFNULL(ANEA4.MAFAL, 0) +
			   IFNULL(ANEA4.AUFNV, 0) +
			   IFNULL(ANEA4.AUFNL, 0) -
			   IFNULL(ANEA4.VERKO, 0)))), 0)																											AS MINERL,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IF(IFNULL(ANEA.ERLBT, 0) +
		  IFNULL(ANEP.ANBTR, 0) +
		  IFNULL(ANEA.AUFWV, 0) +
		  IFNULL(ANEA.AUFWL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0) +
		  IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) -
		  IFNULL(ANEA.VERKO, 0) > 0,
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA.ERLBT, 0) +
				IFNULL(ANEP.ANBTR, 0) +
				IFNULL(ANEA.AUFWV, 0) +
				IFNULL(ANEA.AUFWL, 0) +
				IFNULL(ANEA.NAFAL, 0) +
				IFNULL(ANEA.NAFAV, 0) +
				IFNULL(ANEA.SAFAL, 0) +
				IFNULL(ANEA.SAFAV, 0) +
				IFNULL(ANEA.AAFAL, 0) +
				IFNULL(ANEA.AAFAV, 0) +
				IFNULL(ANEA.MAFAV, 0) +
				IFNULL(ANEA.MAFAL, 0) +
				IFNULL(ANEA.AUFNV, 0) +
				IFNULL(ANEA.AUFNL, 0) -
				IFNULL(ANEA.VERKO, 0)),
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
				IFNULL(ANEA.ERLBT, 0) +
				IFNULL(ANEP.ANBTR, 0) +
				IFNULL(ANEA.AUFWV, 0) +
				IFNULL(ANEA.AUFWL, 0) +
				IFNULL(ANEA.NAFAL, 0) +
				IFNULL(ANEA.NAFAV, 0) +
				IFNULL(ANEA.SAFAL, 0) +
				IFNULL(ANEA.SAFAV, 0) +
				IFNULL(ANEA.AAFAL, 0) +
				IFNULL(ANEA.AAFAV, 0) +
				IFNULL(ANEA.MAFAV, 0) +
				IFNULL(ANEA.MAFAL, 0) +
				IFNULL(ANEA.AUFNV, 0) +
				IFNULL(ANEA.AUFNL, 0) -
				IFNULL(ANEA.VERKO, 0),
				0))) + 
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IF(IFNULL(ANEA2.ERLBT, 0) +
		  IFNULL(ANEP2.ANBTR, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
		  IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0) +
		  IFNULL(ANEA2.AUFNV, 0) +
		  IFNULL(ANEA2.AUFNL, 0) -
		  IFNULL(ANEA2.VERKO, 0) > 0,
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA2.ERLBT, 0) +
				IFNULL(ANEP2.ANBTR, 0) +
				IFNULL(ANEA2.AUFWV, 0) +
				IFNULL(ANEA2.AUFWL, 0) +
				IFNULL(ANEA2.NAFAL, 0) +
				IFNULL(ANEA2.NAFAV, 0) +
				IFNULL(ANEA2.SAFAL, 0) +
				IFNULL(ANEA2.SAFAV, 0) +
				IFNULL(ANEA2.AAFAL, 0) +
				IFNULL(ANEA2.AAFAV, 0) +
				IFNULL(ANEA2.MAFAV, 0) +
				IFNULL(ANEA2.MAFAL, 0) +
				IFNULL(ANEA2.AUFNV, 0) +
				IFNULL(ANEA2.AUFNL, 0) -
				IFNULL(ANEA2.VERKO, 0)),
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
				IFNULL(ANEA2.ERLBT, 0) +
				IFNULL(ANEP2.ANBTR, 0) +
				IFNULL(ANEA2.AUFWV, 0) +
				IFNULL(ANEA2.AUFWL, 0) +
				IFNULL(ANEA2.NAFAL, 0) +
				IFNULL(ANEA2.NAFAV, 0) +
				IFNULL(ANEA2.SAFAL, 0) +
				IFNULL(ANEA2.SAFAV, 0) +
				IFNULL(ANEA2.AAFAL, 0) +
				IFNULL(ANEA2.AAFAV, 0) +
				IFNULL(ANEA2.MAFAV, 0) +
				IFNULL(ANEA2.MAFAL, 0) +
				IFNULL(ANEA2.AUFNV, 0) +
				IFNULL(ANEA2.AUFNL, 0) -
				IFNULL(ANEA2.VERKO, 0),
				0))), 0) + 
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IF(IFNULL(ANEA3.ERLBT, 0) +
		  IFNULL(ANEP3.ANBTR, 0) +
		  IFNULL(ANEA3.AUFWV, 0) +
		  IFNULL(ANEA3.AUFWL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0) +
		  IFNULL(ANEA3.AUFNV, 0) +
		  IFNULL(ANEA3.AUFNL, 0) -
		  IFNULL(ANEA3.VERKO, 0) > 0,
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA3.ERLBT, 0) +
				IFNULL(ANEP3.ANBTR, 0) +
				IFNULL(ANEA3.AUFWV, 0) +
				IFNULL(ANEA3.AUFWL, 0) +
				IFNULL(ANEA3.NAFAL, 0) +
				IFNULL(ANEA3.NAFAV, 0) +
				IFNULL(ANEA3.SAFAL, 0) +
				IFNULL(ANEA3.SAFAV, 0) +
				IFNULL(ANEA3.AAFAL, 0) +
				IFNULL(ANEA3.AAFAV, 0) +
				IFNULL(ANEA3.MAFAV, 0) +
				IFNULL(ANEA3.MAFAL, 0) +
				IFNULL(ANEA3.AUFNV, 0) +
				IFNULL(ANEA3.AUFNL, 0) -
				IFNULL(ANEA3.VERKO, 0)),
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
				IFNULL(ANEA3.ERLBT, 0) +
				IFNULL(ANEP3.ANBTR, 0) +
				IFNULL(ANEA3.AUFWV, 0) +
				IFNULL(ANEA3.AUFWL, 0) +
				IFNULL(ANEA3.NAFAL, 0) +
				IFNULL(ANEA3.NAFAV, 0) +
				IFNULL(ANEA3.SAFAL, 0) +
				IFNULL(ANEA3.SAFAV, 0) +
				IFNULL(ANEA3.AAFAL, 0) +
				IFNULL(ANEA3.AAFAV, 0) +
				IFNULL(ANEA3.MAFAV, 0) +
				IFNULL(ANEA3.MAFAL, 0) +
				IFNULL(ANEA3.AUFNV, 0) +
				IFNULL(ANEA3.AUFNL, 0) -
				IFNULL(ANEA3.VERKO, 0),
				0))), 0) + 
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IF(IFNULL(ANEA4.ERLBT, 0) +
		  IFNULL(ANEP4.ANBTR, 0) +
		  IFNULL(ANEA4.AUFWV, 0) +
		  IFNULL(ANEA4.AUFWL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0) +
		  IFNULL(ANEA4.AUFNV, 0) +
		  IFNULL(ANEA4.AUFNL, 0) -
		  IFNULL(ANEA4.VERKO, 0) > 0,
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA4.ERLBT, 0) +
				IFNULL(ANEP4.ANBTR, 0) +
				IFNULL(ANEA4.AUFWV, 0) +
				IFNULL(ANEA4.AUFWL, 0) +
				IFNULL(ANEA4.NAFAL, 0) +
				IFNULL(ANEA4.NAFAV, 0) +
				IFNULL(ANEA4.SAFAL, 0) +
				IFNULL(ANEA4.SAFAV, 0) +
				IFNULL(ANEA4.AAFAL, 0) +
				IFNULL(ANEA4.AAFAV, 0) +
				IFNULL(ANEA4.MAFAV, 0) +
				IFNULL(ANEA4.MAFAL, 0) +
				IFNULL(ANEA4.AUFNV, 0) +
				IFNULL(ANEA4.AUFNL, 0) -
				IFNULL(ANEA4.VERKO, 0)),
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
				IFNULL(ANEA4.ERLBT, 0) +
				IFNULL(ANEP4.ANBTR, 0) +
				IFNULL(ANEA4.AUFWV, 0) +
				IFNULL(ANEA4.AUFWL, 0) +
				IFNULL(ANEA4.NAFAL, 0) +
				IFNULL(ANEA4.NAFAV, 0) +
				IFNULL(ANEA4.SAFAL, 0) +
				IFNULL(ANEA4.SAFAV, 0) +
				IFNULL(ANEA4.AAFAL, 0) +
				IFNULL(ANEA4.AAFAV, 0) +
				IFNULL(ANEA4.MAFAV, 0) +
				IFNULL(ANEA4.MAFAL, 0) +
				IFNULL(ANEA4.AUFNV, 0) +
				IFNULL(ANEA4.AUFNL, 0) -
				IFNULL(ANEA4.VERKO, 0),
				0))), 0)																																AS MEHERL,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * IFNULL(ANEA.VERKO, 0) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * IFNULL(ANEA2.VERKO, 0), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * IFNULL(ANEA3.VERKO, 0), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * IFNULL(ANEA4.VERKO, 0), 0)																	AS VERKO,
	  T093B.WAERS																																		AS WAERS,
	  ANEK.SGTXT																																		AS SGTXT,
	  ANLA.DEAKT																																		AS DEAKT,									
	  IF(ANLA.ZUGDT = 0, NULL, ANLA.ZUGDT)																												AS ZUGDT,	  
	  LANG.LANG_KEY																																		AS LANG_KEY,
	  ANLA.MANDT																																		AS MANDT,
	  ANLA.BUKRS																																		AS BUKRS,
	  ANEK.GJAHR																																		AS GJAHR,
	  T093C.AFAPL																																		AS AFAPL,
	  T001.KTOPL																																		AS KTOPL,
	  ANEK.LNRAN																																		AS LNRAN,
	  ANEP.BWASL																																		AS BWASL_O,
	  IFNULL(ANKB.XAFBE, '')																															AS XAFBE,
	  COALESCE(ANEP.BUZEI, ITEM.BUZEI, ANEK.BUZEI)																										AS BUZEI,
	  CONCAT_WS(' ', RPAD(ANLA.BUKRS, 9, ' '), RPAD(ANLA.ANLKL, 13, ' '), RPAD(ANLA.TXT50, 55, ' '), RPAD(ANLA.KTOGR, 13, ' '), DATE_FORMAT(ANLA.AKTIV, '%d.%m.%Y'))	AS ANLN1_TXT,
	  ANKT.TXK20																																						AS ANLKL_TXT,
	  TGSBT.GTEXT																																						AS GSBER_TXT,
	  CONCAT_WS(' ',RPAD(ADRC.NAME1, 45, ' '),RPAD(ADRC.NAME2, 45, ' '),RPAD(ADRC.CITY1, 45, ' '),RPAD(ADRC.POST_CODE1, 15, ' '),RPAD(ADRC.SORT1, 25, ' '),ADRC.SORT2)	AS WERKS_TXT,
	  CONCAT_WS(' ', RPAD(T499S.WERKS, 9, ' '), T499S.KTEXT)																											AS STORT_TXT,	
	  T087V.ANLUE_TXT																																					AS ANLUE_TXT,
	  CONCAT_WS(' ', RPAD(T001.BUKRS, 9, ' '), COALESCE(SKAT.TXT50, SKAT2.TXT50))																						AS KTANSW_TXT,
	  TABWT.BWATXT																																						AS BWASL_TXT
	FROM 
	  database_viewbuilding.FI___DERIVED_AREAS					AS AREA
	  LEFT JOIN database_dynamic.LANGUAGE_KEYS					AS LANG 	ON TRUE
	  JOIN database_final.ANEP									AS ANEP		ON (ANEP.MANDT = AREA.MANDT AND ANEP.BUKRS = AREA.BUKRS AND ANEP.AFABE = AREA.AFABE1)
	  LEFT JOIN database_final.ANEP								AS ANEP2 	ON (ANEP2.MANDT = ANEP.MANDT AND ANEP2.BUKRS = ANEP.BUKRS AND ANEP2.ANLN1 = ANEP.ANLN1 AND ANEP2.ANLN2 = ANEP.ANLN2 AND ANEP2.GJAHR = ANEP.GJAHR AND ANEP2.LNRAN = ANEP.LNRAN AND ANEP2.AFABE = AREA.AFABE2)
	  LEFT JOIN database_final.ANEP								AS ANEP3 	ON (ANEP3.MANDT = ANEP.MANDT AND ANEP3.BUKRS = ANEP.BUKRS AND ANEP3.ANLN1 = ANEP.ANLN1 AND ANEP3.ANLN2 = ANEP.ANLN2 AND ANEP3.GJAHR = ANEP.GJAHR AND ANEP3.LNRAN = ANEP.LNRAN AND ANEP3.AFABE = AREA.AFABE3)
	  LEFT JOIN database_final.ANEP								AS ANEP4 	ON (ANEP4.MANDT = ANEP.MANDT AND ANEP4.BUKRS = ANEP.BUKRS AND ANEP4.ANLN1 = ANEP.ANLN1 AND ANEP4.ANLN2 = ANEP.ANLN2 AND ANEP4.GJAHR = ANEP.GJAHR AND ANEP4.LNRAN = ANEP.LNRAN AND ANEP4.AFABE = AREA.AFABE4)
	  LEFT JOIN database_final.ANEA 							AS ANEA 	ON (ANEA.MANDT = ANEP.MANDT AND ANEA.BUKRS = ANEP.BUKRS AND ANEA.ANLN1 = ANEP.ANLN1 AND ANEA.ANLN2 = ANEP.ANLN2 AND ANEA.GJAHR = ANEP.GJAHR AND ANEA.LNRAN = ANEP.LNRAN AND ANEA.AFABE = ANEP.AFABE)
	  LEFT JOIN database_final.ANEA 							AS ANEA2 	ON (ANEA2.MANDT = ANEP2.MANDT AND ANEA2.BUKRS = ANEP2.BUKRS AND ANEA2.ANLN1 = ANEP2.ANLN1 AND ANEA2.ANLN2 = ANEP2.ANLN2 AND ANEA2.GJAHR = ANEP2.GJAHR AND ANEA2.LNRAN = ANEP2.LNRAN AND ANEA2.AFABE = ANEP2.AFABE)
	  LEFT JOIN database_final.ANEA 							AS ANEA3 	ON (ANEA3.MANDT = ANEP3.MANDT AND ANEA3.BUKRS = ANEP3.BUKRS AND ANEA3.ANLN1 = ANEP3.ANLN1 AND ANEA3.ANLN2 = ANEP3.ANLN2 AND ANEA3.GJAHR = ANEP3.GJAHR AND ANEA3.LNRAN = ANEP3.LNRAN AND ANEA3.AFABE = ANEP3.AFABE)
	  LEFT JOIN database_final.ANEA 							AS ANEA4 	ON (ANEA4.MANDT = ANEP4.MANDT AND ANEA4.BUKRS = ANEP4.BUKRS AND ANEA4.ANLN1 = ANEP4.ANLN1 AND ANEA4.ANLN2 = ANEP4.ANLN2 AND ANEA4.GJAHR = ANEP4.GJAHR AND ANEA4.LNRAN = ANEP4.LNRAN AND ANEA4.AFABE = ANEP4.AFABE)
	  LEFT JOIN database_final.T001								AS T001 	ON (T001.MANDT = ANEP.MANDT AND T001.BUKRS = ANEP.BUKRS)
	  LEFT JOIN database_final.T093C							AS T093C	ON (T093C.MANDT = ANEP.MANDT AND T093C.BUKRS = ANEP.BUKRS)
	  JOIN database_final.ANEK									AS ANEK 	ON (ANEK.MANDT = ANEP.MANDT AND ANEK.BUKRS = ANEP.BUKRS AND ANEK.ANLN1 = ANEP.ANLN1 AND ANEK.ANLN2 = ANEP.ANLN2 AND ANEK.GJAHR = ANEP.GJAHR AND ANEK.LNRAN = ANEP.LNRAN)
	  JOIN database_final.ANLA									AS ANLA 	ON (ANLA.MANDT = ANEP.MANDT AND ANLA.BUKRS = ANEP.BUKRS AND ANLA.ANLN1 = ANEP.ANLN1 AND ANLA.ANLN2 = ANEP.ANLN2)
	  JOIN database_final.ANLZ									AS ANLZ 	ON (ANLZ.MANDT = ANEP.MANDT AND ANLZ.BUKRS = ANEP.BUKRS AND ANLZ.ANLN1 = ANEP.ANLN1 AND ANLZ.ANLN2 = ANEP.ANLN2 AND database_dynamic.FI___GET_REPORT_DATE(ANEP.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP.GJAHR)) BETWEEN ANLZ.ADATU AND ANLZ.BDATU)
	  LEFT JOIN database_viewbuilding.FI___ASSET_DOCUMENT_ITEMS	AS ITEM		ON (ITEM.MANDT = ANEK.MANDT AND ITEM.BUKRS = ANEK.BUKRS AND ITEM.ANLN1 = ANEK.ANLN1 AND ITEM.ANLN2 = ANEK.ANLN2 AND ITEM.GJAHR = ANEK.GJAHR AND ITEM.LNRAN = ANEK.LNRAN)
	  LEFT JOIN database_final.ANLB								AS ANLB 	ON (ANLB.MANDT = ANEP.MANDT AND ANLB.BUKRS = ANEP.BUKRS AND ANLB.ANLN1 = ANEP.ANLN1 AND ANLB.ANLN2 = ANEP.ANLN2 AND ANLB.AFABE = ANEP.AFABE AND database_dynamic.FI___GET_REPORT_DATE(ANEP.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP.GJAHR)) BETWEEN ANLB.ADATU AND ANLB.BDATU)
	  LEFT JOIN database_final.ANKB								AS ANKB		ON (ANKB.MANDT = ANEP.MANDT AND ANKB.ANLKL = ANLA.ANLKL AND ANKB.AFAPL = T093C.AFAPL AND ANKB.AFABE = AREA.AFABER AND database_dynamic.FI___GET_REPORT_DATE(ANEP.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP.GJAHR)) BETWEEN ANKB.ADATU AND ANKB.BDATU)
	  LEFT JOIN database_final.TKA02							AS TKA02 	ON (TKA02.MANDT = ANLZ.MANDT AND TKA02.BUKRS = ANLZ.BUKRS AND TKA02.GSBER = ANLZ.GSBER)
	  LEFT JOIN database_final.TKA02							AS TKA02B 	ON (TKA02B.MANDT = ANLZ.MANDT AND TKA02B.BUKRS = ANLZ.BUKRS AND TKA02B.GSBER = '')
	  LEFT JOIN database_final.T093B							AS T093B	ON (T093B.MANDT = ANEP.MANDT AND T093B.BUKRS = ANEP.BUKRS AND T093B.AFABE = ANEP.AFABE)
	  LEFT JOIN database_final.T095P							AS T095 	ON (T095.MANDT = ANEP.MANDT AND T095.KTOPL = T001.KTOPL AND T095.KTOGR = ANLA.KTOGR AND IFNULL(T095.AFASL, '') = IFNULL(ANLB.AFASL, '') AND T095.AFABER = AREA.AFABER)
	  LEFT JOIN database_final.T093								AS T093V	ON (T093V.MANDT = ANEP.MANDT AND T093V.AFAPL = T093C.AFAPL AND T093V.AFABER = ANEP.AFABE)
	  LEFT JOIN database_final.T093								AS T093X	ON (T093X.MANDT = ANEP.MANDT AND T093X.AFAPL = T093C.AFAPL AND T093X.AFABER = ANEP2.AFABE)
	  LEFT JOIN database_final.T093								AS T093Y	ON (T093Y.MANDT = ANEP.MANDT AND T093Y.AFAPL = T093C.AFAPL AND T093Y.AFABER = ANEP3.AFABE)
	  LEFT JOIN database_final.T093								AS T093Z	ON (T093Z.MANDT = ANEP.MANDT AND T093Z.AFAPL = T093C.AFAPL AND T093Z.AFABER = ANEP4.AFABE)
	  LEFT JOIN database_final.T095								AS T095B	ON (T095B.MANDT = ANEP.MANDT AND T095B.KTOPL = T001.KTOPL AND T095B.KTOGR = ANLA.KTOGR AND T095B.AFABE = ANEP.AFABE)
	  LEFT JOIN database_final.T095								AS T095C	ON (T095C.MANDT = ANEP.MANDT AND T095C.KTOPL = T001.KTOPL AND T095C.KTOGR = ANLA.KTOGR AND T095C.AFABE = ANEP2.AFABE)
	  LEFT JOIN database_final.T095								AS T095D	ON (T095D.MANDT = ANEP.MANDT AND T095D.KTOPL = T001.KTOPL AND T095D.KTOGR = ANLA.KTOGR AND T095D.AFABE = ANEP3.AFABE)
	  LEFT JOIN database_final.T095								AS T095E	ON (T095E.MANDT = ANEP.MANDT AND T095E.KTOPL = T001.KTOPL AND T095E.KTOGR = ANLA.KTOGR AND T095E.AFABE = ANEP4.AFABE)
	  LEFT JOIN database_final.T095								AS T095F	ON (T095F.MANDT = ANEP.MANDT AND T095F.KTOPL = T001.KTOPL AND T095F.KTOGR = ANLA.KTOGR AND T095F.AFABE = 1)  
	  LEFT JOIN database_final.T006A							AS T006A 	ON (T006A.MANDT = ANEP.MANDT AND T006A.MSEHI = ANEK.MEINS AND T006A.SPRAS = LANG.LANG_KEY)
      LEFT JOIN database_final.ANKT								AS ANKT 	ON (ANKT.MANDT = ANLA.MANDT AND ANKT.ANLKL = ANLA.ANLKL AND ANKT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.TGSBT							AS TGSBT 	ON (TGSBT.MANDT = ANLA.MANDT AND TGSBT.GSBER = ANLZ.GSBER AND TGSBT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.T001W							AS T001W 	ON (T001W.MANDT = ANLZ.MANDT AND T001W.WERKS = ANLZ.WERKS)
	  LEFT JOIN database_final.T499S							AS T499S 	ON (T499S.MANDT = ANLZ.MANDT AND T499S.WERKS = ANLZ.WERKS AND T499S.STAND = ANLZ.STORT)
	  LEFT JOIN database_final.T087V							AS T087V 	ON (T087V.MANDT = ANLA.MANDT AND T087V.ANLUE = ANLA.ANLUE AND T087V.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.T004								AS T004		ON (T004.MANDT = T001.MANDT	AND T004.KTOPL = T001.KTOPL)
	  LEFT JOIN database_final.SKAT								AS SKAT		ON (SKAT.MANDT = ANEP.MANDT AND SKAT.KTOPL = T001.KTOPL AND SKAT.SAKNR = COALESCE(IF(T095.KTSOPO != '', T095.KTSOPO, NULL), IF(T093V.BUHBKT != '0', T095B.KTANSW, IF(T093V.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093X.BUHBKT != '0', T095C.KTANSW, IF(T093X.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Y.BUHBKT != '0', T095D.KTANSW, IF(T093Y.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Z.BUHBKT != '0', T095E.KTANSW, IF(T093Z.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), T095F.KTANSW) AND SKAT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.SKAT								AS SKAT2 	ON (SKAT2.MANDT = ANEP.MANDT AND SKAT2.KTOPL = T001.KTOPL AND SKAT2.SAKNR = COALESCE(IF(T095.KTSOPO != '', T095.KTSOPO, NULL), IF(T093V.BUHBKT != '0', T095B.KTANSW, IF(T093V.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093X.BUHBKT != '0', T095C.KTANSW, IF(T093X.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Y.BUHBKT != '0', T095D.KTANSW, IF(T093Y.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Z.BUHBKT != '0', T095E.KTANSW, IF(T093Z.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), T095F.KTANSW) AND BINARY(SKAT2.SPRAS) = BINARY(T004.DSPRA))
	  LEFT JOIN database_final.TABWT							AS TABWT 	ON (TABWT.MANDT = ANEP.MANDT AND TABWT.BWASL = ANEP.BWASL AND TABWT.SPRAS = LANG.LANG_KEY)	  
	  LEFT JOIN database_final.T093T							AS T093T	ON (T093T.MANDT = ANEP.MANDT AND T093T.AFAPL = T093C.AFAPL AND T093T.AFABER = AREA.AFABER AND T093T.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.ADRC								AS ADRC		ON (ADRC.CLIENT = T001W.MANDT AND ADRC.ADDRNUMBER = T001W.ADRNR AND ADRC.NATION = '')	
	WHERE
	  IFNULL(ANLB.ANLGR, '') = '' AND 
	  IFNULL(ANLA.XLOEV, '') = '' AND
	  (ANLA.DEAKT = 0 OR database_dynamic.FI___GET_FISCAL_YEAR(ANLA.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANLA.DEAKT) >= ANEP.GJAHR)
	  
  UNION
  
  SELECT
	  ANEP2.ANLN1																																			AS ANLN1,
	  ANEP2.ANLN2																																			AS ANLN2,
	  ANLA.AKTIV						 																													AS AKTIV,
	  ANLA.TXT50 																																			AS ANLN_TXT,
	  ANLA.TXA50 																																			AS ANLN_TXT2,
	  ANEK.BUDAT						 																													AS BUDAT,
	  IFNULL(ANEP.BWASL, ANEP2.BWASL)																														AS BWASL,
	  IF(ANEP2.BZDAT = 0, NULL, ANEP2.BZDAT) 																												AS BZDAT,
	  ANEK.XBLNR																																			AS XBLNR,
	  IF(ANEK.MENGE != 0, ANEK.MENGE, NULL)																													AS MENGE,
	  IFNULL(T006A.MSEH3, ANEK.MEINS)																														AS MSEH3,
	  IFNULL(database_dynamic.FI___GET_ACCOUNTING_DOCUMENT(ANEP2.MANDT, ANEK.BUKRS, ANEK.GJAHR, ANEK.AWTYP, CONCAT(ANEK.BELNR, ANEK.AWORG)), ANEP2.BELNR)	AS BELNR,
	  ANLA.ANLKL																																			AS ANLKL,
	  ANLZ.KOSTL																																			AS KOSTL,
	  ANLZ.WERKS																																			AS WERKS,
	  ANLZ.STORT																																			AS STORT,
	  ANLZ.GSBER																																			AS GSBER,
	  COALESCE(IF(T095.KTSOPO != '', T095.KTSOPO, NULL), 				
			   IF(T093V.BUHBKT != '0', T095B.KTANSW, IF(T093V.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)),
			   IF(T093X.BUHBKT != '0', T095C.KTANSW, IF(T093X.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)),
			   IF(T093Y.BUHBKT != '0', T095D.KTANSW, IF(T093Y.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)),
			   IF(T093Z.BUHBKT != '0', T095E.KTANSW, IF(T093Z.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)),
			   T095F.KTANSW)																																AS KTANSW,
	  ANLA.ANLUE																																			AS ANLUE,
	  CAST(AREA.AFABER AS UNSIGNED)																															AS AFABE,
	  T093T.AFBTXT																																			AS AFABE_TXT,
	  database_dynamic.FI___GET_REPORT_DATE(ANEK.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), 
		ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEK.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEK.GJAHR))					AS REPORT_DATE,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IFNULL(ANEA.AUFWL, 0) +
	      IFNULL(ANEA.AUFWV, 0) +
	      IFNULL(ANEP.ANBTR, 0)) +
	    IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
	      IFNULL(ANEP2.ANBTR, 0)), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IFNULL(ANEA3.AUFWL, 0) +
	      IFNULL(ANEA3.AUFWV, 0) +
	      IFNULL(ANEP3.ANBTR, 0)), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IFNULL(ANEA4.AUFWL, 0) +
	      IFNULL(ANEA4.AUFWV, 0) +
	      IFNULL(ANEP4.ANBTR, 0)), 0)																														AS ANBTR,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0)) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IFNULL(ANEA2.AUFNV, 0) +
	      IFNULL(ANEA2.AUFNL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IFNULL(ANEA3.AUFNV, 0) +
	      IFNULL(ANEA3.AUFNL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IFNULL(ANEA4.AUFNV, 0) +
	      IFNULL(ANEA4.AUFNL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0)), 0)																														AS ANAFA,
      IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IFNULL(ANEA.AUFWL, 0) +
		  IFNULL(ANEA.AUFWV, 0) +
		  IFNULL(ANEP.ANBTR, 0) +
		  IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0)) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
		  IFNULL(ANEP2.ANBTR, 0) +
		  IFNULL(ANEA2.AUFNV, 0) +
		  IFNULL(ANEA2.AUFNL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IFNULL(ANEA3.AUFWL, 0) +
		  IFNULL(ANEA3.AUFWV, 0) +
		  IFNULL(ANEP3.ANBTR, 0) +
		  IFNULL(ANEA3.AUFNV, 0) +
		  IFNULL(ANEA3.AUFNL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IFNULL(ANEA4.AUFWL, 0) +
		  IFNULL(ANEA4.AUFWV, 0) +
		  IFNULL(ANEP4.ANBTR, 0) +
		  IFNULL(ANEA4.AUFNV, 0) +
		  IFNULL(ANEA4.AUFNL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0)), 0)																														AS BOOKA,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * IFNULL(ANEA.ERLBT, 0) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * IFNULL(ANEA2.ERLBT, 0), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * IFNULL(ANEA3.ERLBT, 0), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * IFNULL(ANEA4.ERLBT, 0), 0)																		AS ERLBT,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IF(IFNULL(ANEA.ERLBT, 0) +
		  IFNULL(ANEP.ANBTR, 0) +
		  IFNULL(ANEA.AUFWV, 0) +
		  IFNULL(ANEA.AUFWL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0) +
		  IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) -
		  IFNULL(ANEA.VERKO, 0) > 0,
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
			   IFNULL(ANEA.ERLBT, 0) +
			   IFNULL(ANEP.ANBTR, 0) +
			   IFNULL(ANEA.AUFWV, 0) +
			   IFNULL(ANEA.AUFWL, 0) +
			   IFNULL(ANEA.NAFAL, 0) +
			   IFNULL(ANEA.NAFAV, 0) +
			   IFNULL(ANEA.SAFAL, 0) +
			   IFNULL(ANEA.SAFAV, 0) +
			   IFNULL(ANEA.AAFAL, 0) +
			   IFNULL(ANEA.AAFAV, 0) +
			   IFNULL(ANEA.MAFAV, 0) +
			   IFNULL(ANEA.MAFAL, 0) +
			   IFNULL(ANEA.AUFNV, 0) +
			   IFNULL(ANEA.AUFNL, 0) -
			   IFNULL(ANEA.VERKO, 0),
			   0),
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA.ERLBT, 0) +
			   IFNULL(ANEP.ANBTR, 0) +
			   IFNULL(ANEA.AUFWV, 0) +
			   IFNULL(ANEA.AUFWL, 0) +
			   IFNULL(ANEA.NAFAL, 0) +
			   IFNULL(ANEA.NAFAV, 0) +
			   IFNULL(ANEA.SAFAL, 0) +
			   IFNULL(ANEA.SAFAV, 0) +
			   IFNULL(ANEA.AAFAL, 0) +
			   IFNULL(ANEA.AAFAV, 0) +
			   IFNULL(ANEA.MAFAV, 0) +
			   IFNULL(ANEA.MAFAL, 0) +
			   IFNULL(ANEA.AUFNV, 0) +
			   IFNULL(ANEA.AUFNL, 0) -
			   IFNULL(ANEA.VERKO, 0)))) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IF(IFNULL(ANEA2.ERLBT, 0) +
		  IFNULL(ANEP2.ANBTR, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
		  IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0) +
		  IFNULL(ANEA2.AUFNV, 0) +
		  IFNULL(ANEA2.AUFNL, 0) -
		  IFNULL(ANEA2.VERKO, 0) > 0,
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
			   IFNULL(ANEA2.ERLBT, 0) +
			   IFNULL(ANEP2.ANBTR, 0) +
			   IFNULL(ANEA2.AUFWV, 0) +
			   IFNULL(ANEA2.AUFWL, 0) +
			   IFNULL(ANEA2.NAFAL, 0) +
			   IFNULL(ANEA2.NAFAV, 0) +
			   IFNULL(ANEA2.SAFAL, 0) +
			   IFNULL(ANEA2.SAFAV, 0) +
			   IFNULL(ANEA2.AAFAL, 0) +
			   IFNULL(ANEA2.AAFAV, 0) +
			   IFNULL(ANEA2.MAFAV, 0) +
			   IFNULL(ANEA2.MAFAL, 0) +
			   IFNULL(ANEA2.AUFNV, 0) +
			   IFNULL(ANEA2.AUFNL, 0) -
			   IFNULL(ANEA2.VERKO, 0),
			   0),
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA2.ERLBT, 0) +
			   IFNULL(ANEP2.ANBTR, 0) +
			   IFNULL(ANEA2.AUFWV, 0) +
			   IFNULL(ANEA2.AUFWL, 0) +
			   IFNULL(ANEA2.NAFAL, 0) +
			   IFNULL(ANEA2.NAFAV, 0) +
			   IFNULL(ANEA2.SAFAL, 0) +
			   IFNULL(ANEA2.SAFAV, 0) +
			   IFNULL(ANEA2.AAFAL, 0) +
			   IFNULL(ANEA2.AAFAV, 0) +
			   IFNULL(ANEA2.MAFAV, 0) +
			   IFNULL(ANEA2.MAFAL, 0) +
			   IFNULL(ANEA2.AUFNV, 0) +
			   IFNULL(ANEA2.AUFNL, 0) -
			   IFNULL(ANEA2.VERKO, 0)))), 0) + 
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IF(IFNULL(ANEA3.ERLBT, 0) +
		  IFNULL(ANEP3.ANBTR, 0) +
		  IFNULL(ANEA3.AUFWV, 0) +
		  IFNULL(ANEA3.AUFWL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0) +
		  IFNULL(ANEA3.AUFNV, 0) +
		  IFNULL(ANEA3.AUFNL, 0) -
		  IFNULL(ANEA3.VERKO, 0) > 0,
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
			   IFNULL(ANEA3.ERLBT, 0) +
			   IFNULL(ANEP3.ANBTR, 0) +
			   IFNULL(ANEA3.AUFWV, 0) +
			   IFNULL(ANEA3.AUFWL, 0) +
			   IFNULL(ANEA3.NAFAL, 0) +
			   IFNULL(ANEA3.NAFAV, 0) +
			   IFNULL(ANEA3.SAFAL, 0) +
			   IFNULL(ANEA3.SAFAV, 0) +
			   IFNULL(ANEA3.AAFAL, 0) +
			   IFNULL(ANEA3.AAFAV, 0) +
			   IFNULL(ANEA3.MAFAV, 0) +
			   IFNULL(ANEA3.MAFAL, 0) +
			   IFNULL(ANEA3.AUFNV, 0) +
			   IFNULL(ANEA3.AUFNL, 0) -
			   IFNULL(ANEA3.VERKO, 0),
			   0),
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA3.ERLBT, 0) +
			   IFNULL(ANEP3.ANBTR, 0) +
			   IFNULL(ANEA3.AUFWV, 0) +
			   IFNULL(ANEA3.AUFWL, 0) +
			   IFNULL(ANEA3.NAFAL, 0) +
			   IFNULL(ANEA3.NAFAV, 0) +
			   IFNULL(ANEA3.SAFAL, 0) +
			   IFNULL(ANEA3.SAFAV, 0) +
			   IFNULL(ANEA3.AAFAL, 0) +
			   IFNULL(ANEA3.AAFAV, 0) +
			   IFNULL(ANEA3.MAFAV, 0) +
			   IFNULL(ANEA3.MAFAL, 0) +
			   IFNULL(ANEA3.AUFNV, 0) +
			   IFNULL(ANEA3.AUFNL, 0) -
			   IFNULL(ANEA3.VERKO, 0)))), 0) + 
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IF(IFNULL(ANEA4.ERLBT, 0) +
		  IFNULL(ANEP4.ANBTR, 0) +
		  IFNULL(ANEA4.AUFWV, 0) +
		  IFNULL(ANEA4.AUFWL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0) +
		  IFNULL(ANEA4.AUFNV, 0) +
		  IFNULL(ANEA4.AUFNL, 0) -
		  IFNULL(ANEA4.VERKO, 0) > 0,
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
			   IFNULL(ANEA4.ERLBT, 0) +
			   IFNULL(ANEP4.ANBTR, 0) +
			   IFNULL(ANEA4.AUFWV, 0) +
			   IFNULL(ANEA4.AUFWL, 0) +
			   IFNULL(ANEA4.NAFAL, 0) +
			   IFNULL(ANEA4.NAFAV, 0) +
			   IFNULL(ANEA4.SAFAL, 0) +
			   IFNULL(ANEA4.SAFAV, 0) +
			   IFNULL(ANEA4.AAFAL, 0) +
			   IFNULL(ANEA4.AAFAV, 0) +
			   IFNULL(ANEA4.MAFAV, 0) +
			   IFNULL(ANEA4.MAFAL, 0) +
			   IFNULL(ANEA4.AUFNV, 0) +
			   IFNULL(ANEA4.AUFNL, 0) -
			   IFNULL(ANEA4.VERKO, 0),
			   0),
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA4.ERLBT, 0) +
			   IFNULL(ANEP4.ANBTR, 0) +
			   IFNULL(ANEA4.AUFWV, 0) +
			   IFNULL(ANEA4.AUFWL, 0) +
			   IFNULL(ANEA4.NAFAL, 0) +
			   IFNULL(ANEA4.NAFAV, 0) +
			   IFNULL(ANEA4.SAFAL, 0) +
			   IFNULL(ANEA4.SAFAV, 0) +
			   IFNULL(ANEA4.AAFAL, 0) +
			   IFNULL(ANEA4.AAFAV, 0) +
			   IFNULL(ANEA4.MAFAV, 0) +
			   IFNULL(ANEA4.MAFAL, 0) +
			   IFNULL(ANEA4.AUFNV, 0) +
			   IFNULL(ANEA4.AUFNL, 0) -
			   IFNULL(ANEA4.VERKO, 0)))), 0)																												AS MINERL,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IF(IFNULL(ANEA.ERLBT, 0) +
		  IFNULL(ANEP.ANBTR, 0) +
		  IFNULL(ANEA.AUFWV, 0) +
		  IFNULL(ANEA.AUFWL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0) +
		  IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) -
		  IFNULL(ANEA.VERKO, 0) > 0,
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA.ERLBT, 0) +
				IFNULL(ANEP.ANBTR, 0) +
				IFNULL(ANEA.AUFWV, 0) +
				IFNULL(ANEA.AUFWL, 0) +
				IFNULL(ANEA.NAFAL, 0) +
				IFNULL(ANEA.NAFAV, 0) +
				IFNULL(ANEA.SAFAL, 0) +
				IFNULL(ANEA.SAFAV, 0) +
				IFNULL(ANEA.AAFAL, 0) +
				IFNULL(ANEA.AAFAV, 0) +
				IFNULL(ANEA.MAFAV, 0) +
				IFNULL(ANEA.MAFAL, 0) +
				IFNULL(ANEA.AUFNV, 0) +
				IFNULL(ANEA.AUFNL, 0) -
				IFNULL(ANEA.VERKO, 0)),
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
				IFNULL(ANEA.ERLBT, 0) +
				IFNULL(ANEP.ANBTR, 0) +
				IFNULL(ANEA.AUFWV, 0) +
				IFNULL(ANEA.AUFWL, 0) +
				IFNULL(ANEA.NAFAL, 0) +
				IFNULL(ANEA.NAFAV, 0) +
				IFNULL(ANEA.SAFAL, 0) +
				IFNULL(ANEA.SAFAV, 0) +
				IFNULL(ANEA.AAFAL, 0) +
				IFNULL(ANEA.AAFAV, 0) +
				IFNULL(ANEA.MAFAV, 0) +
				IFNULL(ANEA.MAFAL, 0) +
				IFNULL(ANEA.AUFNV, 0) +
				IFNULL(ANEA.AUFNL, 0) -
				IFNULL(ANEA.VERKO, 0),
				0))) + 
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IF(IFNULL(ANEA2.ERLBT, 0) +
		  IFNULL(ANEP2.ANBTR, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
		  IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0) +
		  IFNULL(ANEA2.AUFNV, 0) +
		  IFNULL(ANEA2.AUFNL, 0) -
		  IFNULL(ANEA2.VERKO, 0) > 0,
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA2.ERLBT, 0) +
				IFNULL(ANEP2.ANBTR, 0) +
				IFNULL(ANEA2.AUFWV, 0) +
				IFNULL(ANEA2.AUFWL, 0) +
				IFNULL(ANEA2.NAFAL, 0) +
				IFNULL(ANEA2.NAFAV, 0) +
				IFNULL(ANEA2.SAFAL, 0) +
				IFNULL(ANEA2.SAFAV, 0) +
				IFNULL(ANEA2.AAFAL, 0) +
				IFNULL(ANEA2.AAFAV, 0) +
				IFNULL(ANEA2.MAFAV, 0) +
				IFNULL(ANEA2.MAFAL, 0) +
				IFNULL(ANEA2.AUFNV, 0) +
				IFNULL(ANEA2.AUFNL, 0) -
				IFNULL(ANEA2.VERKO, 0)),
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
				IFNULL(ANEA2.ERLBT, 0) +
				IFNULL(ANEP2.ANBTR, 0) +
				IFNULL(ANEA2.AUFWV, 0) +
				IFNULL(ANEA2.AUFWL, 0) +
				IFNULL(ANEA2.NAFAL, 0) +
				IFNULL(ANEA2.NAFAV, 0) +
				IFNULL(ANEA2.SAFAL, 0) +
				IFNULL(ANEA2.SAFAV, 0) +
				IFNULL(ANEA2.AAFAL, 0) +
				IFNULL(ANEA2.AAFAV, 0) +
				IFNULL(ANEA2.MAFAV, 0) +
				IFNULL(ANEA2.MAFAL, 0) +
				IFNULL(ANEA2.AUFNV, 0) +
				IFNULL(ANEA2.AUFNL, 0) -
				IFNULL(ANEA2.VERKO, 0),
				0))), 0) + 
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IF(IFNULL(ANEA3.ERLBT, 0) +
		  IFNULL(ANEP3.ANBTR, 0) +
		  IFNULL(ANEA3.AUFWV, 0) +
		  IFNULL(ANEA3.AUFWL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0) +
		  IFNULL(ANEA3.AUFNV, 0) +
		  IFNULL(ANEA3.AUFNL, 0) -
		  IFNULL(ANEA3.VERKO, 0) > 0,
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA3.ERLBT, 0) +
				IFNULL(ANEP3.ANBTR, 0) +
				IFNULL(ANEA3.AUFWV, 0) +
				IFNULL(ANEA3.AUFWL, 0) +
				IFNULL(ANEA3.NAFAL, 0) +
				IFNULL(ANEA3.NAFAV, 0) +
				IFNULL(ANEA3.SAFAL, 0) +
				IFNULL(ANEA3.SAFAV, 0) +
				IFNULL(ANEA3.AAFAL, 0) +
				IFNULL(ANEA3.AAFAV, 0) +
				IFNULL(ANEA3.MAFAV, 0) +
				IFNULL(ANEA3.MAFAL, 0) +
				IFNULL(ANEA3.AUFNV, 0) +
				IFNULL(ANEA3.AUFNL, 0) -
				IFNULL(ANEA3.VERKO, 0)),
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
				IFNULL(ANEA3.ERLBT, 0) +
				IFNULL(ANEP3.ANBTR, 0) +
				IFNULL(ANEA3.AUFWV, 0) +
				IFNULL(ANEA3.AUFWL, 0) +
				IFNULL(ANEA3.NAFAL, 0) +
				IFNULL(ANEA3.NAFAV, 0) +
				IFNULL(ANEA3.SAFAL, 0) +
				IFNULL(ANEA3.SAFAV, 0) +
				IFNULL(ANEA3.AAFAL, 0) +
				IFNULL(ANEA3.AAFAV, 0) +
				IFNULL(ANEA3.MAFAV, 0) +
				IFNULL(ANEA3.MAFAL, 0) +
				IFNULL(ANEA3.AUFNV, 0) +
				IFNULL(ANEA3.AUFNL, 0) -
				IFNULL(ANEA3.VERKO, 0),
				0))), 0) + 
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IF(IFNULL(ANEA4.ERLBT, 0) +
		  IFNULL(ANEP4.ANBTR, 0) +
		  IFNULL(ANEA4.AUFWV, 0) +
		  IFNULL(ANEA4.AUFWL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0) +
		  IFNULL(ANEA4.AUFNV, 0) +
		  IFNULL(ANEA4.AUFNL, 0) -
		  IFNULL(ANEA4.VERKO, 0) > 0,
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA4.ERLBT, 0) +
				IFNULL(ANEP4.ANBTR, 0) +
				IFNULL(ANEA4.AUFWV, 0) +
				IFNULL(ANEA4.AUFWL, 0) +
				IFNULL(ANEA4.NAFAL, 0) +
				IFNULL(ANEA4.NAFAV, 0) +
				IFNULL(ANEA4.SAFAL, 0) +
				IFNULL(ANEA4.SAFAV, 0) +
				IFNULL(ANEA4.AAFAL, 0) +
				IFNULL(ANEA4.AAFAV, 0) +
				IFNULL(ANEA4.MAFAV, 0) +
				IFNULL(ANEA4.MAFAL, 0) +
				IFNULL(ANEA4.AUFNV, 0) +
				IFNULL(ANEA4.AUFNL, 0) -
				IFNULL(ANEA4.VERKO, 0)),
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
				IFNULL(ANEA4.ERLBT, 0) +
				IFNULL(ANEP4.ANBTR, 0) +
				IFNULL(ANEA4.AUFWV, 0) +
				IFNULL(ANEA4.AUFWL, 0) +
				IFNULL(ANEA4.NAFAL, 0) +
				IFNULL(ANEA4.NAFAV, 0) +
				IFNULL(ANEA4.SAFAL, 0) +
				IFNULL(ANEA4.SAFAV, 0) +
				IFNULL(ANEA4.AAFAL, 0) +
				IFNULL(ANEA4.AAFAV, 0) +
				IFNULL(ANEA4.MAFAV, 0) +
				IFNULL(ANEA4.MAFAL, 0) +
				IFNULL(ANEA4.AUFNV, 0) +
				IFNULL(ANEA4.AUFNL, 0) -
				IFNULL(ANEA4.VERKO, 0),
				0))), 0)																																	AS MEHERL,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * IFNULL(ANEA.VERKO, 0) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * IFNULL(ANEA2.VERKO, 0), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * IFNULL(ANEA3.VERKO, 0), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * IFNULL(ANEA4.VERKO, 0), 0)																		AS VERKO,
	  T093B.WAERS																																			AS WAERS,
	  ANEK.SGTXT																																			AS SGTXT,
	  ANLA.DEAKT																																			AS DEAKT,									
	  IF(ANLA.ZUGDT = 0, NULL, ANLA.ZUGDT)																													AS ZUGDT,	  
	  LANG.LANG_KEY																																			AS LANG_KEY,
	  ANLA.MANDT																																			AS MANDT,
	  ANLA.BUKRS																																			AS BUKRS,
	  ANEK.GJAHR																																			AS GJAHR,
	  T093C.AFAPL																																			AS AFAPL,
	  T001.KTOPL																																			AS KTOPL,
	  ANEK.LNRAN																																			AS LNRAN,
	  ANEP2.BWASL																																			AS BWASL_O,
	  IFNULL(ANKB.XAFBE, '')																																AS XAFBE,
	  COALESCE(ANEP2.BUZEI, ITEM.BUZEI, ANEK.BUZEI)																											AS BUZEI,
	  CONCAT_WS(' ', RPAD(ANLA.BUKRS, 9, ' '), RPAD(ANLA.ANLKL, 13, ' '), RPAD(ANLA.TXT50, 55, ' '), RPAD(ANLA.KTOGR, 13, ' '), DATE_FORMAT(ANLA.AKTIV, '%d.%m.%Y'))	AS ANLN1_TXT,	
	  ANKT.TXK20																																						AS ANLKL_TXT,
	  TGSBT.GTEXT																																						AS GSBER_TXT,
	  CONCAT_WS(' ',RPAD(ADRC.NAME1, 45, ' '),RPAD(ADRC.NAME2, 45, ' '),RPAD(ADRC.CITY1, 45, ' '),RPAD(ADRC.POST_CODE1, 15, ' '),RPAD(ADRC.SORT1, 25, ' '),ADRC.SORT2)	AS WERKS_TXT,
	  CONCAT_WS(' ', RPAD(T499S.WERKS, 9, ' '), T499S.KTEXT)																											AS STORT_TXT,
	  T087V.ANLUE_TXT																																					AS ANLUE_TXT,
	  CONCAT_WS(' ', RPAD(T001.BUKRS, 9, ' '), COALESCE(SKAT.TXT50, SKAT2.TXT50))																						AS KTANSW_TXT,
	  TABWT.BWATXT																																						AS BWASL_TXT
	FROM 
	  database_viewbuilding.FI___DERIVED_AREAS					AS AREA
	  LEFT JOIN database_dynamic.LANGUAGE_KEYS					AS LANG 	ON TRUE
	  JOIN database_final.ANEP									AS ANEP2	ON (ANEP2.MANDT = AREA.MANDT AND ANEP2.BUKRS = AREA.BUKRS AND ANEP2.AFABE = AREA.AFABE2)
	  LEFT JOIN database_final.ANEP								AS ANEP 	ON (ANEP.MANDT = AREA.MANDT AND ANEP.BUKRS = ANEP2.BUKRS AND ANEP.ANLN1 = ANEP2.ANLN1 AND ANEP.ANLN2 = ANEP2.ANLN2 AND ANEP.GJAHR = ANEP2.GJAHR AND ANEP.LNRAN = ANEP2.LNRAN AND ANEP.AFABE = AREA.AFABE1)
	  LEFT JOIN database_final.ANEP								AS ANEP3 	ON (ANEP3.MANDT = ANEP2.MANDT AND ANEP3.BUKRS = ANEP2.BUKRS AND ANEP3.ANLN1 = ANEP2.ANLN1 AND ANEP3.ANLN2 = ANEP2.ANLN2 AND ANEP3.GJAHR = ANEP2.GJAHR AND ANEP3.LNRAN = ANEP2.LNRAN AND ANEP3.AFABE = AREA.AFABE3)
	  LEFT JOIN database_final.ANEP								AS ANEP4 	ON (ANEP4.MANDT = ANEP2.MANDT AND ANEP4.BUKRS = ANEP2.BUKRS AND ANEP4.ANLN1 = ANEP2.ANLN1 AND ANEP4.ANLN2 = ANEP2.ANLN2 AND ANEP4.GJAHR = ANEP2.GJAHR AND ANEP4.LNRAN = ANEP2.LNRAN AND ANEP4.AFABE = AREA.AFABE4)
	  LEFT JOIN database_final.ANEA 							AS ANEA 	ON (ANEA.MANDT = ANEP.MANDT AND ANEA.BUKRS = ANEP.BUKRS AND ANEA.ANLN1 = ANEP.ANLN1 AND ANEA.ANLN2 = ANEP.ANLN2 AND ANEA.GJAHR = ANEP.GJAHR AND ANEA.LNRAN = ANEP.LNRAN AND ANEA.AFABE = ANEP.AFABE)
	  LEFT JOIN database_final.ANEA 							AS ANEA2 	ON (ANEA2.MANDT = ANEP2.MANDT AND ANEA2.BUKRS = ANEP2.BUKRS AND ANEA2.ANLN1 = ANEP2.ANLN1 AND ANEA2.ANLN2 = ANEP2.ANLN2 AND ANEA2.GJAHR = ANEP2.GJAHR AND ANEA2.LNRAN = ANEP2.LNRAN AND ANEA2.AFABE = ANEP2.AFABE)
	  LEFT JOIN database_final.ANEA 							AS ANEA3 	ON (ANEA3.MANDT = ANEP3.MANDT AND ANEA3.BUKRS = ANEP3.BUKRS AND ANEA3.ANLN1 = ANEP3.ANLN1 AND ANEA3.ANLN2 = ANEP3.ANLN2 AND ANEA3.GJAHR = ANEP3.GJAHR AND ANEA3.LNRAN = ANEP3.LNRAN AND ANEA3.AFABE = ANEP3.AFABE)
	  LEFT JOIN database_final.ANEA 							AS ANEA4 	ON (ANEA4.MANDT = ANEP4.MANDT AND ANEA4.BUKRS = ANEP4.BUKRS AND ANEA4.ANLN1 = ANEP4.ANLN1 AND ANEA4.ANLN2 = ANEP4.ANLN2 AND ANEA4.GJAHR = ANEP4.GJAHR AND ANEA4.LNRAN = ANEP4.LNRAN AND ANEA4.AFABE = ANEP4.AFABE)
	  LEFT JOIN database_final.T001								AS T001 	ON (T001.MANDT = ANEP2.MANDT AND T001.BUKRS = ANEP2.BUKRS)
	  LEFT JOIN database_final.T093C							AS T093C	ON (T093C.MANDT = ANEP2.MANDT AND T093C.BUKRS = ANEP2.BUKRS)
	  JOIN database_final.ANEK									AS ANEK 	ON (ANEK.MANDT = ANEP2.MANDT AND ANEK.BUKRS = ANEP2.BUKRS AND ANEK.ANLN1 = ANEP2.ANLN1 AND ANEK.ANLN2 = ANEP2.ANLN2 AND ANEK.GJAHR = ANEP2.GJAHR AND ANEK.LNRAN = ANEP2.LNRAN)
	  JOIN database_final.ANLA									AS ANLA 	ON (ANLA.MANDT = ANEP2.MANDT AND ANLA.BUKRS = ANEP2.BUKRS AND ANLA.ANLN1 = ANEP2.ANLN1 AND ANLA.ANLN2 = ANEP2.ANLN2)
	  JOIN database_final.ANLZ									AS ANLZ 	ON (ANLZ.MANDT = ANEP2.MANDT AND ANLZ.BUKRS = ANEP2.BUKRS AND ANLZ.ANLN1 = ANEP2.ANLN1 AND ANLZ.ANLN2 = ANEP2.ANLN2 AND database_dynamic.FI___GET_REPORT_DATE(ANEP2.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP2.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP2.GJAHR)) BETWEEN ANLZ.ADATU AND ANLZ.BDATU)
	  LEFT JOIN database_viewbuilding.FI___ASSET_DOCUMENT_ITEMS	AS ITEM		ON (ITEM.MANDT = ANEK.MANDT AND ITEM.BUKRS = ANEK.BUKRS AND ITEM.ANLN1 = ANEK.ANLN1 AND ITEM.ANLN2 = ANEK.ANLN2 AND ITEM.GJAHR = ANEK.GJAHR AND ITEM.LNRAN = ANEK.LNRAN)
	  LEFT JOIN database_final.ANLB								AS ANLB 	ON (ANLB.MANDT = ANEP2.MANDT AND ANLB.BUKRS = ANEP2.BUKRS AND ANLB.ANLN1 = ANEP2.ANLN1 AND ANLB.ANLN2 = ANEP2.ANLN2 AND ANLB.AFABE = ANEP2.AFABE AND database_dynamic.FI___GET_REPORT_DATE(ANEP2.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP2.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP2.GJAHR)) BETWEEN ANLB.ADATU AND ANLB.BDATU)
	  LEFT JOIN database_final.ANKB								AS ANKB		ON (ANKB.MANDT = ANEP2.MANDT AND ANKB.ANLKL = ANLA.ANLKL AND ANKB.AFAPL = T093C.AFAPL AND ANKB.AFABE = AREA.AFABER AND database_dynamic.FI___GET_REPORT_DATE(ANEP2.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP2.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP2.GJAHR)) BETWEEN ANKB.ADATU AND ANKB.BDATU)
	  LEFT JOIN database_final.TKA02							AS TKA02 	ON (TKA02.MANDT = ANLZ.MANDT AND TKA02.BUKRS = ANLZ.BUKRS AND TKA02.GSBER = ANLZ.GSBER)
	  LEFT JOIN database_final.TKA02							AS TKA02B 	ON (TKA02B.MANDT = ANLZ.MANDT AND TKA02B.BUKRS = ANLZ.BUKRS AND TKA02B.GSBER = '')
	  LEFT JOIN database_final.T093B							AS T093B	ON (T093B.MANDT = ANEP2.MANDT AND T093B.BUKRS = ANEP2.BUKRS AND T093B.AFABE = ANEP2.AFABE)
	  LEFT JOIN database_final.T095P							AS T095 	ON (T095.MANDT = ANEP2.MANDT AND T095.KTOPL = T001.KTOPL AND T095.KTOGR = ANLA.KTOGR AND IFNULL(T095.AFASL, '') = IFNULL(ANLB.AFASL, '') AND T095.AFABER = AREA.AFABER)
	  LEFT JOIN database_final.T093								AS T093V	ON (T093V.MANDT = ANEP.MANDT AND T093V.AFAPL = T093C.AFAPL AND T093V.AFABER = ANEP.AFABE)
	  LEFT JOIN database_final.T093								AS T093X	ON (T093X.MANDT = ANEP.MANDT AND T093X.AFAPL = T093C.AFAPL AND T093X.AFABER = ANEP2.AFABE)
	  LEFT JOIN database_final.T093								AS T093Y	ON (T093Y.MANDT = ANEP.MANDT AND T093Y.AFAPL = T093C.AFAPL AND T093Y.AFABER = ANEP3.AFABE)
	  LEFT JOIN database_final.T093								AS T093Z	ON (T093Z.MANDT = ANEP.MANDT AND T093Z.AFAPL = T093C.AFAPL AND T093Z.AFABER = ANEP4.AFABE)
	  LEFT JOIN database_final.T095								AS T095B	ON (T095B.MANDT = ANEP2.MANDT AND T095B.KTOPL = T001.KTOPL AND T095B.KTOGR = ANLA.KTOGR AND T095B.AFABE = ANEP.AFABE)
	  LEFT JOIN database_final.T095								AS T095C	ON (T095C.MANDT = ANEP2.MANDT AND T095C.KTOPL = T001.KTOPL AND T095C.KTOGR = ANLA.KTOGR AND T095C.AFABE = ANEP2.AFABE)
	  LEFT JOIN database_final.T095								AS T095D	ON (T095D.MANDT = ANEP2.MANDT AND T095D.KTOPL = T001.KTOPL AND T095D.KTOGR = ANLA.KTOGR AND T095D.AFABE = ANEP3.AFABE)
	  LEFT JOIN database_final.T095								AS T095E	ON (T095E.MANDT = ANEP2.MANDT AND T095E.KTOPL = T001.KTOPL AND T095E.KTOGR = ANLA.KTOGR AND T095E.AFABE = ANEP4.AFABE)
	  LEFT JOIN database_final.T095								AS T095F	ON (T095F.MANDT = ANEP2.MANDT AND T095F.KTOPL = T001.KTOPL AND T095F.KTOGR = ANLA.KTOGR AND T095F.AFABE = 1)  
	  LEFT JOIN database_final.T006A							AS T006A 	ON (T006A.MANDT = ANEP2.MANDT AND T006A.MSEHI = ANEK.MEINS AND T006A.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.ANKT								AS ANKT 	ON (ANKT.MANDT = ANLA.MANDT AND ANKT.ANLKL = ANLA.ANLKL AND ANKT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.TGSBT							AS TGSBT 	ON (TGSBT.MANDT = ANLA.MANDT AND TGSBT.GSBER = ANLZ.GSBER AND TGSBT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.T001W							AS T001W 	ON (T001W.MANDT = ANLZ.MANDT AND T001W.WERKS = ANLZ.WERKS)
	  LEFT JOIN database_final.T499S							AS T499S 	ON (T499S.MANDT = ANLZ.MANDT AND T499S.WERKS = ANLZ.WERKS AND T499S.STAND = ANLZ.STORT)
	  LEFT JOIN database_final.T087V							AS T087V 	ON (T087V.MANDT = ANLA.MANDT AND T087V.ANLUE = ANLA.ANLUE AND T087V.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.T004								AS T004		ON (T004.MANDT = T001.MANDT	AND T004.KTOPL = T001.KTOPL)
	  LEFT JOIN database_final.SKAT								AS SKAT		ON (SKAT.MANDT = ANEP2.MANDT AND SKAT.KTOPL = T001.KTOPL AND SKAT.SAKNR = COALESCE(IF(T095.KTSOPO != '', T095.KTSOPO, NULL), IF(T093V.BUHBKT != '0', T095B.KTANSW, IF(T093V.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093X.BUHBKT != '0', T095C.KTANSW, IF(T093X.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Y.BUHBKT != '0', T095D.KTANSW, IF(T093Y.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Z.BUHBKT != '0', T095E.KTANSW, IF(T093Z.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), T095F.KTANSW) AND SKAT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.SKAT								AS SKAT2 	ON (SKAT2.MANDT = ANEP2.MANDT AND SKAT2.KTOPL = T001.KTOPL AND SKAT2.SAKNR = COALESCE(IF(T095.KTSOPO != '', T095.KTSOPO, NULL), IF(T093V.BUHBKT != '0', T095B.KTANSW, IF(T093V.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093X.BUHBKT != '0', T095C.KTANSW, IF(T093X.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Y.BUHBKT != '0', T095D.KTANSW, IF(T093Y.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Z.BUHBKT != '0', T095E.KTANSW, IF(T093Z.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), T095F.KTANSW) AND BINARY(SKAT2.SPRAS) = BINARY(T004.DSPRA))
	  LEFT JOIN database_final.TABWT							AS TABWT 	ON (TABWT.MANDT = IFNULL(ANEP.MANDT, ANEP2.MANDT) AND TABWT.BWASL = IFNULL(ANEP.BWASL, ANEP2.BWASL) AND TABWT.SPRAS = LANG.LANG_KEY)	  
	  LEFT JOIN database_final.T093T							AS T093T	ON (T093T.MANDT = ANEP2.MANDT AND T093T.AFAPL = T093C.AFAPL AND T093T.AFABER = AREA.AFABER AND T093T.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.ADRC								AS ADRC		ON (ADRC.CLIENT = T001W.MANDT AND ADRC.ADDRNUMBER = T001W.ADRNR AND ADRC.NATION = '')	
	WHERE
	  IFNULL(ANLB.ANLGR, '') = '' AND 
	  IFNULL(ANLA.XLOEV, '') = '' AND
	  (ANLA.DEAKT = 0 OR database_dynamic.FI___GET_FISCAL_YEAR(ANLA.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANLA.DEAKT) >= ANEP2.GJAHR)
	  
  UNION

  SELECT
	  ANEP3.ANLN1																																			AS ANLN1,
	  ANEP3.ANLN2																																			AS ANLN2,
	  ANLA.AKTIV						 																													AS AKTIV,
	  ANLA.TXT50 																																			AS ANLN_TXT,
	  ANLA.TXA50 																																			AS ANLN_TXT2,
	  ANEK.BUDAT						 																													AS BUDAT,
	  ANEP3.BWASL																																			AS BWASL,
	  IF(ANEP3.BZDAT = 0, NULL, ANEP3.BZDAT) 																												AS BZDAT,
	  ANEK.XBLNR																																			AS XBLNR,
	  IF(ANEK.MENGE != 0, ANEK.MENGE, NULL)																													AS MENGE,
	  IFNULL(T006A.MSEH3, ANEK.MEINS)																														AS MSEH3,
	  IFNULL(database_dynamic.FI___GET_ACCOUNTING_DOCUMENT(ANEP3.MANDT, ANEK.BUKRS, ANEK.GJAHR, ANEK.AWTYP, CONCAT(ANEK.BELNR, ANEK.AWORG)), ANEP3.BELNR)	AS BELNR,
	  ANLA.ANLKL																																			AS ANLKL,
	  ANLZ.KOSTL																																			AS KOSTL,
	  ANLZ.WERKS																																			AS WERKS,
	  ANLZ.STORT																																			AS STORT,
	  ANLZ.GSBER																																			AS GSBER,
	  COALESCE(IF(T095.KTSOPO != '', T095.KTSOPO, NULL), 				
			   IF(T093V.BUHBKT != '0', T095B.KTANSW, IF(T093V.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), 				
			   IF(T093X.BUHBKT != '0', T095C.KTANSW, IF(T093X.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), 				
			   IF(T093Y.BUHBKT != '0', T095D.KTANSW, IF(T093Y.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)),				
			   IF(T093Z.BUHBKT != '0', T095E.KTANSW, IF(T093Z.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)),
			   T095F.KTANSW)																																AS KTANSW,
	  ANLA.ANLUE																																			AS ANLUE,
	  CAST(AREA.AFABER AS UNSIGNED)																															AS AFABE,
	  T093T.AFBTXT																																			AS AFABE_TXT,
	  database_dynamic.FI___GET_REPORT_DATE(ANEK.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), 
		ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEK.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEK.GJAHR))					AS REPORT_DATE,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IFNULL(ANEA.AUFWL, 0) +
	      IFNULL(ANEA.AUFWV, 0) +
	      IFNULL(ANEP.ANBTR, 0)) +
	    IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
	      IFNULL(ANEP2.ANBTR, 0)), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IFNULL(ANEA3.AUFWL, 0) +
	      IFNULL(ANEA3.AUFWV, 0) +
	      IFNULL(ANEP3.ANBTR, 0)), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IFNULL(ANEA4.AUFWL, 0) +
	      IFNULL(ANEA4.AUFWV, 0) +
	      IFNULL(ANEP4.ANBTR, 0)), 0)																														AS ANBTR,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0)) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IFNULL(ANEA2.AUFNV, 0) +
	      IFNULL(ANEA2.AUFNL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IFNULL(ANEA3.AUFNV, 0) +
	      IFNULL(ANEA3.AUFNL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IFNULL(ANEA4.AUFNV, 0) +
	      IFNULL(ANEA4.AUFNL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0)), 0)																														AS ANAFA,
      IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IFNULL(ANEA.AUFWL, 0) +
		  IFNULL(ANEA.AUFWV, 0) +
		  IFNULL(ANEP.ANBTR, 0) +
		  IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0)) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
		  IFNULL(ANEP2.ANBTR, 0) +
		  IFNULL(ANEA2.AUFNV, 0) +
		  IFNULL(ANEA2.AUFNL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IFNULL(ANEA3.AUFWL, 0) +
		  IFNULL(ANEA3.AUFWV, 0) +
		  IFNULL(ANEP3.ANBTR, 0) +
		  IFNULL(ANEA3.AUFNV, 0) +
		  IFNULL(ANEA3.AUFNL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IFNULL(ANEA4.AUFWL, 0) +
		  IFNULL(ANEA4.AUFWV, 0) +
		  IFNULL(ANEP4.ANBTR, 0) +
		  IFNULL(ANEA4.AUFNV, 0) +
		  IFNULL(ANEA4.AUFNL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0)), 0)																														AS BOOKA,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * IFNULL(ANEA.ERLBT, 0) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * IFNULL(ANEA2.ERLBT, 0), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * IFNULL(ANEA3.ERLBT, 0), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * IFNULL(ANEA4.ERLBT, 0), 0)																		AS ERLBT,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IF(IFNULL(ANEA.ERLBT, 0) +
		  IFNULL(ANEP.ANBTR, 0) +
		  IFNULL(ANEA.AUFWV, 0) +
		  IFNULL(ANEA.AUFWL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0) +
		  IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) -
		  IFNULL(ANEA.VERKO, 0) > 0,
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
			   IFNULL(ANEA.ERLBT, 0) +
			   IFNULL(ANEP.ANBTR, 0) +
			   IFNULL(ANEA.AUFWV, 0) +
			   IFNULL(ANEA.AUFWL, 0) +
			   IFNULL(ANEA.NAFAL, 0) +
			   IFNULL(ANEA.NAFAV, 0) +
			   IFNULL(ANEA.SAFAL, 0) +
			   IFNULL(ANEA.SAFAV, 0) +
			   IFNULL(ANEA.AAFAL, 0) +
			   IFNULL(ANEA.AAFAV, 0) +
			   IFNULL(ANEA.MAFAV, 0) +
			   IFNULL(ANEA.MAFAL, 0) +
			   IFNULL(ANEA.AUFNV, 0) +
			   IFNULL(ANEA.AUFNL, 0) -
			   IFNULL(ANEA.VERKO, 0),
			   0),
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA.ERLBT, 0) +
			   IFNULL(ANEP.ANBTR, 0) +
			   IFNULL(ANEA.AUFWV, 0) +
			   IFNULL(ANEA.AUFWL, 0) +
			   IFNULL(ANEA.NAFAL, 0) +
			   IFNULL(ANEA.NAFAV, 0) +
			   IFNULL(ANEA.SAFAL, 0) +
			   IFNULL(ANEA.SAFAV, 0) +
			   IFNULL(ANEA.AAFAL, 0) +
			   IFNULL(ANEA.AAFAV, 0) +
			   IFNULL(ANEA.MAFAV, 0) +
			   IFNULL(ANEA.MAFAL, 0) +
			   IFNULL(ANEA.AUFNV, 0) +
			   IFNULL(ANEA.AUFNL, 0) -
			   IFNULL(ANEA.VERKO, 0)))) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IF(IFNULL(ANEA2.ERLBT, 0) +
		  IFNULL(ANEP2.ANBTR, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
		  IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0) +
		  IFNULL(ANEA2.AUFNV, 0) +
		  IFNULL(ANEA2.AUFNL, 0) -
		  IFNULL(ANEA2.VERKO, 0) > 0,
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
			   IFNULL(ANEA2.ERLBT, 0) +
			   IFNULL(ANEP2.ANBTR, 0) +
			   IFNULL(ANEA2.AUFWV, 0) +
			   IFNULL(ANEA2.AUFWL, 0) +
			   IFNULL(ANEA2.NAFAL, 0) +
			   IFNULL(ANEA2.NAFAV, 0) +
			   IFNULL(ANEA2.SAFAL, 0) +
			   IFNULL(ANEA2.SAFAV, 0) +
			   IFNULL(ANEA2.AAFAL, 0) +
			   IFNULL(ANEA2.AAFAV, 0) +
			   IFNULL(ANEA2.MAFAV, 0) +
			   IFNULL(ANEA2.MAFAL, 0) +
			   IFNULL(ANEA2.AUFNV, 0) +
			   IFNULL(ANEA2.AUFNL, 0) -
			   IFNULL(ANEA2.VERKO, 0),
			   0),
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA2.ERLBT, 0) +
			   IFNULL(ANEP2.ANBTR, 0) +
			   IFNULL(ANEA2.AUFWV, 0) +
			   IFNULL(ANEA2.AUFWL, 0) +
			   IFNULL(ANEA2.NAFAL, 0) +
			   IFNULL(ANEA2.NAFAV, 0) +
			   IFNULL(ANEA2.SAFAL, 0) +
			   IFNULL(ANEA2.SAFAV, 0) +
			   IFNULL(ANEA2.AAFAL, 0) +
			   IFNULL(ANEA2.AAFAV, 0) +
			   IFNULL(ANEA2.MAFAV, 0) +
			   IFNULL(ANEA2.MAFAL, 0) +
			   IFNULL(ANEA2.AUFNV, 0) +
			   IFNULL(ANEA2.AUFNL, 0) -
			   IFNULL(ANEA2.VERKO, 0)))), 0) + 
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IF(IFNULL(ANEA3.ERLBT, 0) +
		  IFNULL(ANEP3.ANBTR, 0) +
		  IFNULL(ANEA3.AUFWV, 0) +
		  IFNULL(ANEA3.AUFWL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0) +
		  IFNULL(ANEA3.AUFNV, 0) +
		  IFNULL(ANEA3.AUFNL, 0) -
		  IFNULL(ANEA3.VERKO, 0) > 0,
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
			   IFNULL(ANEA3.ERLBT, 0) +
			   IFNULL(ANEP3.ANBTR, 0) +
			   IFNULL(ANEA3.AUFWV, 0) +
			   IFNULL(ANEA3.AUFWL, 0) +
			   IFNULL(ANEA3.NAFAL, 0) +
			   IFNULL(ANEA3.NAFAV, 0) +
			   IFNULL(ANEA3.SAFAL, 0) +
			   IFNULL(ANEA3.SAFAV, 0) +
			   IFNULL(ANEA3.AAFAL, 0) +
			   IFNULL(ANEA3.AAFAV, 0) +
			   IFNULL(ANEA3.MAFAV, 0) +
			   IFNULL(ANEA3.MAFAL, 0) +
			   IFNULL(ANEA3.AUFNV, 0) +
			   IFNULL(ANEA3.AUFNL, 0) -
			   IFNULL(ANEA3.VERKO, 0),
			   0),
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA3.ERLBT, 0) +
			   IFNULL(ANEP3.ANBTR, 0) +
			   IFNULL(ANEA3.AUFWV, 0) +
			   IFNULL(ANEA3.AUFWL, 0) +
			   IFNULL(ANEA3.NAFAL, 0) +
			   IFNULL(ANEA3.NAFAV, 0) +
			   IFNULL(ANEA3.SAFAL, 0) +
			   IFNULL(ANEA3.SAFAV, 0) +
			   IFNULL(ANEA3.AAFAL, 0) +
			   IFNULL(ANEA3.AAFAV, 0) +
			   IFNULL(ANEA3.MAFAV, 0) +
			   IFNULL(ANEA3.MAFAL, 0) +
			   IFNULL(ANEA3.AUFNV, 0) +
			   IFNULL(ANEA3.AUFNL, 0) -
			   IFNULL(ANEA3.VERKO, 0)))), 0) + 
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IF(IFNULL(ANEA4.ERLBT, 0) +
		  IFNULL(ANEP4.ANBTR, 0) +
		  IFNULL(ANEA4.AUFWV, 0) +
		  IFNULL(ANEA4.AUFWL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0) +
		  IFNULL(ANEA4.AUFNV, 0) +
		  IFNULL(ANEA4.AUFNL, 0) -
		  IFNULL(ANEA4.VERKO, 0) > 0,
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
			   IFNULL(ANEA4.ERLBT, 0) +
			   IFNULL(ANEP4.ANBTR, 0) +
			   IFNULL(ANEA4.AUFWV, 0) +
			   IFNULL(ANEA4.AUFWL, 0) +
			   IFNULL(ANEA4.NAFAL, 0) +
			   IFNULL(ANEA4.NAFAV, 0) +
			   IFNULL(ANEA4.SAFAL, 0) +
			   IFNULL(ANEA4.SAFAV, 0) +
			   IFNULL(ANEA4.AAFAL, 0) +
			   IFNULL(ANEA4.AAFAV, 0) +
			   IFNULL(ANEA4.MAFAV, 0) +
			   IFNULL(ANEA4.MAFAL, 0) +
			   IFNULL(ANEA4.AUFNV, 0) +
			   IFNULL(ANEA4.AUFNL, 0) -
			   IFNULL(ANEA4.VERKO, 0),
			   0),
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA4.ERLBT, 0) +
			   IFNULL(ANEP4.ANBTR, 0) +
			   IFNULL(ANEA4.AUFWV, 0) +
			   IFNULL(ANEA4.AUFWL, 0) +
			   IFNULL(ANEA4.NAFAL, 0) +
			   IFNULL(ANEA4.NAFAV, 0) +
			   IFNULL(ANEA4.SAFAL, 0) +
			   IFNULL(ANEA4.SAFAV, 0) +
			   IFNULL(ANEA4.AAFAL, 0) +
			   IFNULL(ANEA4.AAFAV, 0) +
			   IFNULL(ANEA4.MAFAV, 0) +
			   IFNULL(ANEA4.MAFAL, 0) +
			   IFNULL(ANEA4.AUFNV, 0) +
			   IFNULL(ANEA4.AUFNL, 0) -
			   IFNULL(ANEA4.VERKO, 0)))), 0)																												AS MINERL,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IF(IFNULL(ANEA.ERLBT, 0) +
		  IFNULL(ANEP.ANBTR, 0) +
		  IFNULL(ANEA.AUFWV, 0) +
		  IFNULL(ANEA.AUFWL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0) +
		  IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) -
		  IFNULL(ANEA.VERKO, 0) > 0,
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA.ERLBT, 0) +
				IFNULL(ANEP.ANBTR, 0) +
				IFNULL(ANEA.AUFWV, 0) +
				IFNULL(ANEA.AUFWL, 0) +
				IFNULL(ANEA.NAFAL, 0) +
				IFNULL(ANEA.NAFAV, 0) +
				IFNULL(ANEA.SAFAL, 0) +
				IFNULL(ANEA.SAFAV, 0) +
				IFNULL(ANEA.AAFAL, 0) +
				IFNULL(ANEA.AAFAV, 0) +
				IFNULL(ANEA.MAFAV, 0) +
				IFNULL(ANEA.MAFAL, 0) +
				IFNULL(ANEA.AUFNV, 0) +
				IFNULL(ANEA.AUFNL, 0) -
				IFNULL(ANEA.VERKO, 0)),
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
				IFNULL(ANEA.ERLBT, 0) +
				IFNULL(ANEP.ANBTR, 0) +
				IFNULL(ANEA.AUFWV, 0) +
				IFNULL(ANEA.AUFWL, 0) +
				IFNULL(ANEA.NAFAL, 0) +
				IFNULL(ANEA.NAFAV, 0) +
				IFNULL(ANEA.SAFAL, 0) +
				IFNULL(ANEA.SAFAV, 0) +
				IFNULL(ANEA.AAFAL, 0) +
				IFNULL(ANEA.AAFAV, 0) +
				IFNULL(ANEA.MAFAV, 0) +
				IFNULL(ANEA.MAFAL, 0) +
				IFNULL(ANEA.AUFNV, 0) +
				IFNULL(ANEA.AUFNL, 0) -
				IFNULL(ANEA.VERKO, 0),
				0))) + 
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IF(IFNULL(ANEA2.ERLBT, 0) +
		  IFNULL(ANEP2.ANBTR, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
		  IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0) +
		  IFNULL(ANEA2.AUFNV, 0) +
		  IFNULL(ANEA2.AUFNL, 0) -
		  IFNULL(ANEA2.VERKO, 0) > 0,
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA2.ERLBT, 0) +
				IFNULL(ANEP2.ANBTR, 0) +
				IFNULL(ANEA2.AUFWV, 0) +
				IFNULL(ANEA2.AUFWL, 0) +
				IFNULL(ANEA2.NAFAL, 0) +
				IFNULL(ANEA2.NAFAV, 0) +
				IFNULL(ANEA2.SAFAL, 0) +
				IFNULL(ANEA2.SAFAV, 0) +
				IFNULL(ANEA2.AAFAL, 0) +
				IFNULL(ANEA2.AAFAV, 0) +
				IFNULL(ANEA2.MAFAV, 0) +
				IFNULL(ANEA2.MAFAL, 0) +
				IFNULL(ANEA2.AUFNV, 0) +
				IFNULL(ANEA2.AUFNL, 0) -
				IFNULL(ANEA2.VERKO, 0)),
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
				IFNULL(ANEA2.ERLBT, 0) +
				IFNULL(ANEP2.ANBTR, 0) +
				IFNULL(ANEA2.AUFWV, 0) +
				IFNULL(ANEA2.AUFWL, 0) +
				IFNULL(ANEA2.NAFAL, 0) +
				IFNULL(ANEA2.NAFAV, 0) +
				IFNULL(ANEA2.SAFAL, 0) +
				IFNULL(ANEA2.SAFAV, 0) +
				IFNULL(ANEA2.AAFAL, 0) +
				IFNULL(ANEA2.AAFAV, 0) +
				IFNULL(ANEA2.MAFAV, 0) +
				IFNULL(ANEA2.MAFAL, 0) +
				IFNULL(ANEA2.AUFNV, 0) +
				IFNULL(ANEA2.AUFNL, 0) -
				IFNULL(ANEA2.VERKO, 0),
				0))), 0) + 
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IF(IFNULL(ANEA3.ERLBT, 0) +
		  IFNULL(ANEP3.ANBTR, 0) +
		  IFNULL(ANEA3.AUFWV, 0) +
		  IFNULL(ANEA3.AUFWL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0) +
		  IFNULL(ANEA3.AUFNV, 0) +
		  IFNULL(ANEA3.AUFNL, 0) -
		  IFNULL(ANEA3.VERKO, 0) > 0,
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA3.ERLBT, 0) +
				IFNULL(ANEP3.ANBTR, 0) +
				IFNULL(ANEA3.AUFWV, 0) +
				IFNULL(ANEA3.AUFWL, 0) +
				IFNULL(ANEA3.NAFAL, 0) +
				IFNULL(ANEA3.NAFAV, 0) +
				IFNULL(ANEA3.SAFAL, 0) +
				IFNULL(ANEA3.SAFAV, 0) +
				IFNULL(ANEA3.AAFAL, 0) +
				IFNULL(ANEA3.AAFAV, 0) +
				IFNULL(ANEA3.MAFAV, 0) +
				IFNULL(ANEA3.MAFAL, 0) +
				IFNULL(ANEA3.AUFNV, 0) +
				IFNULL(ANEA3.AUFNL, 0) -
				IFNULL(ANEA3.VERKO, 0)),
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
				IFNULL(ANEA3.ERLBT, 0) +
				IFNULL(ANEP3.ANBTR, 0) +
				IFNULL(ANEA3.AUFWV, 0) +
				IFNULL(ANEA3.AUFWL, 0) +
				IFNULL(ANEA3.NAFAL, 0) +
				IFNULL(ANEA3.NAFAV, 0) +
				IFNULL(ANEA3.SAFAL, 0) +
				IFNULL(ANEA3.SAFAV, 0) +
				IFNULL(ANEA3.AAFAL, 0) +
				IFNULL(ANEA3.AAFAV, 0) +
				IFNULL(ANEA3.MAFAV, 0) +
				IFNULL(ANEA3.MAFAL, 0) +
				IFNULL(ANEA3.AUFNV, 0) +
				IFNULL(ANEA3.AUFNL, 0) -
				IFNULL(ANEA3.VERKO, 0),
				0))), 0) + 
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IF(IFNULL(ANEA4.ERLBT, 0) +
		  IFNULL(ANEP4.ANBTR, 0) +
		  IFNULL(ANEA4.AUFWV, 0) +
		  IFNULL(ANEA4.AUFWL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0) +
		  IFNULL(ANEA4.AUFNV, 0) +
		  IFNULL(ANEA4.AUFNL, 0) -
		  IFNULL(ANEA4.VERKO, 0) > 0,
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA4.ERLBT, 0) +
				IFNULL(ANEP4.ANBTR, 0) +
				IFNULL(ANEA4.AUFWV, 0) +
				IFNULL(ANEA4.AUFWL, 0) +
				IFNULL(ANEA4.NAFAL, 0) +
				IFNULL(ANEA4.NAFAV, 0) +
				IFNULL(ANEA4.SAFAL, 0) +
				IFNULL(ANEA4.SAFAV, 0) +
				IFNULL(ANEA4.AAFAL, 0) +
				IFNULL(ANEA4.AAFAV, 0) +
				IFNULL(ANEA4.MAFAV, 0) +
				IFNULL(ANEA4.MAFAL, 0) +
				IFNULL(ANEA4.AUFNV, 0) +
				IFNULL(ANEA4.AUFNL, 0) -
				IFNULL(ANEA4.VERKO, 0)),
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
				IFNULL(ANEA4.ERLBT, 0) +
				IFNULL(ANEP4.ANBTR, 0) +
				IFNULL(ANEA4.AUFWV, 0) +
				IFNULL(ANEA4.AUFWL, 0) +
				IFNULL(ANEA4.NAFAL, 0) +
				IFNULL(ANEA4.NAFAV, 0) +
				IFNULL(ANEA4.SAFAL, 0) +
				IFNULL(ANEA4.SAFAV, 0) +
				IFNULL(ANEA4.AAFAL, 0) +
				IFNULL(ANEA4.AAFAV, 0) +
				IFNULL(ANEA4.MAFAV, 0) +
				IFNULL(ANEA4.MAFAL, 0) +
				IFNULL(ANEA4.AUFNV, 0) +
				IFNULL(ANEA4.AUFNL, 0) -
				IFNULL(ANEA4.VERKO, 0),
				0))), 0)																																	AS MEHERL,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * IFNULL(ANEA.VERKO, 0) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * IFNULL(ANEA2.VERKO, 0), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * IFNULL(ANEA3.VERKO, 0), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * IFNULL(ANEA4.VERKO, 0), 0)																		AS VERKO,
	  T093B.WAERS																																			AS WAERS,
	  ANEK.SGTXT																																			AS SGTXT,
	  ANLA.DEAKT																																			AS DEAKT,									
	  IF(ANLA.ZUGDT = 0, NULL, ANLA.ZUGDT)																													AS ZUGDT,	  
	  LANG.LANG_KEY																																			AS LANG_KEY,
	  ANLA.MANDT																																			AS MANDT,
	  ANLA.BUKRS																																			AS BUKRS,
	  ANEK.GJAHR																																			AS GJAHR,
	  T093C.AFAPL																																			AS AFAPL,
	  T001.KTOPL																																			AS KTOPL,
	  ANEK.LNRAN																																			AS LNRAN,
	  ANEP3.BWASL																																			AS BWASL_O,
	  IFNULL(ANKB.XAFBE, '')																																AS XAFBE,
	  COALESCE(ANEP3.BUZEI, ITEM.BUZEI, ANEK.BUZEI)																											AS BUZEI,
	  CONCAT_WS(' ', RPAD(ANLA.BUKRS, 9, ' '), RPAD(ANLA.ANLKL, 13, ' '), RPAD(ANLA.TXT50, 55, ' '), RPAD(ANLA.KTOGR, 13, ' '), DATE_FORMAT(ANLA.AKTIV, '%d.%m.%Y'))	AS ANLN1_TXT,	
	  ANKT.TXK20																																						AS ANLKL_TXT,
	  TGSBT.GTEXT																																						AS GSBER_TXT,
	  CONCAT_WS(' ',RPAD(ADRC.NAME1, 45, ' '),RPAD(ADRC.NAME2, 45, ' '),RPAD(ADRC.CITY1, 45, ' '),RPAD(ADRC.POST_CODE1, 15, ' '),RPAD(ADRC.SORT1, 25, ' '),ADRC.SORT2)	AS WERKS_TXT,
	  CONCAT_WS(' ', RPAD(T499S.WERKS, 9, ' '), T499S.KTEXT)																											AS STORT_TXT,
	  T087V.ANLUE_TXT																																					AS ANLUE_TXT,
	  CONCAT_WS(' ', RPAD(T001.BUKRS, 9, ' '), COALESCE(SKAT.TXT50, SKAT2.TXT50))																						AS KTANSW_TXT,
	  TABWT.BWATXT																																						AS BWASL_TXT
	FROM 
	  database_viewbuilding.FI___DERIVED_AREAS					AS AREA
	  LEFT JOIN database_dynamic.LANGUAGE_KEYS					AS LANG 	ON TRUE
	  JOIN database_final.ANEP									AS ANEP3	ON (ANEP3.MANDT = AREA.MANDT AND ANEP3.BUKRS = AREA.BUKRS AND ANEP3.AFABE = AREA.AFABE3)
	  LEFT JOIN database_final.ANEP								AS ANEP 	ON (ANEP.MANDT = AREA.MANDT AND ANEP.BUKRS = ANEP3.BUKRS AND ANEP.ANLN1 = ANEP3.ANLN1 AND ANEP.ANLN2 = ANEP3.ANLN2 AND ANEP.GJAHR = ANEP3.GJAHR AND ANEP.LNRAN = ANEP3.LNRAN AND ANEP.AFABE = AREA.AFABE1)
	  LEFT JOIN database_final.ANEP								AS ANEP2 	ON (ANEP2.MANDT = ANEP3.MANDT AND ANEP2.BUKRS = ANEP3.BUKRS AND ANEP2.ANLN1 = ANEP3.ANLN1 AND ANEP2.ANLN2 = ANEP3.ANLN2 AND ANEP2.GJAHR = ANEP3.GJAHR AND ANEP2.LNRAN = ANEP3.LNRAN AND ANEP2.AFABE = AREA.AFABE2)
	  LEFT JOIN database_final.ANEP								AS ANEP4 	ON (ANEP4.MANDT = ANEP3.MANDT AND ANEP4.BUKRS = ANEP3.BUKRS AND ANEP4.ANLN1 = ANEP3.ANLN1 AND ANEP4.ANLN2 = ANEP3.ANLN2 AND ANEP4.GJAHR = ANEP3.GJAHR AND ANEP4.LNRAN = ANEP3.LNRAN AND ANEP4.AFABE = AREA.AFABE4)
	  LEFT JOIN database_final.ANEA 							AS ANEA 	ON (ANEA.MANDT = ANEP.MANDT AND ANEA.BUKRS = ANEP.BUKRS AND ANEA.ANLN1 = ANEP.ANLN1 AND ANEA.ANLN2 = ANEP.ANLN2 AND ANEA.GJAHR = ANEP.GJAHR AND ANEA.LNRAN = ANEP.LNRAN AND ANEA.AFABE = ANEP.AFABE)
	  LEFT JOIN database_final.ANEA 							AS ANEA2 	ON (ANEA2.MANDT = ANEP2.MANDT AND ANEA2.BUKRS = ANEP2.BUKRS AND ANEA2.ANLN1 = ANEP2.ANLN1 AND ANEA2.ANLN2 = ANEP2.ANLN2 AND ANEA2.GJAHR = ANEP2.GJAHR AND ANEA2.LNRAN = ANEP2.LNRAN AND ANEA2.AFABE = ANEP2.AFABE)
	  LEFT JOIN database_final.ANEA 							AS ANEA3 	ON (ANEA3.MANDT = ANEP3.MANDT AND ANEA3.BUKRS = ANEP3.BUKRS AND ANEA3.ANLN1 = ANEP3.ANLN1 AND ANEA3.ANLN2 = ANEP3.ANLN2 AND ANEA3.GJAHR = ANEP3.GJAHR AND ANEA3.LNRAN = ANEP3.LNRAN AND ANEA3.AFABE = ANEP3.AFABE)
	  LEFT JOIN database_final.ANEA 							AS ANEA4 	ON (ANEA4.MANDT = ANEP4.MANDT AND ANEA4.BUKRS = ANEP4.BUKRS AND ANEA4.ANLN1 = ANEP4.ANLN1 AND ANEA4.ANLN2 = ANEP4.ANLN2 AND ANEA4.GJAHR = ANEP4.GJAHR AND ANEA4.LNRAN = ANEP4.LNRAN AND ANEA4.AFABE = ANEP4.AFABE)
	  LEFT JOIN database_final.T001								AS T001 	ON (T001.MANDT = ANEP3.MANDT AND T001.BUKRS = ANEP3.BUKRS)
	  LEFT JOIN database_final.T093C							AS T093C	ON (T093C.MANDT = ANEP3.MANDT AND T093C.BUKRS = ANEP3.BUKRS)
	  JOIN database_final.ANEK									AS ANEK 	ON (ANEK.MANDT = ANEP3.MANDT AND ANEK.BUKRS = ANEP3.BUKRS AND ANEK.ANLN1 = ANEP3.ANLN1 AND ANEK.ANLN2 = ANEP3.ANLN2 AND ANEK.GJAHR = ANEP3.GJAHR AND ANEK.LNRAN = ANEP3.LNRAN)
	  JOIN database_final.ANLA									AS ANLA 	ON (ANLA.MANDT = ANEP3.MANDT AND ANLA.BUKRS = ANEP3.BUKRS AND ANLA.ANLN1 = ANEP3.ANLN1 AND ANLA.ANLN2 = ANEP3.ANLN2)
	  JOIN database_final.ANLZ									AS ANLZ 	ON (ANLZ.MANDT = ANEP3.MANDT AND ANLZ.BUKRS = ANEP3.BUKRS AND ANLZ.ANLN1 = ANEP3.ANLN1 AND ANLZ.ANLN2 = ANEP3.ANLN2 AND database_dynamic.FI___GET_REPORT_DATE(ANEP3.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP3.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP3.GJAHR)) BETWEEN ANLZ.ADATU AND ANLZ.BDATU)
	  LEFT JOIN database_viewbuilding.FI___ASSET_DOCUMENT_ITEMS	AS ITEM		ON (ITEM.MANDT = ANEK.MANDT AND ITEM.BUKRS = ANEK.BUKRS AND ITEM.ANLN1 = ANEK.ANLN1 AND ITEM.ANLN2 = ANEK.ANLN2 AND ITEM.GJAHR = ANEK.GJAHR AND ITEM.LNRAN = ANEK.LNRAN)
	  LEFT JOIN database_final.ANLB								AS ANLB 	ON (ANLB.MANDT = ANEP3.MANDT AND ANLB.BUKRS = ANEP3.BUKRS AND ANLB.ANLN1 = ANEP3.ANLN1 AND ANLB.ANLN2 = ANEP3.ANLN2 AND ANLB.AFABE = ANEP3.AFABE AND database_dynamic.FI___GET_REPORT_DATE(ANEP3.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP3.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP3.GJAHR)) BETWEEN ANLB.ADATU AND ANLB.BDATU)
	  LEFT JOIN database_final.ANKB								AS ANKB		ON (ANKB.MANDT = ANEP3.MANDT AND ANKB.ANLKL = ANLA.ANLKL AND ANKB.AFAPL = T093C.AFAPL AND ANKB.AFABE = AREA.AFABER AND database_dynamic.FI___GET_REPORT_DATE(ANEP3.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP3.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP3.GJAHR)) BETWEEN ANKB.ADATU AND ANKB.BDATU)
	  LEFT JOIN database_final.TKA02							AS TKA02 	ON (TKA02.MANDT = ANLZ.MANDT AND TKA02.BUKRS = ANLZ.BUKRS AND TKA02.GSBER = ANLZ.GSBER)
	  LEFT JOIN database_final.TKA02							AS TKA02B 	ON (TKA02B.MANDT = ANLZ.MANDT AND TKA02B.BUKRS = ANLZ.BUKRS AND TKA02B.GSBER = '')
	  LEFT JOIN database_final.T093B							AS T093B	ON (T093B.MANDT = ANEP3.MANDT AND T093B.BUKRS = ANEP3.BUKRS AND T093B.AFABE = ANEP3.AFABE)
	  LEFT JOIN database_final.T095P							AS T095 	ON (T095.MANDT = ANEP3.MANDT AND T095.KTOPL = T001.KTOPL AND T095.KTOGR = ANLA.KTOGR AND IFNULL(T095.AFASL, '') = IFNULL(ANLB.AFASL, '') AND T095.AFABER = AREA.AFABER)
	  LEFT JOIN database_final.T093								AS T093V	ON (T093V.MANDT = ANEP.MANDT AND T093V.AFAPL = T093C.AFAPL AND T093V.AFABER = ANEP.AFABE)
	  LEFT JOIN database_final.T093								AS T093X	ON (T093X.MANDT = ANEP.MANDT AND T093X.AFAPL = T093C.AFAPL AND T093X.AFABER = ANEP2.AFABE)
	  LEFT JOIN database_final.T093								AS T093Y	ON (T093Y.MANDT = ANEP.MANDT AND T093Y.AFAPL = T093C.AFAPL AND T093Y.AFABER = ANEP3.AFABE)
	  LEFT JOIN database_final.T093								AS T093Z	ON (T093Z.MANDT = ANEP.MANDT AND T093Z.AFAPL = T093C.AFAPL AND T093Z.AFABER = ANEP4.AFABE)  
	  LEFT JOIN database_final.T095								AS T095B	ON (T095B.MANDT = ANEP3.MANDT AND T095B.KTOPL = T001.KTOPL AND T095B.KTOGR = ANLA.KTOGR AND T095B.AFABE = ANEP.AFABE)
	  LEFT JOIN database_final.T095								AS T095C	ON (T095C.MANDT = ANEP3.MANDT AND T095C.KTOPL = T001.KTOPL AND T095C.KTOGR = ANLA.KTOGR AND T095C.AFABE = ANEP2.AFABE)
	  LEFT JOIN database_final.T095								AS T095D	ON (T095D.MANDT = ANEP3.MANDT AND T095D.KTOPL = T001.KTOPL AND T095D.KTOGR = ANLA.KTOGR AND T095D.AFABE = ANEP3.AFABE)
	  LEFT JOIN database_final.T095								AS T095E	ON (T095E.MANDT = ANEP3.MANDT AND T095E.KTOPL = T001.KTOPL AND T095E.KTOGR = ANLA.KTOGR AND T095E.AFABE = ANEP4.AFABE)
	  LEFT JOIN database_final.T095								AS T095F	ON (T095F.MANDT = ANEP3.MANDT AND T095F.KTOPL = T001.KTOPL AND T095F.KTOGR = ANLA.KTOGR AND T095F.AFABE = 1)  
	  LEFT JOIN database_final.T006A							AS T006A 	ON (T006A.MANDT = ANEP3.MANDT AND T006A.MSEHI = ANEK.MEINS AND T006A.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.ANKT								AS ANKT 	ON (ANKT.MANDT = ANLA.MANDT AND ANKT.ANLKL = ANLA.ANLKL AND ANKT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.TGSBT							AS TGSBT 	ON (TGSBT.MANDT = ANLA.MANDT AND TGSBT.GSBER = ANLZ.GSBER AND TGSBT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.T001W							AS T001W 	ON (T001W.MANDT = ANLZ.MANDT AND T001W.WERKS = ANLZ.WERKS)
	  LEFT JOIN database_final.T499S							AS T499S 	ON (T499S.MANDT = ANLZ.MANDT AND T499S.WERKS = ANLZ.WERKS AND T499S.STAND = ANLZ.STORT)
	  LEFT JOIN database_final.T087V							AS T087V 	ON (T087V.MANDT = ANLA.MANDT AND T087V.ANLUE = ANLA.ANLUE AND T087V.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.T004								AS T004		ON (T004.MANDT = T001.MANDT	AND T004.KTOPL = T001.KTOPL)
	  LEFT JOIN database_final.SKAT								AS SKAT		ON (SKAT.MANDT = ANEP3.MANDT AND SKAT.KTOPL = T001.KTOPL AND SKAT.SAKNR = COALESCE(IF(T095.KTSOPO != '', T095.KTSOPO, NULL), IF(T093V.BUHBKT != '0', T095B.KTANSW, IF(T093V.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093X.BUHBKT != '0', T095C.KTANSW, IF(T093X.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Y.BUHBKT != '0', T095D.KTANSW, IF(T093Y.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Z.BUHBKT != '0', T095E.KTANSW, IF(T093Z.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), T095F.KTANSW) AND SKAT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.SKAT								AS SKAT2 	ON (SKAT2.MANDT = ANEP3.MANDT AND SKAT2.KTOPL = T001.KTOPL AND SKAT2.SAKNR = COALESCE(IF(T095.KTSOPO != '', T095.KTSOPO, NULL), IF(T093V.BUHBKT != '0', T095B.KTANSW, IF(T093V.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093X.BUHBKT != '0', T095C.KTANSW, IF(T093X.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Y.BUHBKT != '0', T095D.KTANSW, IF(T093Y.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Z.BUHBKT != '0', T095E.KTANSW, IF(T093Z.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), T095F.KTANSW) AND BINARY(SKAT2.SPRAS) = BINARY(T004.DSPRA))
	  LEFT JOIN database_final.TABWT							AS TABWT 	ON (TABWT.MANDT = ANEP3.MANDT AND TABWT.BWASL = ANEP3.BWASL AND TABWT.SPRAS = LANG.LANG_KEY)	  
	  LEFT JOIN database_final.T093T							AS T093T	ON (T093T.MANDT = ANEP3.MANDT AND T093T.AFAPL = T093C.AFAPL AND T093T.AFABER = AREA.AFABER AND T093T.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.ADRC								AS ADRC		ON (ADRC.CLIENT = T001W.MANDT AND ADRC.ADDRNUMBER = T001W.ADRNR AND ADRC.NATION = '')	
	WHERE
	  IFNULL(ANLB.ANLGR, '') = '' AND 
	  IFNULL(ANLA.XLOEV, '') = '' AND
	  (ANLA.DEAKT = 0 OR database_dynamic.FI___GET_FISCAL_YEAR(ANLA.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANLA.DEAKT) >= ANEP3.GJAHR)
	  
  UNION

  SELECT
	  ANEP4.ANLN1																																			AS ANLN1,
	  ANEP4.ANLN2																																			AS ANLN2,
	  ANLA.AKTIV						 																													AS AKTIV,
	  ANLA.TXT50 																																			AS ANLN_TXT,
	  ANLA.TXA50 																																			AS ANLN_TXT2,
	  ANEK.BUDAT						 																													AS BUDAT,
	  IFNULL(ANEP3.BWASL, ANEP4.BWASL)																														AS BWASL,
	  IF(ANEP4.BZDAT = 0, NULL, ANEP4.BZDAT) 																												AS BZDAT,
	  ANEK.XBLNR																																			AS XBLNR,
	  IF(ANEK.MENGE != 0, ANEK.MENGE, NULL)																													AS MENGE,
	  IFNULL(T006A.MSEH3, ANEK.MEINS)																														AS MSEH3,
	  IFNULL(database_dynamic.FI___GET_ACCOUNTING_DOCUMENT(ANEP4.MANDT, ANEK.BUKRS, ANEK.GJAHR, ANEK.AWTYP, CONCAT(ANEK.BELNR, ANEK.AWORG)), ANEP4.BELNR)	AS BELNR,
	  ANLA.ANLKL																																			AS ANLKL,
	  ANLZ.KOSTL																																			AS KOSTL,
	  ANLZ.WERKS																																			AS WERKS,
	  ANLZ.STORT																																			AS STORT,
	  ANLZ.GSBER																																			AS GSBER,
	  COALESCE(IF(T095.KTSOPO != '', T095.KTSOPO, NULL), 				
			   IF(T093V.BUHBKT != '0', T095B.KTANSW, IF(T093V.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), 				
			   IF(T093X.BUHBKT != '0', T095C.KTANSW, IF(T093X.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), 				
			   IF(T093Y.BUHBKT != '0', T095D.KTANSW, IF(T093Y.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)),				
			   IF(T093Z.BUHBKT != '0', T095E.KTANSW, IF(T093Z.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)),
			   T095F.KTANSW)																																AS KTANSW,
	  ANLA.ANLUE																																			AS ANLUE,
	  CAST(AREA.AFABER AS UNSIGNED)																															AS AFABE,
	  T093T.AFBTXT																																			AS AFABE_TXT,
	  database_dynamic.FI___GET_REPORT_DATE(ANEK.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), 
		ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEK.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEK.GJAHR))					AS REPORT_DATE,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IFNULL(ANEA.AUFWL, 0) +
	      IFNULL(ANEA.AUFWV, 0) +
	      IFNULL(ANEP.ANBTR, 0)) +
	    IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
	      IFNULL(ANEP2.ANBTR, 0)), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IFNULL(ANEA3.AUFWL, 0) +
	      IFNULL(ANEA3.AUFWV, 0) +
	      IFNULL(ANEP3.ANBTR, 0)), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IFNULL(ANEA4.AUFWL, 0) +
	      IFNULL(ANEA4.AUFWV, 0) +
	      IFNULL(ANEP4.ANBTR, 0)), 0)																														AS ANBTR,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0)) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IFNULL(ANEA2.AUFNV, 0) +
	      IFNULL(ANEA2.AUFNL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IFNULL(ANEA3.AUFNV, 0) +
	      IFNULL(ANEA3.AUFNL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IFNULL(ANEA4.AUFNV, 0) +
	      IFNULL(ANEA4.AUFNL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0)), 0)																														AS ANAFA,
      IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IFNULL(ANEA.AUFWL, 0) +
		  IFNULL(ANEA.AUFWV, 0) +
		  IFNULL(ANEP.ANBTR, 0) +
		  IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0)) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
		  IFNULL(ANEP2.ANBTR, 0) +
		  IFNULL(ANEA2.AUFNV, 0) +
		  IFNULL(ANEA2.AUFNL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IFNULL(ANEA3.AUFWL, 0) +
		  IFNULL(ANEA3.AUFWV, 0) +
		  IFNULL(ANEP3.ANBTR, 0) +
		  IFNULL(ANEA3.AUFNV, 0) +
		  IFNULL(ANEA3.AUFNL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0)), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IFNULL(ANEA4.AUFWL, 0) +
		  IFNULL(ANEA4.AUFWV, 0) +
		  IFNULL(ANEP4.ANBTR, 0) +
		  IFNULL(ANEA4.AUFNV, 0) +
		  IFNULL(ANEA4.AUFNL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0)), 0)																														AS BOOKA,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * IFNULL(ANEA.ERLBT, 0) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * IFNULL(ANEA2.ERLBT, 0), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * IFNULL(ANEA3.ERLBT, 0), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * IFNULL(ANEA4.ERLBT, 0), 0)																		AS ERLBT,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IF(IFNULL(ANEA.ERLBT, 0) +
		  IFNULL(ANEP.ANBTR, 0) +
		  IFNULL(ANEA.AUFWV, 0) +
		  IFNULL(ANEA.AUFWL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0) +
		  IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) -
		  IFNULL(ANEA.VERKO, 0) > 0,
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
			   IFNULL(ANEA.ERLBT, 0) +
			   IFNULL(ANEP.ANBTR, 0) +
			   IFNULL(ANEA.AUFWV, 0) +
			   IFNULL(ANEA.AUFWL, 0) +
			   IFNULL(ANEA.NAFAL, 0) +
			   IFNULL(ANEA.NAFAV, 0) +
			   IFNULL(ANEA.SAFAL, 0) +
			   IFNULL(ANEA.SAFAV, 0) +
			   IFNULL(ANEA.AAFAL, 0) +
			   IFNULL(ANEA.AAFAV, 0) +
			   IFNULL(ANEA.MAFAV, 0) +
			   IFNULL(ANEA.MAFAL, 0) +
			   IFNULL(ANEA.AUFNV, 0) +
			   IFNULL(ANEA.AUFNL, 0) -
			   IFNULL(ANEA.VERKO, 0),
			   0),
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA.ERLBT, 0) +
			   IFNULL(ANEP.ANBTR, 0) +
			   IFNULL(ANEA.AUFWV, 0) +
			   IFNULL(ANEA.AUFWL, 0) +
			   IFNULL(ANEA.NAFAL, 0) +
			   IFNULL(ANEA.NAFAV, 0) +
			   IFNULL(ANEA.SAFAL, 0) +
			   IFNULL(ANEA.SAFAV, 0) +
			   IFNULL(ANEA.AAFAL, 0) +
			   IFNULL(ANEA.AAFAV, 0) +
			   IFNULL(ANEA.MAFAV, 0) +
			   IFNULL(ANEA.MAFAL, 0) +
			   IFNULL(ANEA.AUFNV, 0) +
			   IFNULL(ANEA.AUFNL, 0) -
			   IFNULL(ANEA.VERKO, 0)))) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IF(IFNULL(ANEA2.ERLBT, 0) +
		  IFNULL(ANEP2.ANBTR, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
		  IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0) +
		  IFNULL(ANEA2.AUFNV, 0) +
		  IFNULL(ANEA2.AUFNL, 0) -
		  IFNULL(ANEA2.VERKO, 0) > 0,
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
			   IFNULL(ANEA2.ERLBT, 0) +
			   IFNULL(ANEP2.ANBTR, 0) +
			   IFNULL(ANEA2.AUFWV, 0) +
			   IFNULL(ANEA2.AUFWL, 0) +
			   IFNULL(ANEA2.NAFAL, 0) +
			   IFNULL(ANEA2.NAFAV, 0) +
			   IFNULL(ANEA2.SAFAL, 0) +
			   IFNULL(ANEA2.SAFAV, 0) +
			   IFNULL(ANEA2.AAFAL, 0) +
			   IFNULL(ANEA2.AAFAV, 0) +
			   IFNULL(ANEA2.MAFAV, 0) +
			   IFNULL(ANEA2.MAFAL, 0) +
			   IFNULL(ANEA2.AUFNV, 0) +
			   IFNULL(ANEA2.AUFNL, 0) -
			   IFNULL(ANEA2.VERKO, 0),
			   0),
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA2.ERLBT, 0) +
			   IFNULL(ANEP2.ANBTR, 0) +
			   IFNULL(ANEA2.AUFWV, 0) +
			   IFNULL(ANEA2.AUFWL, 0) +
			   IFNULL(ANEA2.NAFAL, 0) +
			   IFNULL(ANEA2.NAFAV, 0) +
			   IFNULL(ANEA2.SAFAL, 0) +
			   IFNULL(ANEA2.SAFAV, 0) +
			   IFNULL(ANEA2.AAFAL, 0) +
			   IFNULL(ANEA2.AAFAV, 0) +
			   IFNULL(ANEA2.MAFAV, 0) +
			   IFNULL(ANEA2.MAFAL, 0) +
			   IFNULL(ANEA2.AUFNV, 0) +
			   IFNULL(ANEA2.AUFNL, 0) -
			   IFNULL(ANEA2.VERKO, 0)))), 0) + 
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IF(IFNULL(ANEA3.ERLBT, 0) +
		  IFNULL(ANEP3.ANBTR, 0) +
		  IFNULL(ANEA3.AUFWV, 0) +
		  IFNULL(ANEA3.AUFWL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0) +
		  IFNULL(ANEA3.AUFNV, 0) +
		  IFNULL(ANEA3.AUFNL, 0) -
		  IFNULL(ANEA3.VERKO, 0) > 0,
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
			   IFNULL(ANEA3.ERLBT, 0) +
			   IFNULL(ANEP3.ANBTR, 0) +
			   IFNULL(ANEA3.AUFWV, 0) +
			   IFNULL(ANEA3.AUFWL, 0) +
			   IFNULL(ANEA3.NAFAL, 0) +
			   IFNULL(ANEA3.NAFAV, 0) +
			   IFNULL(ANEA3.SAFAL, 0) +
			   IFNULL(ANEA3.SAFAV, 0) +
			   IFNULL(ANEA3.AAFAL, 0) +
			   IFNULL(ANEA3.AAFAV, 0) +
			   IFNULL(ANEA3.MAFAV, 0) +
			   IFNULL(ANEA3.MAFAL, 0) +
			   IFNULL(ANEA3.AUFNV, 0) +
			   IFNULL(ANEA3.AUFNL, 0) -
			   IFNULL(ANEA3.VERKO, 0),
			   0),
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA3.ERLBT, 0) +
			   IFNULL(ANEP3.ANBTR, 0) +
			   IFNULL(ANEA3.AUFWV, 0) +
			   IFNULL(ANEA3.AUFWL, 0) +
			   IFNULL(ANEA3.NAFAL, 0) +
			   IFNULL(ANEA3.NAFAV, 0) +
			   IFNULL(ANEA3.SAFAL, 0) +
			   IFNULL(ANEA3.SAFAV, 0) +
			   IFNULL(ANEA3.AAFAL, 0) +
			   IFNULL(ANEA3.AAFAV, 0) +
			   IFNULL(ANEA3.MAFAV, 0) +
			   IFNULL(ANEA3.MAFAL, 0) +
			   IFNULL(ANEA3.AUFNV, 0) +
			   IFNULL(ANEA3.AUFNL, 0) -
			   IFNULL(ANEA3.VERKO, 0)))), 0) + 
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IF(IFNULL(ANEA4.ERLBT, 0) +
		  IFNULL(ANEP4.ANBTR, 0) +
		  IFNULL(ANEA4.AUFWV, 0) +
		  IFNULL(ANEA4.AUFWL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0) +
		  IFNULL(ANEA4.AUFNV, 0) +
		  IFNULL(ANEA4.AUFNL, 0) -
		  IFNULL(ANEA4.VERKO, 0) > 0,
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
			   IFNULL(ANEA4.ERLBT, 0) +
			   IFNULL(ANEP4.ANBTR, 0) +
			   IFNULL(ANEA4.AUFWV, 0) +
			   IFNULL(ANEA4.AUFWL, 0) +
			   IFNULL(ANEA4.NAFAL, 0) +
			   IFNULL(ANEA4.NAFAV, 0) +
			   IFNULL(ANEA4.SAFAL, 0) +
			   IFNULL(ANEA4.SAFAV, 0) +
			   IFNULL(ANEA4.AAFAL, 0) +
			   IFNULL(ANEA4.AAFAV, 0) +
			   IFNULL(ANEA4.MAFAV, 0) +
			   IFNULL(ANEA4.MAFAL, 0) +
			   IFNULL(ANEA4.AUFNV, 0) +
			   IFNULL(ANEA4.AUFNL, 0) -
			   IFNULL(ANEA4.VERKO, 0),
			   0),
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
			   0,
			   IFNULL(ANEA4.ERLBT, 0) +
			   IFNULL(ANEP4.ANBTR, 0) +
			   IFNULL(ANEA4.AUFWV, 0) +
			   IFNULL(ANEA4.AUFWL, 0) +
			   IFNULL(ANEA4.NAFAL, 0) +
			   IFNULL(ANEA4.NAFAV, 0) +
			   IFNULL(ANEA4.SAFAL, 0) +
			   IFNULL(ANEA4.SAFAV, 0) +
			   IFNULL(ANEA4.AAFAL, 0) +
			   IFNULL(ANEA4.AAFAV, 0) +
			   IFNULL(ANEA4.MAFAV, 0) +
			   IFNULL(ANEA4.MAFAL, 0) +
			   IFNULL(ANEA4.AUFNV, 0) +
			   IFNULL(ANEA4.AUFNL, 0) -
			   IFNULL(ANEA4.VERKO, 0)))), 0)																												AS MINERL,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * (IF(IFNULL(ANEA.ERLBT, 0) +
		  IFNULL(ANEP.ANBTR, 0) +
		  IFNULL(ANEA.AUFWV, 0) +
		  IFNULL(ANEA.AUFWL, 0) +
		  IFNULL(ANEA.NAFAL, 0) +
		  IFNULL(ANEA.NAFAV, 0) +
		  IFNULL(ANEA.SAFAL, 0) +
		  IFNULL(ANEA.SAFAV, 0) +
		  IFNULL(ANEA.AAFAL, 0) +
		  IFNULL(ANEA.AAFAV, 0) +
		  IFNULL(ANEA.MAFAV, 0) +
		  IFNULL(ANEA.MAFAL, 0) +
		  IFNULL(ANEA.AUFNV, 0) +
		  IFNULL(ANEA.AUFNL, 0) -
		  IFNULL(ANEA.VERKO, 0) > 0,
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA.ERLBT, 0) +
				IFNULL(ANEP.ANBTR, 0) +
				IFNULL(ANEA.AUFWV, 0) +
				IFNULL(ANEA.AUFWL, 0) +
				IFNULL(ANEA.NAFAL, 0) +
				IFNULL(ANEA.NAFAV, 0) +
				IFNULL(ANEA.SAFAL, 0) +
				IFNULL(ANEA.SAFAV, 0) +
				IFNULL(ANEA.AAFAL, 0) +
				IFNULL(ANEA.AAFAV, 0) +
				IFNULL(ANEA.MAFAV, 0) +
				IFNULL(ANEA.MAFAL, 0) +
				IFNULL(ANEA.AUFNV, 0) +
				IFNULL(ANEA.AUFNL, 0) -
				IFNULL(ANEA.VERKO, 0)),
			IF(ANEP.LNRAN > ANEP.LNSAN AND IFNULL(ANEP.LNSAN, 0) != 0,
				IFNULL(ANEA.ERLBT, 0) +
				IFNULL(ANEP.ANBTR, 0) +
				IFNULL(ANEA.AUFWV, 0) +
				IFNULL(ANEA.AUFWL, 0) +
				IFNULL(ANEA.NAFAL, 0) +
				IFNULL(ANEA.NAFAV, 0) +
				IFNULL(ANEA.SAFAL, 0) +
				IFNULL(ANEA.SAFAV, 0) +
				IFNULL(ANEA.AAFAL, 0) +
				IFNULL(ANEA.AAFAV, 0) +
				IFNULL(ANEA.MAFAV, 0) +
				IFNULL(ANEA.MAFAL, 0) +
				IFNULL(ANEA.AUFNV, 0) +
				IFNULL(ANEA.AUFNL, 0) -
				IFNULL(ANEA.VERKO, 0),
				0))) + 
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * (IF(IFNULL(ANEA2.ERLBT, 0) +
		  IFNULL(ANEP2.ANBTR, 0) +
		  IFNULL(ANEA2.AUFWV, 0) +
		  IFNULL(ANEA2.AUFWL, 0) +
		  IFNULL(ANEA2.NAFAL, 0) +
		  IFNULL(ANEA2.NAFAV, 0) +
		  IFNULL(ANEA2.SAFAL, 0) +
		  IFNULL(ANEA2.SAFAV, 0) +
		  IFNULL(ANEA2.AAFAL, 0) +
		  IFNULL(ANEA2.AAFAV, 0) +
		  IFNULL(ANEA2.MAFAV, 0) +
		  IFNULL(ANEA2.MAFAL, 0) +
		  IFNULL(ANEA2.AUFNV, 0) +
		  IFNULL(ANEA2.AUFNL, 0) -
		  IFNULL(ANEA2.VERKO, 0) > 0,
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA2.ERLBT, 0) +
				IFNULL(ANEP2.ANBTR, 0) +
				IFNULL(ANEA2.AUFWV, 0) +
				IFNULL(ANEA2.AUFWL, 0) +
				IFNULL(ANEA2.NAFAL, 0) +
				IFNULL(ANEA2.NAFAV, 0) +
				IFNULL(ANEA2.SAFAL, 0) +
				IFNULL(ANEA2.SAFAV, 0) +
				IFNULL(ANEA2.AAFAL, 0) +
				IFNULL(ANEA2.AAFAV, 0) +
				IFNULL(ANEA2.MAFAV, 0) +
				IFNULL(ANEA2.MAFAL, 0) +
				IFNULL(ANEA2.AUFNV, 0) +
				IFNULL(ANEA2.AUFNL, 0) -
				IFNULL(ANEA2.VERKO, 0)),
			IF(ANEP2.LNRAN > ANEP2.LNSAN AND IFNULL(ANEP2.LNSAN, 0) != 0,
				IFNULL(ANEA2.ERLBT, 0) +
				IFNULL(ANEP2.ANBTR, 0) +
				IFNULL(ANEA2.AUFWV, 0) +
				IFNULL(ANEA2.AUFWL, 0) +
				IFNULL(ANEA2.NAFAL, 0) +
				IFNULL(ANEA2.NAFAV, 0) +
				IFNULL(ANEA2.SAFAL, 0) +
				IFNULL(ANEA2.SAFAV, 0) +
				IFNULL(ANEA2.AAFAL, 0) +
				IFNULL(ANEA2.AAFAV, 0) +
				IFNULL(ANEA2.MAFAV, 0) +
				IFNULL(ANEA2.MAFAL, 0) +
				IFNULL(ANEA2.AUFNV, 0) +
				IFNULL(ANEA2.AUFNL, 0) -
				IFNULL(ANEA2.VERKO, 0),
				0))), 0) + 
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * (IF(IFNULL(ANEA3.ERLBT, 0) +
		  IFNULL(ANEP3.ANBTR, 0) +
		  IFNULL(ANEA3.AUFWV, 0) +
		  IFNULL(ANEA3.AUFWL, 0) +
		  IFNULL(ANEA3.NAFAL, 0) +
		  IFNULL(ANEA3.NAFAV, 0) +
		  IFNULL(ANEA3.SAFAL, 0) +
		  IFNULL(ANEA3.SAFAV, 0) +
		  IFNULL(ANEA3.AAFAL, 0) +
		  IFNULL(ANEA3.AAFAV, 0) +
		  IFNULL(ANEA3.MAFAV, 0) +
		  IFNULL(ANEA3.MAFAL, 0) +
		  IFNULL(ANEA3.AUFNV, 0) +
		  IFNULL(ANEA3.AUFNL, 0) -
		  IFNULL(ANEA3.VERKO, 0) > 0,
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA3.ERLBT, 0) +
				IFNULL(ANEP3.ANBTR, 0) +
				IFNULL(ANEA3.AUFWV, 0) +
				IFNULL(ANEA3.AUFWL, 0) +
				IFNULL(ANEA3.NAFAL, 0) +
				IFNULL(ANEA3.NAFAV, 0) +
				IFNULL(ANEA3.SAFAL, 0) +
				IFNULL(ANEA3.SAFAV, 0) +
				IFNULL(ANEA3.AAFAL, 0) +
				IFNULL(ANEA3.AAFAV, 0) +
				IFNULL(ANEA3.MAFAV, 0) +
				IFNULL(ANEA3.MAFAL, 0) +
				IFNULL(ANEA3.AUFNV, 0) +
				IFNULL(ANEA3.AUFNL, 0) -
				IFNULL(ANEA3.VERKO, 0)),
			IF(ANEP3.LNRAN > ANEP3.LNSAN AND IFNULL(ANEP3.LNSAN, 0) != 0,
				IFNULL(ANEA3.ERLBT, 0) +
				IFNULL(ANEP3.ANBTR, 0) +
				IFNULL(ANEA3.AUFWV, 0) +
				IFNULL(ANEA3.AUFWL, 0) +
				IFNULL(ANEA3.NAFAL, 0) +
				IFNULL(ANEA3.NAFAV, 0) +
				IFNULL(ANEA3.SAFAL, 0) +
				IFNULL(ANEA3.SAFAV, 0) +
				IFNULL(ANEA3.AAFAL, 0) +
				IFNULL(ANEA3.AAFAV, 0) +
				IFNULL(ANEA3.MAFAV, 0) +
				IFNULL(ANEA3.MAFAL, 0) +
				IFNULL(ANEA3.AUFNV, 0) +
				IFNULL(ANEA3.AUFNL, 0) -
				IFNULL(ANEA3.VERKO, 0),
				0))), 0) + 
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * (IF(IFNULL(ANEA4.ERLBT, 0) +
		  IFNULL(ANEP4.ANBTR, 0) +
		  IFNULL(ANEA4.AUFWV, 0) +
		  IFNULL(ANEA4.AUFWL, 0) +
		  IFNULL(ANEA4.NAFAL, 0) +
		  IFNULL(ANEA4.NAFAV, 0) +
		  IFNULL(ANEA4.SAFAL, 0) +
		  IFNULL(ANEA4.SAFAV, 0) +
		  IFNULL(ANEA4.AAFAL, 0) +
		  IFNULL(ANEA4.AAFAV, 0) +
		  IFNULL(ANEA4.MAFAV, 0) +
		  IFNULL(ANEA4.MAFAL, 0) +
		  IFNULL(ANEA4.AUFNV, 0) +
		  IFNULL(ANEA4.AUFNL, 0) -
		  IFNULL(ANEA4.VERKO, 0) > 0,
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
				0,
				IFNULL(ANEA4.ERLBT, 0) +
				IFNULL(ANEP4.ANBTR, 0) +
				IFNULL(ANEA4.AUFWV, 0) +
				IFNULL(ANEA4.AUFWL, 0) +
				IFNULL(ANEA4.NAFAL, 0) +
				IFNULL(ANEA4.NAFAV, 0) +
				IFNULL(ANEA4.SAFAL, 0) +
				IFNULL(ANEA4.SAFAV, 0) +
				IFNULL(ANEA4.AAFAL, 0) +
				IFNULL(ANEA4.AAFAV, 0) +
				IFNULL(ANEA4.MAFAV, 0) +
				IFNULL(ANEA4.MAFAL, 0) +
				IFNULL(ANEA4.AUFNV, 0) +
				IFNULL(ANEA4.AUFNL, 0) -
				IFNULL(ANEA4.VERKO, 0)),
			IF(ANEP4.LNRAN > ANEP4.LNSAN AND IFNULL(ANEP4.LNSAN, 0) != 0,
				IFNULL(ANEA4.ERLBT, 0) +
				IFNULL(ANEP4.ANBTR, 0) +
				IFNULL(ANEA4.AUFWV, 0) +
				IFNULL(ANEA4.AUFWL, 0) +
				IFNULL(ANEA4.NAFAL, 0) +
				IFNULL(ANEA4.NAFAV, 0) +
				IFNULL(ANEA4.SAFAL, 0) +
				IFNULL(ANEA4.SAFAV, 0) +
				IFNULL(ANEA4.AAFAL, 0) +
				IFNULL(ANEA4.AAFAV, 0) +
				IFNULL(ANEA4.MAFAV, 0) +
				IFNULL(ANEA4.MAFAL, 0) +
				IFNULL(ANEA4.AUFNV, 0) +
				IFNULL(ANEA4.AUFNL, 0) -
				IFNULL(ANEA4.VERKO, 0),
				0))), 0)																																	AS MEHERL,
	  IF(AREA.ABVOR1 = '+', 1, -1) / AREA.ANTEI1 * IFNULL(ANEA.VERKO, 0) +
		IFNULL(IF(AREA.ABVOR2 = '+', 1, -1) / AREA.ANTEI2 * IFNULL(ANEA2.VERKO, 0), 0) +
		IFNULL(IF(AREA.ABVOR3 = '+', 1, -1) / AREA.ANTEI3 * IFNULL(ANEA3.VERKO, 0), 0) +
		IFNULL(IF(AREA.ABVOR4 = '+', 1, -1) / AREA.ANTEI4 * IFNULL(ANEA4.VERKO, 0), 0)																		AS VERKO,
	  T093B.WAERS																																			AS WAERS,
	  ANEK.SGTXT																																			AS SGTXT,
	  ANLA.DEAKT																																			AS DEAKT,									
	  IF(ANLA.ZUGDT = 0, NULL, ANLA.ZUGDT)																													AS ZUGDT,	  
	  LANG.LANG_KEY																																			AS LANG_KEY,
	  ANLA.MANDT																																			AS MANDT,
	  ANLA.BUKRS																																			AS BUKRS,
	  ANEK.GJAHR																																			AS GJAHR,
	  T093C.AFAPL																																			AS AFAPL,
	  T001.KTOPL																																			AS KTOPL,
	  ANEK.LNRAN																																			AS LNRAN,
	  ANEP4.BWASL																																			AS BWASL_O,
	  IFNULL(ANKB.XAFBE, '')																																AS XAFBE,
	  COALESCE(ANEP4.BUZEI, ITEM.BUZEI, ANEK.BUZEI)																											AS BUZEI,
	  CONCAT_WS(' ', RPAD(ANLA.BUKRS, 9, ' '), RPAD(ANLA.ANLKL, 13, ' '), RPAD(ANLA.TXT50, 55, ' '), RPAD(ANLA.KTOGR, 13, ' '), DATE_FORMAT(ANLA.AKTIV, '%d.%m.%Y'))	AS ANLN1_TXT,	
	  ANKT.TXK20																																						AS ANLKL_TXT,
	  TGSBT.GTEXT																																						AS GSBER_TXT,
	  CONCAT_WS(' ',RPAD(ADRC.NAME1, 45, ' '),RPAD(ADRC.NAME2, 45, ' '),RPAD(ADRC.CITY1, 45, ' '),RPAD(ADRC.POST_CODE1, 15, ' '),RPAD(ADRC.SORT1, 25, ' '),ADRC.SORT2)	AS WERKS_TXT,
	  CONCAT_WS(' ', RPAD(T499S.WERKS, 9, ' '), T499S.KTEXT)																											AS STORT_TXT,
	  T087V.ANLUE_TXT																																					AS ANLUE_TXT,
	  CONCAT_WS(' ', RPAD(T001.BUKRS, 9, ' '), COALESCE(SKAT.TXT50, SKAT2.TXT50))																						AS KTANSW_TXT,
	  TABWT.BWATXT																																						AS BWASL_TXT
	FROM 
	  database_viewbuilding.FI___DERIVED_AREAS					AS AREA
	  LEFT JOIN database_dynamic.LANGUAGE_KEYS					AS LANG 	ON TRUE
	  JOIN database_final.ANEP									AS ANEP4	ON (ANEP4.MANDT = AREA.MANDT AND ANEP4.BUKRS = AREA.BUKRS AND ANEP4.AFABE = AREA.AFABE4)
	  LEFT JOIN database_final.ANEP								AS ANEP 	ON (ANEP.MANDT = AREA.MANDT AND ANEP.BUKRS = ANEP4.BUKRS AND ANEP.ANLN1 = ANEP4.ANLN1 AND ANEP.ANLN2 = ANEP4.ANLN2 AND ANEP.GJAHR = ANEP4.GJAHR AND ANEP.LNRAN = ANEP4.LNRAN AND ANEP.AFABE = AREA.AFABE1)
	  LEFT JOIN database_final.ANEP								AS ANEP2 	ON (ANEP2.MANDT = ANEP4.MANDT AND ANEP2.BUKRS = ANEP4.BUKRS AND ANEP2.ANLN1 = ANEP4.ANLN1 AND ANEP2.ANLN2 = ANEP4.ANLN2 AND ANEP2.GJAHR = ANEP4.GJAHR AND ANEP2.LNRAN = ANEP4.LNRAN AND ANEP2.AFABE = AREA.AFABE2)
	  LEFT JOIN database_final.ANEP								AS ANEP3 	ON (ANEP3.MANDT = ANEP4.MANDT AND ANEP3.BUKRS = ANEP4.BUKRS AND ANEP3.ANLN1 = ANEP4.ANLN1 AND ANEP3.ANLN2 = ANEP4.ANLN2 AND ANEP3.GJAHR = ANEP4.GJAHR AND ANEP3.LNRAN = ANEP4.LNRAN AND ANEP3.AFABE = AREA.AFABE3)
	  LEFT JOIN database_final.ANEA 							AS ANEA 	ON (ANEA.MANDT = ANEP.MANDT AND ANEA.BUKRS = ANEP.BUKRS AND ANEA.ANLN1 = ANEP.ANLN1 AND ANEA.ANLN2 = ANEP.ANLN2 AND ANEA.GJAHR = ANEP.GJAHR AND ANEA.LNRAN = ANEP.LNRAN AND ANEA.AFABE = ANEP.AFABE)
	  LEFT JOIN database_final.ANEA 							AS ANEA2 	ON (ANEA2.MANDT = ANEP2.MANDT AND ANEA2.BUKRS = ANEP2.BUKRS AND ANEA2.ANLN1 = ANEP2.ANLN1 AND ANEA2.ANLN2 = ANEP2.ANLN2 AND ANEA2.GJAHR = ANEP2.GJAHR AND ANEA2.LNRAN = ANEP2.LNRAN AND ANEA2.AFABE = ANEP2.AFABE)
	  LEFT JOIN database_final.ANEA 							AS ANEA3 	ON (ANEA3.MANDT = ANEP3.MANDT AND ANEA3.BUKRS = ANEP3.BUKRS AND ANEA3.ANLN1 = ANEP3.ANLN1 AND ANEA3.ANLN2 = ANEP3.ANLN2 AND ANEA3.GJAHR = ANEP3.GJAHR AND ANEA3.LNRAN = ANEP3.LNRAN AND ANEA3.AFABE = ANEP3.AFABE)
	  LEFT JOIN database_final.ANEA 							AS ANEA4 	ON (ANEA4.MANDT = ANEP4.MANDT AND ANEA4.BUKRS = ANEP4.BUKRS AND ANEA4.ANLN1 = ANEP4.ANLN1 AND ANEA4.ANLN2 = ANEP4.ANLN2 AND ANEA4.GJAHR = ANEP4.GJAHR AND ANEA4.LNRAN = ANEP4.LNRAN AND ANEA4.AFABE = ANEP4.AFABE)
	  LEFT JOIN database_final.T001								AS T001 	ON (T001.MANDT = ANEP4.MANDT AND T001.BUKRS = ANEP4.BUKRS)
	  LEFT JOIN database_final.T093C							AS T093C	ON (T093C.MANDT = ANEP4.MANDT AND T093C.BUKRS = ANEP4.BUKRS)
	  JOIN database_final.ANEK									AS ANEK 	ON (ANEK.MANDT = ANEP4.MANDT AND ANEK.BUKRS = ANEP4.BUKRS AND ANEK.ANLN1 = ANEP4.ANLN1 AND ANEK.ANLN2 = ANEP4.ANLN2 AND ANEK.GJAHR = ANEP4.GJAHR AND ANEK.LNRAN = ANEP4.LNRAN)
	  JOIN database_final.ANLA									AS ANLA 	ON (ANLA.MANDT = ANEP4.MANDT AND ANLA.BUKRS = ANEP4.BUKRS AND ANLA.ANLN1 = ANEP4.ANLN1 AND ANLA.ANLN2 = ANEP4.ANLN2)
	  JOIN database_final.ANLZ									AS ANLZ 	ON (ANLZ.MANDT = ANEP4.MANDT AND ANLZ.BUKRS = ANEP4.BUKRS AND ANLZ.ANLN1 = ANEP4.ANLN1 AND ANLZ.ANLN2 = ANEP4.ANLN2 AND database_dynamic.FI___GET_REPORT_DATE(ANEP4.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP4.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP4.GJAHR)) BETWEEN ANLZ.ADATU AND ANLZ.BDATU)
	  LEFT JOIN database_viewbuilding.FI___ASSET_DOCUMENT_ITEMS	AS ITEM		ON (ITEM.MANDT = ANEK.MANDT AND ITEM.BUKRS = ANEK.BUKRS AND ITEM.ANLN1 = ANEK.ANLN1 AND ITEM.ANLN2 = ANEK.ANLN2 AND ITEM.GJAHR = ANEK.GJAHR AND ITEM.LNRAN = ANEK.LNRAN)
	  LEFT JOIN database_final.ANLB								AS ANLB 	ON (ANLB.MANDT = ANEP4.MANDT AND ANLB.BUKRS = ANEP4.BUKRS AND ANLB.ANLN1 = ANEP4.ANLN1 AND ANLB.ANLN2 = ANEP4.ANLN2 AND ANLB.AFABE = ANEP4.AFABE AND database_dynamic.FI___GET_REPORT_DATE(ANEP4.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP4.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP4.GJAHR)) BETWEEN ANLB.ADATU AND ANLB.BDATU)
	  LEFT JOIN database_final.ANKB								AS ANKB		ON (ANKB.MANDT = ANEP4.MANDT AND ANKB.ANLKL = ANLA.ANLKL AND ANKB.AFAPL = T093C.AFAPL AND ANKB.AFABE = AREA.AFABER AND database_dynamic.FI___GET_REPORT_DATE(ANEP4.MANDT, COALESCE(IF(T093C.PERIV != '', T093C.PERIV, NULL), T001.PERIV), ANEK.GJAHR, database_dynamic.FI___GET_LAST_FISCAL_PERIOD(ANEP4.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANEP4.GJAHR)) BETWEEN ANKB.ADATU AND ANKB.BDATU)
	  LEFT JOIN database_final.TKA02							AS TKA02 	ON (TKA02.MANDT = ANLZ.MANDT AND TKA02.BUKRS = ANLZ.BUKRS AND TKA02.GSBER = ANLZ.GSBER)
	  LEFT JOIN database_final.TKA02							AS TKA02B 	ON (TKA02B.MANDT = ANLZ.MANDT AND TKA02B.BUKRS = ANLZ.BUKRS AND TKA02B.GSBER = '')
	  LEFT JOIN database_final.T093B							AS T093B	ON (T093B.MANDT = ANEP4.MANDT AND T093B.BUKRS = ANEP4.BUKRS AND T093B.AFABE = ANEP4.AFABE)
	  LEFT JOIN database_final.T095P							AS T095 	ON (T095.MANDT = ANEP4.MANDT AND T095.KTOPL = T001.KTOPL AND T095.KTOGR = ANLA.KTOGR AND IFNULL(T095.AFASL, '') = IFNULL(ANLB.AFASL, '') AND T095.AFABER = AREA.AFABER)
	  LEFT JOIN database_final.T093								AS T093V	ON (T093V.MANDT = ANEP.MANDT AND T093V.AFAPL = T093C.AFAPL AND T093V.AFABER = ANEP.AFABE)
	  LEFT JOIN database_final.T093								AS T093X	ON (T093X.MANDT = ANEP.MANDT AND T093X.AFAPL = T093C.AFAPL AND T093X.AFABER = ANEP2.AFABE)
	  LEFT JOIN database_final.T093								AS T093Y	ON (T093Y.MANDT = ANEP.MANDT AND T093Y.AFAPL = T093C.AFAPL AND T093Y.AFABER = ANEP3.AFABE)
	  LEFT JOIN database_final.T093								AS T093Z	ON (T093Z.MANDT = ANEP.MANDT AND T093Z.AFAPL = T093C.AFAPL AND T093Z.AFABER = ANEP4.AFABE)	  
	  LEFT JOIN database_final.T095								AS T095B	ON (T095B.MANDT = ANEP4.MANDT AND T095B.KTOPL = T001.KTOPL AND T095B.KTOGR = ANLA.KTOGR AND T095B.AFABE = ANEP.AFABE)
	  LEFT JOIN database_final.T095								AS T095C	ON (T095C.MANDT = ANEP4.MANDT AND T095C.KTOPL = T001.KTOPL AND T095C.KTOGR = ANLA.KTOGR AND T095C.AFABE = ANEP2.AFABE)
	  LEFT JOIN database_final.T095								AS T095D	ON (T095D.MANDT = ANEP4.MANDT AND T095D.KTOPL = T001.KTOPL AND T095D.KTOGR = ANLA.KTOGR AND T095D.AFABE = ANEP3.AFABE)
	  LEFT JOIN database_final.T095								AS T095E	ON (T095E.MANDT = ANEP4.MANDT AND T095E.KTOPL = T001.KTOPL AND T095E.KTOGR = ANLA.KTOGR AND T095E.AFABE = ANEP4.AFABE)
	  LEFT JOIN database_final.T095								AS T095F	ON (T095F.MANDT = ANEP4.MANDT AND T095F.KTOPL = T001.KTOPL AND T095F.KTOGR = ANLA.KTOGR AND T095F.AFABE = 1)  
	  LEFT JOIN database_final.T006A							AS T006A 	ON (T006A.MANDT = ANEP4.MANDT AND T006A.MSEHI = ANEK.MEINS AND T006A.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.ANKT								AS ANKT 	ON (ANKT.MANDT = ANLA.MANDT AND ANKT.ANLKL = ANLA.ANLKL AND ANKT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.TGSBT							AS TGSBT 	ON (TGSBT.MANDT = ANLA.MANDT AND TGSBT.GSBER = ANLZ.GSBER AND TGSBT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.T001W							AS T001W 	ON (T001W.MANDT = ANLZ.MANDT AND T001W.WERKS = ANLZ.WERKS)
	  LEFT JOIN database_final.T499S							AS T499S 	ON (T499S.MANDT = ANLZ.MANDT AND T499S.WERKS = ANLZ.WERKS AND T499S.STAND = ANLZ.STORT)	  
	  LEFT JOIN database_final.T087V							AS T087V 	ON (T087V.MANDT = ANLA.MANDT AND T087V.ANLUE = ANLA.ANLUE AND T087V.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.T004								AS T004		ON (T004.MANDT = T001.MANDT	AND T004.KTOPL = T001.KTOPL)
	  LEFT JOIN database_final.SKAT								AS SKAT		ON (SKAT.MANDT = ANEP4.MANDT AND SKAT.KTOPL = T001.KTOPL AND SKAT.SAKNR = COALESCE(IF(T095.KTSOPO != '', T095.KTSOPO, NULL), IF(T093V.BUHBKT != '0', T095B.KTANSW, IF(T093V.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093X.BUHBKT != '0', T095C.KTANSW, IF(T093X.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Y.BUHBKT != '0', T095D.KTANSW, IF(T093Y.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Z.BUHBKT != '0', T095E.KTANSW, IF(T093Z.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), T095F.KTANSW) AND SKAT.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.SKAT								AS SKAT2 	ON (SKAT2.MANDT = ANEP4.MANDT AND SKAT2.KTOPL = T001.KTOPL AND SKAT2.SAKNR = COALESCE(IF(T095.KTSOPO != '', T095.KTSOPO, NULL), IF(T093V.BUHBKT != '0', T095B.KTANSW, IF(T093V.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093X.BUHBKT != '0', T095C.KTANSW, IF(T093X.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Y.BUHBKT != '0', T095D.KTANSW, IF(T093Y.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), IF(T093Z.BUHBKT != '0', T095E.KTANSW, IF(T093Z.BUHBKT IS NOT NULL, T095F.KTANSW, NULL)), T095F.KTANSW) AND BINARY(SKAT2.SPRAS) = BINARY(T004.DSPRA))
	  LEFT JOIN database_final.TABWT							AS TABWT 	ON (TABWT.MANDT = IFNULL(ANEP3.MANDT, ANEP4.MANDT) AND TABWT.BWASL = IFNULL(ANEP3.BWASL, ANEP4.BWASL) AND TABWT.SPRAS = LANG.LANG_KEY)	  
	  LEFT JOIN database_final.T093T							AS T093T	ON (T093T.MANDT = ANEP4.MANDT AND T093T.AFAPL = T093C.AFAPL AND T093T.AFABER = AREA.AFABER AND T093T.SPRAS = LANG.LANG_KEY)
	  LEFT JOIN database_final.ADRC								AS ADRC		ON (ADRC.CLIENT = T001W.MANDT AND ADRC.ADDRNUMBER = T001W.ADRNR AND ADRC.NATION = '')	
	WHERE
	  IFNULL(ANLB.ANLGR, '') = '' AND 
	  IFNULL(ANLA.XLOEV, '') = '' AND
	  (ANLA.DEAKT = 0 OR database_dynamic.FI___GET_FISCAL_YEAR(ANLA.MANDT, IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV), ANLA.DEAKT) >= ANEP4.GJAHR);

-- ##PROCEDURE##

DELIMITER $$
DROP PROCEDURE IF EXISTS FI___ASSET_RETIREMENTS_PROC $$
CREATE PROCEDURE FI___ASSET_RETIREMENTS_PROC (IN in_anln1From	CHAR(12)	CHARACTER SET UTF8,
											  IN in_anln1To		CHAR(12)	CHARACTER SET UTF8,
											  IN in_anln2From	CHAR(4)		CHARACTER SET UTF8,
											  IN in_anln2To		CHAR(4)		CHARACTER SET UTF8,
											  IN in_anlklFrom	CHAR(8)		CHARACTER SET UTF8,
											  IN in_anlklTo		CHAR(8)		CHARACTER SET UTF8,
											  IN in_gsberFrom	CHAR(4)		CHARACTER SET UTF8,
											  IN in_gsberTo		CHAR(4)		CHARACTER SET UTF8,
											  IN in_kostlFrom	CHAR(10)	CHARACTER SET UTF8,
											  IN in_kostlTo		CHAR(10)	CHARACTER SET UTF8,
											  IN in_werksFrom	CHAR(4)		CHARACTER SET UTF8,
											  IN in_werksTo		CHAR(4)		CHARACTER SET UTF8,
											  IN in_stortFrom	CHAR(10)	CHARACTER SET UTF8,
											  IN in_stortTo		CHAR(10)	CHARACTER SET UTF8,
											  IN in_anlueFrom	CHAR(12)	CHARACTER SET UTF8,
											  IN in_anlueTo		CHAR(12)	CHARACTER SET UTF8,
											  IN in_reportDate	DATE,
											  IN in_afabe		INT(2),
											  IN in_ktanswFrom	CHAR(10)	CHARACTER SET UTF8,
											  IN in_ktanswTo	CHAR(10)	CHARACTER SET UTF8,
											  IN in_aktivFrom	DATE, 
											  IN in_aktivTo		DATE,
											  IN in_deaktFrom	DATE, 
											  IN in_deaktTo		DATE,
											  IN in_bwaslFrom	CHAR(4)		CHARACTER SET UTF8,
											  IN in_bwaslTo		CHAR(4)		CHARACTER SET UTF8,
											  IN in_budatFrom	DATE,
											  IN in_budatTo		DATE,
											  IN in_langKey		BINARY(1),
											  IN in_mandt 		CHAR(3)		CHARACTER SET UTF8,
											  IN in_bukrs 		CHAR(4)		CHARACTER SET UTF8)
BEGIN
	-- Numerical variables
	DECLARE v_year			INT;
	DECLARE v_period		INT;
	-- String variables
	DECLARE v_periv			CHAR(2)		CHARACTER SET UTF8;
	DECLARE v_anln1From		CHAR(12)	CHARACTER SET UTF8;
	DECLARE v_anln1To		CHAR(12)	CHARACTER SET UTF8;
	DECLARE v_anln2From		CHAR(4)		CHARACTER SET UTF8;
	DECLARE v_anln2To		CHAR(4)		CHARACTER SET UTF8;
	DECLARE v_anlklFrom		CHAR(8)		CHARACTER SET UTF8;
	DECLARE v_anlklTo		CHAR(8)		CHARACTER SET UTF8;
	DECLARE v_bwaslFrom		CHAR(3)		CHARACTER SET UTF8;
	DECLARE v_bwaslTo		CHAR(3)		CHARACTER SET UTF8;
	DECLARE v_gsberFrom		CHAR(4)		CHARACTER SET UTF8;
	DECLARE v_gsberTo		CHAR(4)		CHARACTER SET UTF8;
	DECLARE v_kostlFrom		CHAR(10)	CHARACTER SET UTF8;
	DECLARE v_kostlTo		CHAR(10)	CHARACTER SET UTF8;
	DECLARE v_werksFrom		CHAR(4)		CHARACTER SET UTF8;
	DECLARE v_werksTo		CHAR(4)		CHARACTER SET UTF8;
	DECLARE v_stortFrom		CHAR(10)	CHARACTER SET UTF8;
	DECLARE v_stortTo		CHAR(10)	CHARACTER SET UTF8;
	DECLARE v_anlueFrom		CHAR(12)	CHARACTER SET UTF8;
	DECLARE v_anlueTo		CHAR(12)	CHARACTER SET UTF8;
	DECLARE v_ktanswFrom	CHAR(10)	CHARACTER SET UTF8;
	DECLARE v_ktanswTo		CHAR(10)	CHARACTER SET UTF8;
	-- Date variables
	DECLARE v_aktivFrom		DATE;
	DECLARE v_aktivTo		DATE;
	DECLARE v_deaktFrom		DATE;
	DECLARE v_deaktTo		DATE;
	DECLARE v_budatFrom		DATE;
	DECLARE v_budatTo		DATE;
	-- Logical variables
	DECLARE v_xstore		BOOLEAN DEFAULT FALSE;
	DECLARE v_periodIsLast	BOOLEAN DEFAULT FALSE;

	-- Exit procedure if an unhandled error occures
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
    END;

	-- Disable autocommit and set character set
	SET AUTOCOMMIT = 0;
	SET NAMES UTF8;

	-- Empty the base table
	TRUNCATE TABLE FI___ASSET_RETIREMENTS_DYN;

	-- Place procedure routines into transaction
	START TRANSACTION;

		-- Get the fiscal year variant of the company
		SELECT 
			IF(T093C.PERIV != '', T093C.PERIV, T001.PERIV)
		INTO 
			v_periv
		FROM
			database_final.T093C		AS T093C
			JOIN database_final.T001	AS T001 ON (T001.MANDT = T093C.MANDT AND T001.BUKRS = T093C.BUKRS)
		WHERE
			T093C.MANDT = in_mandt AND
			T093C.BUKRS = in_bukrs;
	
		-- Determine the fiscal year/period and the type of the deprecation area (real/derived)
		SET v_year := database_dynamic.FI___GET_FISCAL_YEAR(in_mandt, v_periv, in_reportDate);
		SET v_period := database_dynamic.FI___GET_FISCAL_PERIOD(in_mandt, v_periv, in_reportDate);
		SET v_xstore := database_dynamic.FI___IS_DERIVED_AREA(in_mandt, in_bukrs, in_afabe);
		
		-- Determine the financial period is the last of the given financial year
		SET v_periodIsLast := database_dynamic.FI___GET_LAST_FISCAL_PERIOD(in_mandt, v_periv, v_year) = v_period;
		
		-- If every required parameter is set
		IF(IFNULL(in_bukrs, '') != '' AND IFNULL(in_afabe, '') != '' AND IFNULL(in_reportDate, '') != '' AND v_periodIsLast) THEN
		
			-- ---------------
			-- ASSET SELECTION
			-- ---------------
			
			-- Set asset intervals			
			SET v_anln1From := IFNULL(IF(in_anln1From != '', in_anln1From, NULL), '            ');
			SET v_anln1To := IFNULL(IF(in_anln1To != '', in_anln1To, NULL), IFNULL(IF(in_anln1From != '', in_anln1From, NULL), 'ZZZZZZZZZZZZ'));
			
			SET v_anln2From := IFNULL(IF(in_anln2From != '', in_anln2From, NULL), '    ');
			SET v_anln2To := IFNULL(IF(in_anln2To != '', in_anln2To, NULL), IFNULL(IF(in_anln2From != '', in_anln2From, NULL), 'ZZZZ'));
			
			-- Table of selected assets
			DROP TABLE IF EXISTS FI___ASSET_RETIREMENTS___ANLA;
			CREATE TABLE FI___ASSET_RETIREMENTS___ANLA
			(
				PRIMARY KEY (MANDT, BUKRS, ANLN1, ANLN2)
			) CHARACTER SET	UTF8
			  ENGINE		MyISAM
			  SELECT
				  MANDT, 
				  BUKRS, 
				  ANLN1, 
				  ANLN2
				FROM
				  database_final.ANLA
				WHERE
				  MANDT = in_mandt AND
				  BUKRS = in_bukrs AND
				  ANLN1 BETWEEN v_anln1From AND v_anln1To AND
				  ANLN2 BETWEEN v_anln2From AND v_anln2To;
				
			-- ---------------------
			-- ASSET CLASS SELECTION
			-- ---------------------
			
			-- Set asset class interval			
			SET v_anlklFrom := IFNULL(IF(in_anlklFrom != '', in_anlklFrom, NULL), '        ');
			SET v_anlklTo := IFNULL(IF(in_anlklTo != '', in_anlklTo, NULL), IFNULL(IF(in_anlklFrom != '', in_anlklFrom, NULL), 'ZZZZZZZZ'));
			
			-- Table of selected asset classes
			DROP TABLE IF EXISTS FI___ASSET_RETIREMENTS___ANKA;
			CREATE TABLE FI___ASSET_RETIREMENTS___ANKA
			(
				PRIMARY KEY (MANDT, ANLKL)
			) CHARACTER SET	UTF8
			  ENGINE		MyISAM
			  SELECT
				  MANDT, 
				  ANLKL
				FROM
				  database_final.ANKA
				WHERE
				  MANDT = in_mandt AND
				  ANLKL BETWEEN v_anlklFrom AND v_anlklTo;
				
			-- --------------------------------
			-- ASSET TRANSACTION TYPE SELECTION
			-- --------------------------------
			
			-- Table of asset transaction types
			DROP TABLE IF EXISTS FI___ASSET_RETIREMENTS___TABW;
			
			-- If asset transaction type selection is defined
			IF(IFNULL(in_bwaslFrom, '') != '' OR IFNULL(in_bwaslTo, '') != '') THEN
			
				-- Set asset transaction type interval			
				SET v_bwaslFrom := IFNULL(IF(in_bwaslFrom != '', in_bwaslFrom, NULL), '   ');
				SET v_bwaslTo := IFNULL(IF(in_bwaslTo != '', in_bwaslTo, NULL), IFNULL(IF(in_bwaslFrom != '', in_bwaslFrom, NULL), 'ZZZ'));
				
				-- Table of selected asset transaction types
				CREATE TABLE FI___ASSET_RETIREMENTS___TABW
				(
					PRIMARY KEY (MANDT, BWASL)
				) CHARACTER SET	UTF8
				  ENGINE		MyISAM
				  SELECT
					  MANDT, 
					  BWASL
					FROM
					  database_final.TABW
					WHERE
					  MANDT = in_mandt AND
					  BWASL BETWEEN v_bwaslFrom AND v_bwaslTo;
	
			-- No asset transaction type selection is defined
			ELSE
				
				-- Table of asset transaction types of intercompany asset transfer
				CREATE TABLE FI___ASSET_RETIREMENTS___TABW
				(
					PRIMARY KEY (MANDT, BWASL)
				) CHARACTER SET	UTF8
				  ENGINE		MyISAM
				  SELECT
					  MANDT, 
					  BWASL
					FROM
					  database_final.TABW
					WHERE
					  MANDT = in_mandt AND
					  database_dynamic.FI___GET_ASSET_LIST_TYPE(MANDT, BWASL) = 'ABG';

			END IF;
			
			-- Set intervals			
			SET v_gsberFrom := IFNULL(IF(in_gsberFrom != '', in_gsberFrom, NULL), '    ');
			SET v_gsberTo := IFNULL(IF(in_gsberTo != '', in_gsberTo, NULL), IFNULL(IF(in_gsberFrom != '', in_gsberFrom, NULL), 'ZZZZ'));
			
			SET v_kostlFrom := IFNULL(IF(in_kostlFrom != '', in_kostlFrom, NULL), '          ');
			SET v_kostlTo := IFNULL(IF(in_kostlTo != '', in_kostlTo, NULL), IFNULL(IF(in_kostlFrom != '', in_kostlFrom, NULL), 'ZZZZZZZZZZ'));
			
			SET v_werksFrom := IFNULL(IF(in_werksFrom != '', in_werksFrom, NULL), '    ');
			SET v_werksTo := IFNULL(IF(in_werksTo != '', in_werksTo, NULL), IFNULL(IF(in_werksFrom != '', in_werksFrom, NULL), 'ZZZZ'));
			
			SET v_stortFrom := IFNULL(IF(in_stortFrom != '', in_stortFrom, NULL), '          ');
			SET v_stortTo := IFNULL(IF(in_stortTo != '', in_stortTo, NULL), IFNULL(IF(in_stortFrom != '', in_stortFrom, NULL), 'ZZZZZZZZZZ'));
			
			SET v_anlueFrom := IFNULL(IF(in_anlueFrom != '', in_anlueFrom, NULL), '            ');
			SET v_anlueTo := IFNULL(IF(in_anlueTo != '', in_anlueTo, NULL), IFNULL(IF(in_anlueFrom != '', in_anlueFrom, NULL), 'ZZZZZZZZZZZZ'));
			
			SET v_ktanswFrom := IFNULL(IF(in_ktanswFrom != '', in_ktanswFrom, NULL), '          ');
			SET v_ktanswTo := IFNULL(IF(in_ktanswTo != '', in_ktanswTo, NULL), IFNULL(IF(in_ktanswFrom != '', in_ktanswFrom, NULL), 'ZZZZZZZZZZ'));
			
			SET v_aktivFrom := IFNULL(IF(in_aktivFrom != '', in_aktivFrom, NULL), DATE('0000-00-00'));
			SET v_aktivTo := IFNULL(IF(in_aktivTo != '', in_aktivTo, NULL), IFNULL(IF(in_aktivFrom != '', in_aktivFrom, NULL), DATE('9999-12-31')));
			
			SET v_deaktFrom := IFNULL(IF(in_deaktFrom != '', in_deaktFrom, NULL), DATE('0000-00-00'));
			SET v_deaktTo := IFNULL(IF(in_deaktTo != '', in_deaktTo, NULL), IFNULL(IF(in_deaktFrom != '', in_deaktFrom, NULL), DATE('9999-12-31')));
			
			SET v_budatFrom := IFNULL(IF(in_budatFrom != '', in_budatFrom, NULL), DATE('0000-00-00'));
			SET v_budatTo := IFNULL(IF(in_budatTo != '', in_budatTo, NULL), IFNULL(IF(in_budatFrom != '', in_budatFrom, NULL), DATE('9999-12-31')));
		
			-- --------------------------------------------
			-- INSERTION OF THE REQUIRED ASSET TRANSACTIONS
			-- --------------------------------------------
			INSERT INTO FI___ASSET_RETIREMENTS_DYN (AFABE,
			                                        AFABE_TXT,
			                                        KTANSW,
			                                        ANLKL,
			                                        ANLN1,
			                                        ANLN2,
			                                        AKTIV,
			                                        ANLN_TXT,
			                                        DEAKT,
			                                        ANLN_TXT2,
			                                        BELNR,
			                                        BUDAT,
			                                        BZDAT,
			                                        BWASL,
			                                        XBLNR,
			                                        MENGE,
			                                        MSEH3,
			                                        SGTXT,
			                                        WAERS,
			                                        ANBTR,
			                                        ANAFA,
			                                        BOOKA,
			                                        ERLBT,
			                                        MINERL,
			                                        MEHERL,
			                                        VERKO,
			                                        MANDT,
			                                        BUKRS,
			                                        KTOPL,
			                                        LNRAN,
			                                        GJAHR,
			                                        LANG_KEY)
			  SELECT
				  ANEP.AFABE,
				  ANEP.AFABE_TXT,
				  ANEP.KTANSW,
				  ANEP.ANLKL,
				  ANEP.ANLN1,
				  ANEP.ANLN2,
				  ANEP.AKTIV,
				  ANEP.ANLN_TXT,
				  ANEP.DEAKT,
				  ANEP.ANLN_TXT2,
				  ANEP.BELNR,
				  ANEP.BUDAT,
				  ANEP.BZDAT,
				  ANEP.BWASL,
				  ANEP.XBLNR,
				  ANEP.MENGE,
				  ANEP.MSEH3,
				  ANEP.SGTXT,
				  ANEP.WAERS,
				  ANEP.ANBTR,
				  ANEP.ANAFA,
				  ANEP.BOOKA,
				  ANEP.ERLBT,
				  ANEP.MINERL,
				  ANEP.MEHERL,
				  ANEP.VERKO,
				  ANEP.MANDT,
				  ANEP.BUKRS,
				  ANEP.KTOPL,
				  ANEP.LNRAN,
				  ANEP.GJAHR,
				  ANEP.LANG_KEY
				FROM
				  database_dynamic.FI___ASSET_RETIREMENTS	AS ANEP
				  JOIN FI___ASSET_RETIREMENTS___ANLA		AS ANLA ON (ANLA.MANDT = ANEP.MANDT AND ANLA.BUKRS = ANEP.BUKRS AND ANLA.ANLN1 = ANEP.ANLN1 AND ANLA.ANLN2 = ANEP.ANLN2)
				  JOIN FI___ASSET_RETIREMENTS___ANKA		AS ANKA ON (ANKA.MANDT = ANEP.MANDT AND ANKA.ANLKL = ANEP.ANLKL)
				  JOIN FI___ASSET_RETIREMENTS___TABW		AS TABW ON (TABW.MANDT = ANEP.MANDT AND TABW.BWASL = ANEP.BWASL_O)
				WHERE 
				  ANEP.MANDT = in_mandt AND
				  ANEP.BUKRS = in_bukrs AND
				  ANEP.AFABE = in_afabe AND 
				  ANEP.GJAHR = v_year AND 
				  ANEP.REPORT_DATE = in_reportDate AND 
				  ANEP.GSBER BETWEEN v_gsberFrom AND v_gsberTo AND
				  ANEP.KOSTL BETWEEN v_kostlFrom AND v_kostlTo AND
				  ANEP.WERKS BETWEEN v_werksFrom AND v_werksTo AND
				  ANEP.STORT BETWEEN v_stortFrom AND v_stortTo AND
				  ANEP.ANLUE BETWEEN v_anlueFrom AND v_anlueTo AND
				  ANEP.KTANSW BETWEEN v_ktanswFrom AND v_ktanswTo AND
				  ANEP.AKTIV BETWEEN v_aktivFrom AND v_aktivTo AND 
				  ANEP.DEAKT BETWEEN v_deaktFrom AND v_deaktTo AND
				  ANEP.BUDAT BETWEEN v_budatFrom AND v_budatTo AND
				  IF(v_xstore, ANEP.XAFBE = '', TRUE) AND -- asset class is deactivated on the given derived deprecation area (there could be systems which do not consider this fact)
				  ANEP.LANG_KEY = in_langKey;
				
		END IF;
	
	-- Commit transaction
	COMMIT;

END $$
DELIMITER ;
 
 -- ##DUPLICATION##
 
SELECT *, COUNT(*) FROM database_dynamic.FI___ASSET_RETIREMENTS
GROUP BY LANG_KEY, MANDT, BUKRS, GJAHR, ANLN1, ANLN2, AFABE, BELNR, BUZEI, LNRAN
HAVING COUNT(*) > 1;

-- ##JIRA_ISSUE_ID##	 



-- ##END_VIEW##