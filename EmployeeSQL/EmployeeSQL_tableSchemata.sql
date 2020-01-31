-- Clear any possible instances of similar table names
-- Use error exceptions: DROP TABLE IF EXISTS
DROP TABLE IF EXISTS Departments CASCADE;
DROP TABLE IF EXISTS Dept_emp CASCADE;
DROP TABLE IF EXISTS Dept_manager CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Titles CASCADE;
DROP TABLE IF EXISTS Salaries CASCADE;

-- create a table schema for each of the six CSV files
-- https://www.tutorialspoint.com/plsql/plsql_data_types.htm
-- specify data types, primary keys, foreign keys, and other constraints.
-- Lesson learned: to establish dependencies, create tables with primary keys FIRST.

CREATE TABLE Departments (
  dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
  dept_name VARCHAR NOT NULL
);

CREATE TABLE Employees (
  emp_no INT PRIMARY KEY NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR NOT NULL,	
  last_name VARCHAR NOT NULL,	
  gender VARCHAR(7) NOT NULL,
  hire_date DATE NOT NULL
);

CREATE TABLE Dept_emp (
  emp_no INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
  dept_no VARCHAR(30) NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES Departments (dept_no), 
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);

CREATE TABLE Dept_manager (
  dept_no VARCHAR(30) NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES Departments (dept_no), 
  emp_no INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);

CREATE TABLE Titles (
  emp_no INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
  title VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);

CREATE TABLE Salaries (
  emp_no INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);
   
----Option 1: Import the data from the CSV files into the DB tables using code (below)
-- employee_db=# \copy departments FROM 'C:/077_sql-repo/RU-SOM-DATA-PT-11-2019-U-C/02-Homework/09-SQL/Instructions/data/departments.csv' DELIMITER ',' CSV HEADER;

----Option 2: Import the data from the CSV files into the DB tables using the IMPORT/EXPORT Tool
-- Lesson learned: to establish dependencies, sequence the upload to do the primary tables (primary keys) FIRST.

-- Check the tables:
SELECT * FROM departments LIMIT 10;
SELECT * FROM dept_emp LIMIT 10;
SELECT * FROM dept_manager LIMIT 10;
SELECT * FROM employees LIMIT 10
SELECT * FROM titles LIMIT 10;
SELECT * FROM salaries LIMIT 10;
