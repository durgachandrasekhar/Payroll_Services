  
-- Welcome TO PayRoll Services

--UC1 Ability to Create Database
create Database Payroll_Services
select * from sys.databases
use Payroll_Services

--UC2 Create Table employee_payroll in Payroll Service
Create table employee_payroll	
(
	Id int identity(1, 1) primary Key,
	Name varchar(50),
	Salary money Not Null,
	Start datetime Not Null,
	gender VARCHAR(1)
	)

--UC3 Ability to Create employee_payroll data
use Payroll_Services

insert into employee_payroll(Name, Salary, Start) VALUES
	('Billi',100000.0,'2018-01-03'),
	('Terisa',200000.0,'2019-11-13'),
	('Charlie',300000.0,'2021-05-21')

--UC4 Retrieving Data
use Payroll_Services

select * from employee_payroll

--UC5
select Name, Salary from employee_payroll WHERE Name='Bill'

select * from employee_payroll 
	WHERE start BETWEEN CAST('2021-01-01' AS DATE) AND GETDATE() 

select * from employee_payroll 
	WHERE start BETWEEN CAST('2021-01-01' AS DATE) AND CAST('2021-09-01' AS DATE) 

--UC6
ALTER TABLE employee_payroll ADD gender VARCHAR(1)
update employee_payroll set gender = 'F' WHere Name = 'Terisha'
update employee_payroll set gender = 'M' WHere Name = 'Charlie' or Name = 'Bill' 
update employee_payroll set Salary = 300000 WHere Name = 'Terisha'

--UC7
select sum(salary) from employee_payroll where gender='M' group by Gender;
select sum(salary) from employee_payroll  group by Gender;
select sum(salary) as 'totalSalary',gender from employee_payroll group by Gender;
select avg(salary) as 'averageSalary',gender from employee_payroll group by Gender;
select min(salary) as 'minimumSalary',gender from employee_payroll group by Gender;
select max(salary) as 'maximumSalary',gender from employee_payroll group by Gender;
select count(Gender) as 'male' from employee_payroll where gender='M' 
select count(Gender) as 'female' from employee_payroll where gender='F'

--UC8
ALTER TABLE employee_payroll ADD phone_number VARCHAR(13) Not null
ALTER TABLE employee_payroll ADD address VARCHAR(10) Not null DEFAULT 'TBD'
ALTER TABLE employee_payroll ADD department VARCHAR(10) Not null DEFAULT 'IT'

--UC9
alter table employee_payroll add
	deduction real ,
	taxable_pay money,
	income_tax money,
	net_pay float