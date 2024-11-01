CREATE OR REPLACE PROCEDURE Calculate_Attendance_Statistics (
    p_month IN NUMBER,
    p_year IN NUMBER
) IS
    -- Variables to hold employee details
    v_employee_id     NUMBER;
    v_first_name      VARCHAR2(50);
    v_last_name       VARCHAR2(50);
    
    -- declare Variables to count attendance
    v_total_presents  NUMBER;
    v_total_absents   NUMBER;
    v_attendance_days NUMBER;
    v_attendance_percentage NUMBER;

-- Cursor to retrieve all employees
    CURSOR emp_cursor IS
        SELECT employee_id, first_name, last_name FROM Employees;
    
    -- Cursor for attendance records for an employee in the specified month and year
    CURSOR attendance_cursor (emp_id NUMBER) IS
        SELECT status
        FROM Attendance
        WHERE employee_id = emp_id
          AND EXTRACT(MONTH FROM attendance_date) = p_month
          AND EXTRACT(YEAR FROM attendance_date) = p_year;