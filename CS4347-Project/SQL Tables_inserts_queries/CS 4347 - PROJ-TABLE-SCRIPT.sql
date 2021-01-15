--11/29/2020 V3
CREATE TABLE PART(Part_id NUMBER NOT NULL,
			Part_name VARCHAR2(15) NOT NULL,
            Weight NUMBER NOT NULL,
			PRIMARY KEY(Part_id));
            
CREATE TABLE PRODUCT(Product_id VARCHAR2(10) NOT NULL,
			List_price NUMBER NOT NULL,
			Product_name VARCHAR2(15) NOT NULL,
			Weight NUMBER NOT NULL,
			Product_Style VARCHAR2(15) NOT NULL,
			Product_size NUMBER NOT NULL,
			Product_type VARCHAR2(100) NOT NULL,
			PRIMARY KEY(Product_id));
       
CREATE TABLE MARKETING_SITE(Site_name VARCHAR2(15) NOT NULL,
			Site_ID NUMBER NOT NULL,
			Site_location VARCHAR2(30) NOT NULL,
            Site_state VARCHAR2(2) NOT NULL,
			PRIMARY KEY(Site_ID));
            
CREATE TABLE VENDOR(Vendor_id VARCHAR2(10) NOT NULL,
			Name VARCHAR2(15) NOT NULL,
			Address_line1 VARCHAR2(100) NOT NULL,
			Address_line2 VARCHAR2(100),
			Zip NUMBER(5,0) NOT NULL,
			State VARCHAR2(2) NOT NULL,
			City VARCHAR2(15) NOT NULL,
			Account_number NUMBER NOT NULL,
			Credit_rating NUMBER NOT NULL,
			PURCHASING_WEB_URL VARCHAR2(100) NOT NULL,
			PRIMARY KEY(Vendor_id));
            
CREATE TABLE VENDOR_SALES(Part_id NUMBER NOT NULL,
			Price NUMBER NOT NULL,
			Vendor_id VARCHAR2(10) NOT NULL,
			PRIMARY KEY(Part_id,Vendor_id),
			FOREIGN KEY(Part_id) REFERENCES PART(Part_id),
			FOREIGN KEY(Vendor_id) REFERENCES VENDOR(Vendor_id));
            
CREATE TABLE PRODUCT_PARTS(Product_id VARCHAR2(10) NOT NULL,
			Part_id NUMBER NOT NULL,
			Part_count NUMBER NOT NULL,
			PRIMARY KEY(Product_id, Part_id),
			FOREIGN KEY(Part_id) REFERENCES PART(Part_id),
			FOREIGN KEY(Product_id) REFERENCES PRODUCT(Product_id));
            
CREATE TABLE PERSON(Personal_ID VARCHAR2(10) NOT NULL,
			Age NUMBER(3,0) NOT NULL,
			First_name VARCHAR2(15) NOT NULL,
			Last_name VARCHAR2(15) NOT NULL,
			Gender VARCHAR2(1) NOT NULL,
			Zip NUMBER NOT NULL,
			State VARCHAR2(2) NOT NULL,
			City VARCHAR2(15) NOT NULL,
			Address_line1 VARCHAR2(100) NOT NULL,
			Address_line2 VARCHAR2(15),
			Email VARCHAR2(50) NOT NULL,
			PRIMARY KEY(Personal_ID));
            
CREATE TABLE POTENTIAL_EMPLOYEE(Personal_ID VARCHAR2(10) NOT NULL,
			PRIMARY KEY(Personal_ID),
            FOREIGN KEY(Personal_ID) REFERENCES PERSON(Personal_ID));
            
CREATE TABLE EMPLOYEE(Personal_ID VARCHAR2(10) NOT NULL,
			Rank VARCHAR2(15) NOT NULL,
            Title VARCHAR2(15) NOT NULL,
			Supervisor_ID VARCHAR2(10),
			PRIMARY KEY(Personal_ID),
			FOREIGN KEY(Personal_ID) REFERENCES PERSON(Personal_ID));
            

            
CREATE TABLE DEPARTMENT(Department_ID NUMBER(3,0) NOT NULL,
			Manager_ID VARCHAR2(10) NOT NULL,
			Department_name VARCHAR2(15) NOT NULL,
			PRIMARY KEY(Department_ID));
            
alter table EMPLOYEE add FOREIGN KEY(Supervisor_ID) REFERENCES EMPLOYEE(Personal_ID);
alter table DEPARTMENT ADD FOREIGN KEY(Manager_ID) REFERENCES EMPLOYEE(Personal_ID);

CREATE TABLE CUSTOMER(Personal_ID VARCHAR2(10) NOT NULL,
			PreferredSales_ID VARCHAR2(10) NOT NULL,
			PRIMARY KEY(Personal_ID),
			FOREIGN KEY(Personal_ID) REFERENCES PERSON(Personal_ID),
			FOREIGN KEY(PreferredSales_ID) REFERENCES EMPLOYEE(Personal_ID));
            
CREATE TABLE SALARY_TRANSACTIONS(Transaction_number NUMBER NOT NULL,
			Personal_ID VARCHAR2(10) NOT NULL,
			Pay_date TIMESTAMP NOT NULL,
			Amount NUMBER NOT NULL,
			PRIMARY KEY(Personal_ID, Transaction_number));

