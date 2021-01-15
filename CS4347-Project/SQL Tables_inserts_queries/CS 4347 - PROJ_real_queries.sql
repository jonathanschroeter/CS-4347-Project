--11/29/2020 V3

alter session set nls_date_format = 'yyyy-mon-dd'

--#Views
--#1
CREATE VIEW SALARY_AVERAGE AS
SELECT P.Personal_ID AS Salary_ID,P.First_name AS Salary_fname,P.Last_name AS Salary_lname,AVG(S.Amount) AS Salary_avg
FROM SALARY_TRANSACTIONS S,PERSON P
WHERE P.Personal_ID=S.Personal_ID
GROUP BY P.Personal_ID,P.First_name,P.Last_name,S.Amount
ORDER BY AVG(S.Amount) DESC;

--#2
CREATE VIEW ROUND_PASS AS
SELECT Canidate_ID AS Round_ID,Job_ID AS Round_JOB, Count(*) AS Round_count
FROM INTERVIEW
GROUP BY Canidate_ID,Job_ID
HAVING AVG(SCORE) > 60
ORDER BY Canidate_ID,Job_ID;

--#3 Should be done
CREATE VIEW PRODUCT_SOLD AS 
    SELECT Product_type AS Sold_type, Count_sold AS SOLD
    FROM PRODUCT P, (SELECT S.Product_id AS S_ID,Count(S.Product_id) AS Count_sold
        FROM SALES_HISTORY S
        GROUP BY S.Product_id)
    WHERE P.Product_id=S_ID
    GROUP BY Product_type,Count_sold;

--#4
    CREATE VIEW PRODUCT_4 AS
    SELECT Product_ID AS Product_ID_PARTS,Sum(Cost_part) AS Sum_costs
    FROM(SELECT P.Product_ID,P.Part_ID,Min(V.Price)*P.Part_count AS Cost_part
    FROM VENDOR_SALES V, PRODUCT_PARTS P
    WHERE V.Part_ID=P.Part_ID
    GROUP BY P.Product_ID,P.Part_ID,P.Part_count)
    GROUP BY Product_ID
    ORDER BY Product_ID;

--Queries
--#1
SELECT Personal_ID,First_name, Last_name
FROM PERSON, Interview
WHERE Interviewer_ID=Personal_ID and Job_ID=11111 AND Canidate_ID IN( SELECT Personal_id
                                    FROM PERSON
                                    WHERE First_name='Hellen' AND Last_name='Cole');
--#2
SELECT J.Job_ID
FROM JOB_POSITION J, DEPARTMENT D
WHERE J.Posted_date BETWEEN TO_DATE('2011-01-01','YYYY-MM-DD') AND TO_DATE('2011-1-31','YYYY-MM-DD') AND J.Department_ID=D.Department_ID
AND D.Department_name='Marketing';
--#3
SELECT P.Personal_ID,P.First_name,P.Last_name
FROM Person P
WHERE Personal_ID IN(
    SELECT E.Personal_ID
    FROM EMPLOYEE E
    WHERE E.Personal_id NOT IN(SELECT Supervisor_ID
                        FROM EMPLOYEE
                        WHERE Supervisor_ID IS NOT NULL));  
--#4
SELECT Distinct Site_ID,Site_location,Site_state
FROM MARKETING_SITE
WHERE Site_ID NOT IN(SELECT Site_ID
    FROM SALES_HISTORY
    WHERE Sale_time BETWEEN TO_DATE('2011-03-01','YYYY-MM-DD') AND TO_DATE('2011-03-31','YYYY-MM-DD'));
--#5
SELECT Job_ID,Job_description 
FROM JOB_POSITION
WHERE Job_ID NOT IN(
    SELECT I.Job_ID
    FROM JOB_POSITION J, Interview I
    WHERE J.Job_ID=I.Job_ID AND I.Time BETWEEN TO_TIMESTAMP(TO_CHAR(J.Posted_date, 'YYYYMMDD HH24:MI'), 
    'YYYYMMDD HH24:MI') AND TO_TIMESTAMP(TO_CHAR(ADD_MONTHS(J.Posted_date, 1), 'YYYYMMDD HH24:MI'), 
    'YYYYMMDD HH24:MI')
    GROUP BY I.Canidate_ID,I.Job_ID
    HAVING COUNT(*) >= 5 AND AVG(Score) > 70);
    
    
