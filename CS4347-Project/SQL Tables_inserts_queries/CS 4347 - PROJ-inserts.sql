--11/29/2020 V3
alter session set nls_date_format='YYYY-MM-DD';


--PERSON
   --Hellen
   INSERT INTO PERSON(Personal_ID,Age,First_name,Last_name,Gender,Zip,State,City,Address_line1,Address_line2,Email) VALUES
   ('HEC122',28, 'Hellen', 'Cole', 'F',75080,'TX','Richardson', '1101 Drive Trail', NULL, 'H.cole@company.net');
   --John
   INSERT INTO PERSON(Personal_ID,Age,First_name,Last_name,Gender,Zip,State,City,Address_line1,Address_line2,Email) VALUES
   ('JOS145',21, 'John', 'Smith', 'M',75014,'TX','Irving', '1501 North Lake', NULL, 'J.smith@company.net');
   --Wilbur
   INSERT INTO PERSON(Personal_ID,Age,First_name,Last_name,Gender,Zip,State,City,Address_line1,Address_line2,Email) VALUES
   ('WIW675',56, 'Wilbur', 'West', 'M',75014,'TX','Irving', '1501 North Lake', NULL, 'W.west@company.net');
   --William
   INSERT INTO PERSON(Personal_ID,Age,First_name,Last_name,Gender,Zip,State,City,Address_line1,Address_line2,Email) VALUES
   ('WIN980',18, 'William', 'North', 'M',75080,'TX','Richardson', '1101 Drive Trail', NULL, 'W.north@company.net');
   --Jane
   INSERT INTO PERSON(Personal_ID,Age,First_name,Last_name,Gender,Zip,State,City,Address_line1,Address_line2,Email) VALUES
   ('JAD965',64, 'Jane', 'Doe', 'F',75080,'TX','Richardson', '1101 Drive Trail', NULL, 'J.doe@company.net');
   --Jes (look at the email for this boy)
   INSERT INTO PERSON(Personal_ID,Age,First_name,Last_name,Gender,Zip,State,City,Address_line1,Address_line2,Email) VALUES
   ('JET0845',17, 'Jes', 'Ter', 'M',75080,'TX','Richardson', '1101 Drive Trail', NULL, 'J.ter@company.net');
   --Joe
   INSERT INTO PERSON(Personal_ID,Age,First_name,Last_name,Gender,Zip,State,City,Address_line1,Address_line2,Email) VALUES
   ('JOS9854',17, 'Joe', 'Smith', 'M',75080,'TX','Richardson', '1101 Drive Trail', NULL, 'J.smith1@company.net');
   --Jose
   INSERT INTO PERSON(Personal_ID,Age,First_name,Last_name,Gender,Zip,State,City,Address_line1,Address_line2,Email) VALUES
   ('JOR8967',56, 'Jose', 'Rod', 'M',75080,'TX','Richardson', '1101 Drive Trail', NULL, 'J.rode@company.net');
   INSERT INTO PERSON(Personal_ID,Age,First_name,Last_name,Gender,Zip,State,City,Address_line1,Address_line2,Email) VALUES
   ('TES1234',17, 'Test', 'Test', 'M',75080,'TX','Richardson', '1101 Drive Trail', NULL, 'J.rode@company.net');

    --POTENTIAL_EMPLOYEE
   INSERT INTO POTENTIAL_EMPLOYEE(Personal_ID) VALUES('JOS145');
   INSERT INTO POTENTIAL_EMPLOYEE(Personal_ID) VALUES('WIW675');
   INSERT INTO POTENTIAL_EMPLOYEE(Personal_ID) VALUES('JET0845');
   INSERT INTO POTENTIAL_EMPLOYEE(Personal_ID) VALUES('HEC122');
   
   --EMPLOYEE
   INSERT INTO EMPLOYEE(Personal_ID, Rank, Title, Supervisor_ID) VALUES('JOR8967', 'SR', 'Manager', NULL);
   INSERT INTO EMPLOYEE(Personal_ID, Rank, Title, Supervisor_ID) VALUES('HEC122', 'SR', 'Manager', NULL);
   INSERT INTO EMPLOYEE(Personal_ID, Rank, Title, Supervisor_ID) VALUES('JAD965', 'JR', 'Manager', NULL);
   INSERT INTO EMPLOYEE(Personal_ID, Rank, Title, Supervisor_ID) VALUES('JOS9854', 'JR', 'Manager', NULL);
   INSERT INTO EMPLOYEE(Personal_ID, Rank, Title, Supervisor_ID) VALUES('WIW675', 'JR', 'Coder', 'HEC122');
   INSERT INTO EMPLOYEE(Personal_ID, Rank, Title, Supervisor_ID) VALUES('WIN980', 'SR', 'Planner', 'HEC122');
   INSERT INTO EMPLOYEE(Personal_ID, Rank, Title, Supervisor_ID) VALUES('JET0845', 'Substitute', 'Planner', 'JAD965');
   INSERT INTO EMPLOYEE(Personal_ID, Rank, Title, Supervisor_ID) VALUES('TES1234', 'JR', 'Tester', 'WIW675');
   
   
   --CUSTOMER
   INSERT INTO CUSTOMER(Personal_ID,PreferredSales_ID) VALUES('JET0845', 'JAD965');
   INSERT INTO CUSTOMER(Personal_ID,PreferredSales_ID) VALUES('HEC122', 'WIW675');
   
   --Department
   INSERT INTO DEPARTMENT(Department_ID,Manager_ID,Department_name)VALUES(123,'HEC122', 'West Wing');
   INSERT INTO DEPARTMENT(Department_ID,Manager_ID,Department_name)VALUES(368,'JAD965', 'Planner Corp');
   INSERT INTO DEPARTMENT(Department_ID,Manager_ID,Department_name)VALUES(345,'JOS9854', 'Marketing');
   
   --SHIFT (STILL NEED TO DO/ASK ABOUT TIMESTAMP)
   INSERT INTO SHIFT(Personal_ID,Department_ID,Start_time,End_time)
   VALUES('WIW675',123, TO_TIMESTAMP('1999-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2000-1-1 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   
   INSERT INTO SHIFT(Personal_ID,Department_ID,Start_time,End_time)
   VALUES('WIW675',123, TO_TIMESTAMP('2000-01-28 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2000-01-29 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   
   DELETE FROM SHIFT WHERE Start_time=TO_TIMESTAMP('2000-01-28 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6');
   
   INSERT INTO SHIFT(Personal_ID,Department_ID,Start_time,End_time)
   VALUES('WIW675',123, TO_TIMESTAMP('1999-11-25 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('1999-11-26 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   INSERT INTO SHIFT(Personal_ID,Department_ID,Start_time,End_time)
   VALUES('WIW675',123, TO_TIMESTAMP('2005-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2006-1-1 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   INSERT INTO SHIFT(Personal_ID,Department_ID,Start_time,End_time)
   VALUES('WIW675',368, TO_TIMESTAMP('2004-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2005-1-1 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
    INSERT INTO SHIFT(Personal_ID,Department_ID,Start_time,End_time)
   VALUES('WIW675',345, TO_TIMESTAMP('2004-1-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2005-2-1 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   INSERT INTO SHIFT(Personal_ID,Department_ID,Start_time,End_time)
   VALUES('JET0845',123, TO_TIMESTAMP('2005-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2006-1-1 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   INSERT INTO SHIFT(Personal_ID,Department_ID,Start_time,End_time)
   VALUES('HEC122',123, TO_TIMESTAMP('2005-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2006-1-1 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   INSERT INTO SHIFT(Personal_ID,Department_ID,Start_time,End_time)
   VALUES('JAD965',368, TO_TIMESTAMP('2005-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2006-1-1 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   INSERT INTO SHIFT(Personal_ID,Department_ID,Start_time,End_time)
   VALUES('JOR8967',345, TO_TIMESTAMP('2005-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2006-1-1 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   INSERT INTO SHIFT(Personal_ID,Department_ID,Start_time,End_time)
   VALUES('JOR8967',345, TO_TIMESTAMP('2011-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2011-1-1 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   INSERT INTO SHIFT(Personal_ID,Department_ID,Start_time,End_time)
   VALUES('JOS9854',345, TO_TIMESTAMP('2005-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2006-1-1 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   INSERT INTO SHIFT(Personal_ID,Department_ID,Start_time,End_time)
   VALUES('JOS9854',345, TO_TIMESTAMP('2011-12-31 23:59:59.10 ','YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP('2011-1-1 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   
   --SALARY_TRANSACTIONS
   INSERT INTO SALARY_TRANSACTIONS(Transaction_number,Personal_ID,Pay_date,Amount) VALUES(1, 'JAD965', TO_TIMESTAMP('2005-12-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF6'), 10000);
   INSERT INTO SALARY_TRANSACTIONS(Transaction_number,Personal_ID,Pay_date,Amount) VALUES(2, 'JAD965', TO_TIMESTAMP('2006-1-31 23:59:59.10', 'YYYY-MM-DD HH24:MI:SS.FF6'), 10000);
   INSERT INTO SALARY_TRANSACTIONS(Transaction_number,Personal_ID,Pay_date,Amount) VALUES(3, 'JAD965', TO_TIMESTAMP('2006-2-28 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 10000);
   INSERT INTO SALARY_TRANSACTIONS(Transaction_number,Personal_ID,Pay_date,Amount) VALUES(1, 'HEC122', TO_TIMESTAMP('2005-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 100);
   INSERT INTO SALARY_TRANSACTIONS(Transaction_number,Personal_ID,Pay_date,Amount) VALUES(2, 'HEC122', TO_TIMESTAMP('2006-1-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 100);
   INSERT INTO SALARY_TRANSACTIONS(Transaction_number,Personal_ID,Pay_date,Amount) VALUES(1, 'WIW675', TO_TIMESTAMP('2005-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 1000);
   
   --JOB_POSITION
   INSERT INTO JOB_POSITION(Department_ID,Job_ID,Job_description,Posted_date) VALUES(123, 1, 'This is a test position', TO_TIMESTAMP('2005-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   INSERT INTO JOB_POSITION(Department_ID,Job_ID,Job_description,Posted_date) VALUES(368, 2, 'This is a test position', TO_TIMESTAMP('2011-1-5 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   INSERT INTO JOB_POSITION(Department_ID,Job_ID,Job_description,Posted_date) VALUES(345, 3, 'Test for query 2', TO_TIMESTAMP('2011-1-6 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   INSERT INTO JOB_POSITION(Department_ID,Job_ID,Job_description,Posted_date) VALUES(368, 12345, 'Position for Planner Corp',TO_TIMESTAMP('2017-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   INSERT INTO JOB_POSITION(Department_ID,Job_ID,Job_description,Posted_date) VALUES(368, 11111, 'Test for Hellen  Cole', TO_TIMESTAMP('2017-12-31 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
   
   --APPLIES_FOR
   INSERT INTO APPLIES_FOR(Personal_ID,Job_ID) VALUES('JOS145', 11111);
   INSERT INTO APPLIES_FOR(Personal_ID,Job_ID) VALUES('JOS145', 2);
   INSERT INTO APPLIES_FOR(Personal_ID,Job_ID) VALUES('WIW675', 11111);
   INSERT INTO APPLIES_FOR(Personal_ID,Job_ID) VALUES('WIW675', 12345);
   INSERT INTO APPLIES_FOR(Personal_ID,Job_ID) VALUES('WIW675', 2);
   INSERT INTO APPLIES_FOR(Personal_ID,Job_ID) VALUES('JOR8967', 2);
   INSERT INTO APPLIES_FOR(Personal_ID,Job_ID) VALUES('HEC122', 2);
   INSERT INTO APPLIES_FOR(Personal_ID,Job_ID) VALUES('HEC122', 11111);
   
    --INTERVIEW (STILL NEED TO DO/ASK ABOUT DOUBLE REFERENCE)
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score)
   VALUES('HEC122', 'JOS145', 11111, TO_TIMESTAMP('2018-1-2 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 1, 50);
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score) 
   VALUES('HEC122', 'JOS145', 11111, TO_TIMESTAMP('2018-1-3 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 2, 70);
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score) 
   VALUES('HEC122', 'JOS145', 11111, TO_TIMESTAMP('2018-1-4 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 3, 80);
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score) 
   VALUES('HEC122', 'JOS145', 11111, TO_TIMESTAMP('2018-1-6 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 4, 90);
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score) 
   VALUES('HEC122', 'JOS145', 11111, TO_TIMESTAMP('2018-1-4 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 5, 80);
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score) 
   VALUES('HEC122', 'WIW675', 11111, TO_TIMESTAMP('2018-1-5 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 1, 20);
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score) 
   VALUES('JAD965', 'WIW675', 2, TO_TIMESTAMP('2013-1-5 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 1, 20);
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score) 
   VALUES('JAD965', 'HEC122', 2, TO_TIMESTAMP('2018-1-28 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 1, 80);
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score) 
   VALUES('JAD965', 'HEC122', 11111, TO_TIMESTAMP('2020-1-28 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 1, 100);
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score) 
   VALUES('JAD965', 'WIW675', 12345, TO_TIMESTAMP('2020-1-29 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 1, 0);
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score) 
   VALUES('JAD965', 'WIW675', 12345, TO_TIMESTAMP('2020-2-1 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 3, 5);
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score) 
   VALUES('JAD965', 'WIW675', 12345, TO_TIMESTAMP('2020-2-1 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 2, 5);
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score) 
   VALUES('JAD965', 'WIW675', 12345, TO_TIMESTAMP('2020-2-3 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 4, 5);
   INSERT INTO INTERVIEW(Interviewer_ID,Canidate_ID,Job_ID,Time,Round_number,Score) 
   VALUES('JAD965', 'WIW675', 12345, TO_TIMESTAMP('2020-2-4 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'), 5, 5);
   
   --MARKETING_SITE
   INSERT INTO MARKETING_SITE(Site_name, SIte_ID, Site_location, Site_state) VALUES ('South Beach', 123, 'Richardson', 'TX');
   INSERT INTO MARKETING_SITE(Site_name, SIte_ID, Site_location, Site_state) VALUES ('Test', 124, 'Dallas', 'TX');
   INSERT INTO MARKETING_SITE(Site_name, SIte_ID, Site_location, Site_state) VALUES ('Back', 125, 'Irving', 'TX');
   INSERT INTO MARKETING_SITE(Site_name, SIte_ID, Site_location, Site_state) VALUES ('West Beach', 126, 'Plano', 'TX');
   
    --SITE_WORKERS
   INSERT INTO SITE_WORKERS(Personal_ID, Site_ID) Values('HEC122', 124);
   INSERT INTO SITE_WORKERS(Personal_ID, Site_ID) Values('WIW675', 125);
   INSERT INTO SITE_WORKERS(Personal_ID, Site_ID) Values('WIN980', 126);
   INSERT INTO SITE_WORKERS(Personal_ID, Site_ID) Values('JAD965', 124);
   INSERT INTO SITE_WORKERS(Personal_ID, Site_ID) Values('JOS9854', 126);
   INSERT INTO SITE_WORKERS(Personal_ID, Site_ID) Values('JET0845', 125);
   INSERT INTO SITE_WORKERS(Personal_ID, Site_ID) Values('JOR8967', 123);
   
   --VENDOR
   INSERT INTO VENDOR(Vendor_id,Name,Address_line1,Address_line2,Zip,State,City,Account_number,Credit_rating,PURCHASING_WEB_URL) VALUES
   ('1', 'Test', '1303 Pan Rd', NULL, 75080, 'TX', 'Richardson', 123, 670, 'www.test.com');
   INSERT INTO VENDOR(Vendor_id,Name,Address_line1,Address_line2,Zip,State,City,Account_number,Credit_rating,PURCHASING_WEB_URL) VALUES
   ('2', 'Monthly', '1401 Reach', NULL, 75080, 'TX', 'Richardson', 567, 500, 'www.Montly.com');
   INSERT INTO VENDOR(Vendor_id,Name,Address_line1,Address_line2,Zip,State,City,Account_number,Credit_rating,PURCHASING_WEB_URL) VALUES
   ('3', 'SellersUnit', '1507 No', NULL, 75080, 'TX', 'Richardson' ,854, 400, 'www.SellersUnit.com');
   
   --PART
   INSERT INTO PART(Part_id,Part_name,Weight) VALUES(1, 'RobinBanks', 1);
   INSERT INTO PART(Part_id,Part_name,Weight) VALUES(2, 'Fixer', 3);
   INSERT INTO PART(Part_id,Part_name,Weight) VALUES(3, 'Cup', 3);
   INSERT INTO PART(Part_id,Part_name,Weight) VALUES(4, 'LeftNumber', 7);
   INSERT INTO PART(Part_id,Part_name,Weight) VALUES(5, 'BackFlip', 5);
   
   
   --VENDOR_SALES
   INSERT INTO VENDOR_SALES(Part_id, Price, Vendor_id) VALUES(1, 100, '1');
   INSERT INTO VENDOR_SALES(Part_id, Price, Vendor_id) VALUES(1, 201, '2');
   INSERT INTO VENDOR_SALES(Part_id, Price, Vendor_id) VALUES(1, 50, '3');
   INSERT INTO VENDOR_SALES(Part_id, Price, Vendor_id) VALUES(3, 60, '1');
   INSERT INTO VENDOR_SALES(Part_id, Price, Vendor_id) VALUES(3, 20, '3');
   INSERT INTO VENDOR_SALES(Part_id, Price, Vendor_id) VALUES(2, 10, '2');
   INSERT INTO VENDOR_SALES(Part_id, Price, Vendor_id) VALUES(4, 1, '3');
   
   --PRODUCT 
   INSERT INTO PRODUCT(Product_id,List_price,Product_name,Weight,Product_style,Product_size,Product_type)
   VALUES('1', 201, 'Wheel', 50, 'Round', 163, 'Car Wheel');
   INSERT INTO PRODUCT(Product_id,List_price,Product_name,Weight,Product_style,Product_size,Product_type)
   VALUES('2', 201, 'Spike', 20, 'Flat', 58, 'Test');
   INSERT INTO PRODUCT(Product_id,List_price,Product_name,Weight,Product_style,Product_size,Product_type)
   VALUES('3', 1, 'Stick', 5, 'Long', 5, 'Wooden Stick');
   INSERT INTO PRODUCT(Product_id,List_price,Product_name,Weight,Product_style,Product_size,Product_type)
   VALUES('4', 100, 'Stick', 1000, 'Long', 100, 'Wooden Stick');
   INSERT INTO PRODUCT(Product_id,List_price,Product_name,Weight,Product_style,Product_size,Product_type)
   VALUES('5', 100, 'Stick', 10000, 'Long', 10000, 'Wooden Stick');

   
    
    
   --SALES_HISTORY
    INSERT INTO SALES_HISTORY(Site_ID,Product_id,Employee_ID,Customer_ID,Sale_time)
    VALUES(123, '1', 'WIW675', 'JET0845', TO_TIMESTAMP('2020-2-4 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
    INSERT INTO SALES_HISTORY(Site_ID,Product_id,Employee_ID,Customer_ID,Sale_time)
    VALUES(123, '1', 'WIW675', 'JET0845', TO_TIMESTAMP('2020-2-7 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
    
    
    
    INSERT INTO SALES_HISTORY(Site_ID,Product_id,Employee_ID,Customer_ID,Sale_time)
    VALUES(123, '2', 'WIW675', 'JET0845', TO_TIMESTAMP('2020-2-5 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
    INSERT INTO SALES_HISTORY(Site_ID,Product_id,Employee_ID,Customer_ID,Sale_time)
    VALUES(123, '1', 'WIN980', 'JET0845', TO_TIMESTAMP('2020-2-8 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
    
    INSERT INTO SALES_HISTORY(Site_ID,Product_id,Employee_ID,Customer_ID,Sale_time)
    VALUES(123, '5', 'WIW675', 'JET0845', TO_TIMESTAMP('2020-2-9 23:59:59.10','YYYY-MM-DD HH24:MI:SS.FF6'));
    
    
    
    --PRODUCT_PARTS
   INSERT INTO PRODUCT_PARTS(Product_id,Part_id,Part_count) VALUES ('1', 1, 100);
   INSERT INTO PRODUCT_PARTS(Product_id,Part_id,Part_count) VALUES ('2', 1, 400);
   INSERT INTO PRODUCT_PARTS(Product_id,Part_id,Part_count) VALUES ('3', 1, 3);
   INSERT INTO PRODUCT_PARTS(Product_id,Part_id,Part_count) VALUES ('3', 2, 1000);
   INSERT INTO PRODUCT_PARTS(Product_id,Part_id,Part_count) VALUES ('3', 4, 50);
   INSERT INTO PRODUCT_PARTS(Product_id,Part_id,Part_count) VALUES ('4', 4, 50);
   INSERT INTO PRODUCT_PARTS(Product_id,Part_id,Part_count) VALUES ('4', 1, 16);
   INSERT INTO PRODUCT_PARTS(Product_id,Part_id,Part_count) VALUES ('5', 4, 1);
   
   --Phone_number
   INSERT INTO PHONE_NUMBER(Personal_ID,Phone_number) VALUES('WIW675' ,2125643478);
   INSERT INTO PHONE_NUMBER(Personal_ID,Phone_number) VALUES('JOS145' ,2222222222);
   INSERT INTO PHONE_NUMBER(Personal_ID,Phone_number) VALUES('WIW675' ,2125643479);
   INSERT INTO PHONE_NUMBER(Personal_ID,Phone_number) VALUES('HEC122' ,6784553567);
   INSERT INTO PHONE_NUMBER(Personal_ID,Phone_number) VALUES('JAD965' ,7777777777);
   INSERT INTO PHONE_NUMBER(Personal_ID,Phone_number) VALUES('JAD965' ,5555555555);