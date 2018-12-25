--------------------------------------------------------
--  文件已创建 - 星期二-十二月-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SCORE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."SCORE" 
   (	"CNO" VARCHAR2(20 BYTE), 
	"SNO" VARCHAR2(20 BYTE), 
	"SCORE" NUMBER DEFAULT '0'
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.SCORE
SET DEFINE OFF;
Insert into SYSTEM.SCORE (CNO,SNO,SCORE) values ('c2','1002',80);
Insert into SYSTEM.SCORE (CNO,SNO,SCORE) values ('c7','1001',99);
Insert into SYSTEM.SCORE (CNO,SNO,SCORE) values ('c1','1001',70);
Insert into SYSTEM.SCORE (CNO,SNO,SCORE) values ('c7','1002',99);
Insert into SYSTEM.SCORE (CNO,SNO,SCORE) values ('c2','1001',88);
Insert into SYSTEM.SCORE (CNO,SNO,SCORE) values ('c10','1001',0);
Insert into SYSTEM.SCORE (CNO,SNO,SCORE) values ('c11','1001',0);
Insert into SYSTEM.SCORE (CNO,SNO,SCORE) values ('c8','1001',0);
--------------------------------------------------------
--  DDL for Index SYS_C0011184
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C0011184" ON "SYSTEM"."SCORE" ("CNO", "SNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table SCORE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."SCORE" ADD PRIMARY KEY ("CNO", "SNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