--#6 Questions
SELECT Personal_ID, First_name,Last_name
FROM PERSON
WHERE Personal_ID IN(SELECT Personal_ID
FROM EMPLOYEE, (SELECT S.Employee_ID AS Seller_ID, COUNT(DISTINCT S.Product_ID) AS Seller_count, COUNT(DISTINCT P.Product_ID)AS Price_count
    FROM SALES_HISTORY S,Product P
    WHERE P.List_price>200 AND S.Product_ID IN(SELECT R.Product_ID
                                            FROM Product R
                                            WHERE List_price>200)
    GROUP BY S.Employee_ID)
WHERE Seller_count=Price_count AND Personal_ID=Seller_ID);


--#7
SELECT Department_id,Department_name 
FROM DEPARTMENT 
WHERE Department_id NOT IN(SELECT DISTINCT Department_id
    FROM   JOB_POSITION
    WHERE  Posted_date BETWEEN TO_DATE('2011-01-01','YYYY-MM-DD') AND TO_DATE('2011-02-01','YYYY-MM-DD'));


--#8
SELECT Personal_ID,First_name,Last_name,Department_ID
FROM PERSON,Job_position
WHERE Job_ID=12345 AND Personal_ID IN(SELECT Personal_ID
    FROM EMPLOYEE
    WHERE Personal_ID IN(SELECT Personal_ID
    FROM APPLIES_FOR
    WHERE Job_ID=12345));

--#9 Questions
SELECT DISTINCT Product_type
FROM PRODUCT
WHERE Product_ID IN(SELECT Product_id
    FROM SALES_HISTORY
    GROUP BY Product_id
    ORDER BY count(*) DESC
    FETCH FIRST ROW ONLY);

--#10
SELECT P.Product_type, SUM(P.List_price-Sum_costs)
FROM PRODUCT_4,PRODUCT P,SALES_HISTORY S
WHERE P.Product_ID=Product_ID_PARTS AND P.Product_ID IN
(SELECT Product_id 
FROM SALES_HISTORY)
GROUP BY P.Product_type
ORDER BY SUM(P.List_price-Sum_costs) DESC
FETCH FIRST ROW ONLY;

--#11
SELECT Personal_ID,First_name,Last_name
FROM PERSON, (SELECT DISTINCT Personal_ID AS E_ID, Count(DISTINCT S.Department_ID)AS E_count
    FROM SHIFT S
    GROUP BY Personal_ID
    HAVING COUNT(DISTINCT S.Department_ID) = (SELECT COUNT(*)
    FROM DEPARTMENT))
WHERE Personal_ID=E_ID;
    

--#12
SELECT DISTINCT P.First_name, P.Last_name, P.Email
FROM PERSON P
WHERE P.Personal_ID IN(
SELECT Canidate_ID
FROM INTERVIEW
GROUP BY Canidate_ID,Job_ID 
HAVING COUNT(*) >= 5 AND AVG(SCORE) > 70);

--#13
SELECT P.Personal_ID,P.First_name,P.Last_name,R.Phone_number,P.Email
FROM PERSON P,PHONE_NUMBER R
WHERE P.Personal_ID IN(SELECT A.Personal_ID
    FROM APPLIES_FOR A
    WHERE A.Personal_ID NOT IN(
        SELECT DISTINCT Canidate_ID
        FROM INTERVIEW
        GROUP BY Canidate_ID,Job_ID
        HAVING AVG(Score) <= 70 OR COUNT(*) < 5
        UNION
        SELECT DISTINCT Personal_ID
        FROM APPLIES_FOR
        WHERE Personal_ID NOT IN(SELECT Canidate_ID
                        FROM INTERVIEW))) 
AND P.Personal_ID=R.Personal_ID;

--#14
SELECT Personal_ID,First_name,Last_name
FROM PERSON
WHERE Personal_ID IN(SELECT Personal_ID
    FROM SALARY_TRANSACTIONS
    GROUP BY Personal_ID
    ORDER BY AVG(Amount) DESC
    FETCH FIRST ROW ONLY);
--#15
SELECT R.Vendor_ID,R.Name
FROM VENDOR R
WHERE R.Vendor_ID IN(SELECT V.Vendor_ID
    FROM VENDOR_SALES V
    WHERE V.Part_ID IN(SELECT P.Part_ID
        FROM PART P
        WHERE P.Weight < 4 AND P.Part_name='Cup')
    ORDER BY Price DESC
    FETCH FIRST ROW ONLY);



