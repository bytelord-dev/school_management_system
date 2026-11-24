SOURCE database/00_create_database.sql;

USE iai_university_db;

SOURCE database/01_tables/01_create_student.sql;
SOURCE database/01_tables/02_create_lecturer.sql;
SOURCE database/01_tables/04_create_program.sql;
SOURCE database/01_tables/08_create_level.sql;
SOURCE database/01_tables/05_create_module.sql;
SOURCE database/01_tables/11_create_academic_year.sql;
SOURCE database/01_tables/06_create_course.sql;
SOURCE database/01_tables/07_create_program_module.sql;
SOURCE database/01_tables/09_create_class.sql;
SOURCE database/01_tables/12_create_semester.sql;
SOURCE database/01_tables/10_create_enrollment.sql;
SOURCE database/01_tables/03_create_teaching_assignment.sql;

SHOW TABLES;