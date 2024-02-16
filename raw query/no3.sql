INSERT INTO employee (nik, name, is_active, start_date, end_date, created_by, updated_by, created_at, updated_at)
VALUES ('1234567890', 'John Doe', true, '2024-01-01', '2024-12-31', 'admin', 'admin', NOW(), NOW()),
       ('0987654321', 'Jane Smith', true, '2024-01-15', '2024-12-31', 'admin', 'admin', NOW(), NOW());

INSERT INTO employee_profile (employee_id, place_of_birth, date_of_birth, gender, is_married, prof_pict, created_by, updated_by, created_at, updated_at)
VALUES (1, 'Jakarta', '1990-05-15', 'Laki Laki', true, 'profile1.jpg', 'admin', 'admin', NOW(), NOW()),
       (2, 'Bandung', '1992-07-20', 'Perempuan', false, 'profile2.jpg', 'admin', 'admin', NOW(), NOW());

INSERT INTO employee_family (employee_id, name, identifier, job, place_of_birth, date_of_birth, religion, is_life, is_divorced, relation_status, created_by, updated_by, created_at, updated_at)
VALUES (1, 'Mary Doe', '1234567890123456', 'Teacher', 'Jakarta', '1995-03-10', 'islam', true, false, 'suami', 'admin', 'admin', NOW(), NOW()),
       (1, 'Peter Doe', '1234567890123457', 'Engineer', 'Jakarta', '1998-11-25', 'islam', true, false, 'anak sambung', 'admin', 'admin', NOW(), NOW()),
       (2, 'Michael Smith', '9876543210987654', 'Doctor', 'Bandung', '1994-09-05', 'katolik', true, false, 'suami', 'admin', 'admin', NOW(), NOW());

INSERT INTO education (employee_id, name, level, description, created_by, updated_by, created_at, updated_at)
VALUES (1, 'Elementary School', 'SD', 'Graduated', 'admin', 'admin', NOW(), NOW()),
       (1, 'High School', 'SMA', 'Graduated', 'admin', 'admin', NOW(), NOW()),
       (2, 'Elementary School', 'SD', 'Graduated', 'admin', 'admin', NOW(), NOW())