--------------------------------------------------------
--  �ļ��Ѵ��� - ������-ʮ����-27-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CLASS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."CLASS" 
   (	"CNO" VARCHAR2(20 BYTE), 
	"CNAME" VARCHAR2(20 BYTE), 
	"NUMBERS" NUMBER DEFAULT 0
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.CLASS
SET DEFINE OFF;
Insert into SYSTEM.CLASS (CNO,CNAME,NUMBERS) values ('cl1','�������׿Խ1��',1);
Insert into SYSTEM.CLASS (CNO,CNAME,NUMBERS) values ('cl2','�������׿Խ2��',4);
Insert into SYSTEM.CLASS (CNO,CNAME,NUMBERS) values ('cl3','�������ѧ�뼼��1��',4);
Insert into SYSTEM.CLASS (CNO,CNAME,NUMBERS) values ('cl4','�������1��',4);
Insert into SYSTEM.CLASS (CNO,CNAME,NUMBERS) values ('cl5','�������2��',4);
Insert into SYSTEM.CLASS (CNO,CNAME,NUMBERS) values ('cl6','���繤��1��',4);
Insert into SYSTEM.CLASS (CNO,CNAME,NUMBERS) values ('cl9','���繤��2��',0);
Insert into SYSTEM.CLASS (CNO,CNAME,NUMBERS) values ('cl10','�ſ�1��',0);
Insert into SYSTEM.CLASS (CNO,CNAME,NUMBERS) values ('cl11','�ſ�2��',0);
Insert into SYSTEM.CLASS (CNO,CNAME,NUMBERS) values ('cl12','ͨ�Ź���2��',1);
Insert into SYSTEM.CLASS (CNO,CNAME,NUMBERS) values ('cl13','�������3��',0);
Insert into SYSTEM.CLASS (CNO,CNAME,NUMBERS) values ('cl14','�������4��',0);
--------------------------------------------------------
--  DDL for Index CLASS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."CLASS_PK" ON "SYSTEM"."CLASS" ("CNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table CLASS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."CLASS" ADD CONSTRAINT "CLASS_PK" PRIMARY KEY ("CNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
 
  ALTER TABLE "SYSTEM"."CLASS" MODIFY ("CNO" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."CLASS" MODIFY ("CNAME" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."CLASS" MODIFY ("NUMBERS" NOT NULL ENABLE);
