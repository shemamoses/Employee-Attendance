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