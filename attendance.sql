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

BEGIN
    -- Loop through each employee using emp_cursor
    FOR emp_rec IN emp_cursor LOOP
        -- Initialize counters
        v_total_presents := 0;
        v_total_absents := 0;
        v_attendance_days := 0;

        -- Assign employee details
        v_employee_id := emp_rec.employee_id;
        v_first_name := emp_rec.first_name;
        v_last_name := emp_rec.last_name;

        -- Process attendance records for the employee in the specified month and year
        FOR att_rec IN attendance_cursor(v_employee_id) LOOP
            IF att_rec.status = 'Present' THEN
                v_total_presents := v_total_presents + 1;
            ELSIF att_rec.status = 'Absent' THEN
                v_total_absents := v_total_absents + 1;
            END IF;
            v_attendance_days := v_attendance_days + 1;
        END LOOP;

        -- Calculate attendance percentage
        IF v_attendance_days > 0 THEN
            v_attendance_percentage := (v_total_presents / v_attendance_days) * 100;
            DBMS_OUTPUT.PUT_LINE('Employee: ' || v_first_name || ' ' || v_last_name);
            DBMS_OUTPUT.PUT_LINE('Total Presents: ' || v_total_presents);
            DBMS_OUTPUT.PUT_LINE('Total Absents: ' || v_total_absents);
            DBMS_OUTPUT.PUT_LINE('Attendance Percentage: ' || ROUND(v_attendance_percentage, 2) || '%');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Employee: ' || v_first_name || ' ' || v_last_name || ' has no attendance records for the specified month.');
        END IF;

        -- Print a separator for readability
        DBMS_OUTPUT.PUT_LINE('-------------------------------------');
    END LOOP;