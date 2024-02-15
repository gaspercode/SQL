CREATE TABLE employees
  (
     emp_no     INT PRIMARY KEY AUTO_INCREMENT,
     department VARCHAR(20),
     salary     INT
  );

INSERT INTO employees
            (department,
             salary)
VALUES      ('engineering',
             80000),
            ('engineering',
             69000),
            ('engineering',
             70000),
            ('engineering',
             103000),
            ('engineering',
             67000),
            ('engineering',
             89000),
            ('engineering',
             91000),
            ('sales',
             59000),
            ('sales',
             70000),
            ('sales',
             159000),
            ('sales',
             72000),
            ('sales',
             60000),
            ('sales',
             61000),
            ('sales',
             61000),
            ('customer service',
             38000),
            ('customer service',
             45000),
            ('customer service',
             61000),
            ('customer service',
             40000),
            ('customer service',
             31000),
            ('customer service',
             56000),
            ('customer service',
             55000); 


#This OVER(PARTITION BY) function queries the data set for each employee ID, department, salary, and the average salary of each department.
SELECT *,
       AVG(salary)
         OVER(
           PARTITION BY department) AS department_avg
FROM   employees; 


#ORDER BY will change the Window function below.
#Using ORDER BY in OVER() will query for a rolling salary total (alongside a static department salary total).
SELECT *,
       SUM(salary)
         OVER(
           PARTITION BY department
           ORDER BY salary DESC)    AS rolling_dept_salary,
       SUM(salary)
         OVER(
           PARTITION BY department) AS department_salary_total
FROM   employees; 


#Using RANK, we can rank employees by their salary.
#We can also PARTITION BY department so ranks are separated based on department.
#ROW_NUMBER() displays...the row number!
SELECT *,
       RANK()
         OVER(
           PARTITION BY department
           ORDER BY salary DESC) AS department_salary_rank,
       RANK()
         OVER(
           ORDER BY salary DESC) AS overall_salary_rank,
       ROW_NUMBER()
         OVER(
           ORDER BY salary DESC) AS row_num
FROM   employees; 


#The NTILE() function will divide the salaries by 4 quarters (quartile).
#It will then display which quartile each salary is in.
#We can also partition by department to get the value for the department salary quartile.
SELECT *,
       NTILE(4)
         OVER(
           PARTITION BY department
           ORDER BY salary DESC) AS department_quartile,
       NTILE(4)
         OVER(
           ORDER BY salary DESC) AS salary_quartile
FROM   employees; 


#FIRST_VALUE() in this case will display the employee number who has the highest salary in each department.
SELECT *,
       FIRST_VALUE(emp_no)
         OVER(
           PARTITION BY department
           ORDER BY salary DESC) AS highest_paid_dept
FROM   employees; 


#LAG() will display the previous value.
#Here we can subtract LAG from salary to see the salary difference between the previous row and the current row.
SELECT *,
       salary - LAG(salary)
                  OVER(
                    PARTITION BY department
                    ORDER BY salary DESC) AS salary_diff
FROM   employees; 


#LEAD() will do the same here, but for the next row instead of the previous one.
SELECT *,
       salary - LEAD(salary)
                  OVER(
                    PARTITION BY department
                    ORDER BY salary DESC) AS salary_diff
FROM   employees; 