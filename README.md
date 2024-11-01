# Employee-attendance-analysis-project

Project Overview
=================
The Employee Analysis Project is designed to manage and analyze employee data, providing insights into employee performance, salary distribution, departmental structure, and more. The goal of the project is to assist HR managers and company leadership in making data-driven decisions about their workforce. The project is built using SQL and PL/SQL for database management and analytics.

Features and Functionality
===============================
The Employee Analysis Project includes the following key features:

1.Employee Data Management: Store and retrieve employee information such as name, department, salary, and hire date.
2.Departmental Analysis: Perform analysis on employee distribution across departments.
3.Salary Analysis: Evaluate salary distribution, identify salary ranges, and calculate average salaries.
4.Performance Tracking: Track employee performance using KPIs such as work experience, promotion history, and performance ratings.
5.Custom Queries and Reports: Generate reports on employee performance, salary expenses per department, and other metrics

Database Schema
===================
The project relies on the following tables:
1. employees Table: 
The employees table stores key employee information.

employee_id: Unique identifier for each employee.
first_name: First name of the employee.
last_name: Last name of the employee.
email: Contact email of the employee.
hire_date: The date when the employee was hired.
job_title: The employee's job title.
salary: The employee's monthly salary.
department_id: Foreign key referencing the department the employee belongs to.
performance_rating: A numerical rating reflecting the employee’s performance.

2. departments Table: 
This table stores department-related information.

department_id: Unique identifier for each department.
department_name: The name of the department.
manager_id: Foreign key referencing the manager of the department.

3. salaries Table: 
Stores historical salary data for employees, useful for tracking promotions or salary changes over time.

salary_id: Unique identifier for each salary record.
employee_id: Foreign key referencing the employee.
salary: The salary at the time of the record.
effective_date: The date when the salary became effective.

4. performance_reviews Table: 
This table holds performance review data for employees.

review_id: Unique identifier for each review.
employee_id: Foreign key referencing the employee.
review_date: The date the review was conducted.
review_score: The score the employee received during the review.

PL/SQL Procedures and Functions
===================================
1. calculate_average_salary Function
This function calculates the average salary for a specific department.

2. update_employee_salary Procedure
This procedure updates an employee’s salary and stores the old salary in the salaries table.

3. get_top_performers Procedure
This procedure retrieves the top N performers from the company based on performance ratings.

Sample Data and Usage
========================
To test the system, you can insert sample data into the tables and use the provided procedures and functions for analysis.

Calling the Function and Procedure
=======================================
1.Calculate Average Salary for a Department
2. Update Employee Salary
3. Get Top Performers
