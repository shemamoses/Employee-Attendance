This PL/SQL procedure helps a company analyze employee attendance for a specific month and year. It counts the number of days each employee was present or absent and calculates their attendance percentage.

Features
Counts total days Present and Absent for each employee.
Calculates Attendance Percentage for the specified month.
Shows employee Full Name, Total Presents, Total Absents, and Attendance Percentage.
If an employee has no attendance records for the month, it displays a message saying so.
How It Works
Input:

p_month: The month you want to analyze (e.g., 9 for September).
p_year: The year you want to analyze (e.g., 2024).
Logic:

The procedure loops through each employee and checks their attendance records for the given month.
For each employee, it counts the days they were Present and Absent.

Error Handling
If there are no employees in the database, it shows a "No employees found" message.
If any unexpected errors occur, it displays an error message.
Requirements
Database: Oracle with tables Employees and Attendance.
PL/SQL Knowledge: Basic understanding of PL/SQL for copying and running the procedure.