CREATE TABLE SHIFT(Department_ID NUMBER(3,0) NOT NULL,
			Personal_ID VARCHAR2(10) NOT NULL,
			Start_time TIMESTAMP NOT NULL,
			End_time TIMESTAMP NOT NULL,
			PRIMARY KEY(Department_ID, Personal_ID, Start_time),
            FOREIGN KEY(Personal_ID) REFERENCES EMPLOYEE(Personal_ID),
			FOREIGN KEY(Department_ID) REFERENCES DEPARTMENT (Department_ID));
            
CREATE TABLE JOB_POSITION(Department_ID NUMBER(3,0) NOT NULL,
			Job_ID NUMBER NOT NULL,
			Job_description VARCHAR2(100) NOT NULL,
			Posted_date TIMESTAMP NOT NULL,
			PRIMARY KEY(Job_ID),
			FOREIGN KEY(Department_ID) REFERENCES DEPARTMENT (Department_ID));
            
CREATE TABLE APPLIES_FOR(Personal_ID VARCHAR2(10) NOT NULL,
			Job_ID NUMBER NOT NULL,
			PRIMARY KEY(Personal_ID, Job_ID),
			FOREIGN KEY(Personal_ID)REFERENCES PERSON(Personal_ID),
			FOREIGN KEY(Job_ID)REFERENCES JOB_POSITION(Job_ID));

CREATE TABLE SITE_WORKERS(Personal_ID VARCHAR2(10) NOT NULL,
			Site_ID NUMBER NOT NULL,
			PRIMARY KEY(Site_ID, Personal_ID),
			FOREIGN KEY(Personal_ID) REFERENCES EMPLOYEE(Personal_ID),
			FOREIGN KEY(Site_ID) REFERENCES MARKETING_SITE(Site_ID));
            
CREATE TABLE Interview(Interviewer_ID VARCHAR2(10) NOT NULL,
			Canidate_ID VARCHAR2(10) NOT NULL,
			Job_ID NUMBER NOT NULL,
			Time TIMESTAMP NOT NULL,
			Round_number NUMBER NOT NULL,
			Score NUMBER NOT NULL,
			PRIMARY KEY(Canidate_id, Job_ID, Round_number),
			FOREIGN KEY(Interviewer_ID) REFERENCES EMPLOYEE(Personal_ID),
			FOREIGN KEY(Canidate_ID) REFERENCES POTENTIAL_EMPLOYEE (Personal_ID),
			FOREIGN KEY(Job_ID) REFERENCES Job_position (Job_ID));
            
CREATE TABLE PHONE_NUMBER(
			Personal_ID VARCHAR2(10) NOT NULL,
			Phone_number NUMBER(10) NOT NULL,
			PRIMARY KEY(Personal_ID, Phone_number),
			FOREIGN KEY(Personal_ID) REFERENCES PERSON(Personal_ID));
            
CREATE TABLE SALES_HISTORY(Site_ID NUMBER NOT NULL,
			Product_id VARCHAR2(10) NOT NULL,
			Employee_ID VARCHAR2(10) NOT NULL,
			Customer_ID VARCHAR2(10) NOT NULL,
			Sale_time TIMESTAMP NOT NULL,
			PRIMARY KEY(Site_ID ,Product_id, Employee_ID, Customer_ID, Sale_time),
			FOREIGN KEY(Site_ID) REFERENCES MARKETING_SITE(Site_ID),
			FOREIGN KEY(Product_id) REFERENCES PRODUCT(Product_id),
            FOREIGN KEY(Employee_ID) REFERENCES EMPLOYEE(Personal_ID),
            FOREIGN KEY(Customer_ID) REFERENCES CUSTOMER(Personal_ID));

--Check conditions 
alter table PERSON add CHECK(Age between 16 and 65);
alter table SALARY_TRANSACTIONS add CHECK(Transaction_number  between 1 and 999999);
alter table SALARY_TRANSACTIONS add CHECK(Amount between 1 and 999999999);
alter table DEPARTMENT add CHECK(Department_ID  between 100 and 999);
alter table SHIFT add CHECK(Department_ID  between 100 and 999);
alter table JOB_POSITION add CHECK(Job_ID between 1 and 9999999);
alter table APPLIES_FOR add CHECK(Job_ID between 1 and 9999999);
alter table Interview add CHECK(Job_ID between 1 and 9999999);
alter table Interview add CHECK(Round_number between 1 and 100);
alter table MARKETING_SITE add CHECK(Site_ID between 1 and 99999);
alter table SITE_WORKERS add CHECK(Site_ID between 1 and 99999);
alter table PRODUCT add CHECK(List_price between 1 and 99999);
alter table PRODUCT add CHECK(Weight between 1 and 99999);
alter table PRODUCT add CHECK(Product_Size between 1 and 99999);
alter table VENDOR add CHECK(Account_number between 1 and 99999);
alter table VENDOR add CHECK(Credit_rating between 1 and 99999);
alter table PART add CHECK(Part_id between 1 and 99999);
alter table PART add CHECK(Weight between 1 and 99999);
alter table SALES_HISTORY add CHECK(Site_ID between 1 and 99999);
alter table VENDOR_SALES add CHECK(Part_id between 1 and 99999);
alter table VENDOR_SALES add CHECK(Price between 1 and 99999);
alter table PRODUCT_PARTS add CHECK(Part_id between 1 and 99999);
alter table PRODUCT_PARTS add CHECK(Part_count between 1 and 99999);