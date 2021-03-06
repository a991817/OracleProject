--------------------------------------------------------
--  文件已创建 - 星期四-十二月-27-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TEACHER
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TEACHER" 
   (	"TNO" VARCHAR2(20 BYTE), 
	"TNAME" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.TEACHER
SET DEFINE OFF;
Insert into SYSTEM.TEACHER (TNO,TNAME) values ('t1','马云');
Insert into SYSTEM.TEACHER (TNO,TNAME) values ('t2','马化腾');
Insert into SYSTEM.TEACHER (TNO,TNAME) values ('t3','王健林');
Insert into SYSTEM.TEACHER (TNO,TNAME) values ('t4','李彦宏');
Insert into SYSTEM.TEACHER (TNO,TNAME) values ('t5','丁磊');
--------------------------------------------------------
--  DDL for Index TEACHER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."TEACHER_PK" ON "SYSTEM"."TEACHER" ("TNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table TEACHER
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TEACHER" MODIFY ("TNO" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."TEACHER" MODIFY ("TNAME" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."TEACHER" ADD CONSTRAINT "TEACHER_PK" PRIMARY KEY ("TNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
