Create table EMPLOYEE
(EMPID INT,
EMP_NAME VARCHAR(200),
MANAGERID INT,
SALARY INT,
LOCATION VARCHAR(200));


SELECT * FROM EMPLOYEE

INSERT INTO EMPLOYEE VALUES
('1','Alice','2','5000','New York'),
('2','Bob',NULL,'8000','New York'),
('3','Charlie','2','4000','London'),
('4','David','2','6000','London'),
('5','Eve','1','5500','Paris'),
('6','Frank','2','4500','Paris'),
('7','Grace','4','6500','New York');


--Write a SQL query to find employees whose salary is greater than the average salary of their respective locations.

WITH CTE AS
(
SELECT 
		LOCATION,
		ROUND(AVG(SALARY),2)AS AVG_SALARY	
FROM EMPLOYEE
GROUP BY 1)
SELECT E1.EMPID,
       E1.EMP_NAME,
       E1.SALARY,
       E1.LOCATION,
	   CTE.AVG_SALARY
FROM EMPLOYEE E1
JOIN CTE ON E1.LOCATION=CTE.LOCATION
WHERE E1.SALARY > CTE.AVG_SALARY