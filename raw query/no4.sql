SELECT 
    emp.id AS employee_id,
    emp.nik,
    emp.name,
    emp.is_active,
    prof.gender,
    DATE_PART('year', AGE(NOW(), prof.date_of_birth)) AS age,
    edu.name AS school_name,
    edu.level,
    fam.name AS family_data
FROM 
    employee AS emp
JOIN 
    employee_profile AS prof ON emp.id = prof.employee_id
JOIN 
    education AS edu ON emp.id = edu.employee_id
JOIN 
    employee_family AS fam ON emp.id = fam.employee_id;
