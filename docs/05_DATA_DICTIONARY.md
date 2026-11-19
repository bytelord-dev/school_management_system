# 05 — DATA DICTIONARY

## 1. Introduction

This document presents the data dictionary for the IAI University Management Database.

A data dictionary is a detailed description of the data stored in a database. It defines the tables, attributes, data types, keys, constraints, and purposes of the different database elements.

Its main purpose is to provide a common reference for database designers, developers, testers, and other project members.

The database consists of twelve entities and will be implemented using MariaDB.

## 2. Naming and Data Type Conventions

The following conventions will guide the database implementation:

- Table names will use uppercase letters.
- Attribute names will use lowercase letters, except where the existing approved model specifies otherwise.
- Primary keys will uniquely identify records.
- Foreign keys will establish relationships between tables.
- Appropriate data types will be selected according to the nature of the stored information.
- InnoDB will be used as the storage engine to support foreign key constraints and transactions.

**Note:** The data types and lengths below are proposed implementation choices. They should be reviewed by the group before the final SQL implementation.

## 3. Data Dictionary

### 3.1 STUDENT

**Purpose:** Stores personal and identification information about students.

| Attribute | Proposed Data Type | Key | Constraints | Description |
|---|---|---|---|---|
| std_id | INT | PK | AUTO_INCREMENT, NOT NULL | Unique student identifier |
| matricule | VARCHAR(30) | | UNIQUE, NOT NULL | Student matriculation number |
| first_name | VARCHAR(100) | | NOT NULL | Student's first name |
| last_name | VARCHAR(100) | | NOT NULL | Student's last name |
| DOB | DATE | | NOT NULL | Student's date of birth |
| gender | VARCHAR(20) | | NOT NULL | Student's gender |
| email | VARCHAR(150) | | | Student's email address |
| phone | VARCHAR(30) | | | Student's phone number |
| address | VARCHAR(255) | | | Student's residential address |
| student_status | VARCHAR(30) | | NOT NULL | Current student status |

### 3.2 LECTURER

**Purpose:** Stores information about lecturers employed by the institution.

| Attribute | Proposed Data Type | Key | Constraints | Description |
|---|---|---|---|---|
| lecturer_id | INT | PK | AUTO_INCREMENT, NOT NULL | Unique lecturer identifier |
| first_name | VARCHAR(100) | | NOT NULL | Lecturer's first name |
| email | VARCHAR(150) | | | Lecturer's email address |
| phone | VARCHAR(30) | | | Lecturer's phone number |
| hire_date | DATE | | NOT NULL | Date the lecturer was employed |
| lecturer_status | VARCHAR(30) | | NOT NULL | Current lecturer status |

### 3.3 TEACHING_ASSIGNMENT

**Purpose:** Records the assignment of lecturers to teach specific courses in particular classes and semesters.

| Attribute | Proposed Data Type | Key | Constraints | Description |
|---|---|---|---|---|
| assignment_id | INT | PK | AUTO_INCREMENT, NOT NULL | Unique assignment identifier |
| lecturer_id | INT | FK | NOT NULL | Assigned lecturer |
| course_id | INT | FK | NOT NULL | Course being taught |
| class_id | INT | FK | NOT NULL | Class receiving the course |
| semester_id | INT | FK | NOT NULL | Semester of the assignment |
| start_date | DATE | | NOT NULL | Assignment starting date |
| end_date | DATE | | NULL permitted subject to approval | Assignment ending date |
| assignment_status | VARCHAR(30) | | NOT NULL | Current assignment status |

### 3.4 PROGRAM

**Purpose:** Stores the academic programmes offered by the institution.

| Attribute | Proposed Data Type | Key | Constraints | Description |
|---|---|---|---|---|
| program_id | INT | PK | AUTO_INCREMENT, NOT NULL | Unique programme identifier |
| program_code | VARCHAR(20) | | UNIQUE, NOT NULL | Programme code |
| program_name | VARCHAR(100) | | NOT NULL | Programme name |

### 3.5 MODULE

**Purpose:** Stores academic modules and their credit values.

| Attribute | Proposed Data Type | Key | Constraints | Description |
|---|---|---|---|---|
| module_id | INT | PK | AUTO_INCREMENT, NOT NULL | Unique module identifier |
| module_name | VARCHAR(150) | | NOT NULL | Module name |
| credit_value | INT | | NOT NULL | Number of credits assigned to the module |

### 3.6 COURSE

**Purpose:** Stores courses belonging to academic modules.

| Attribute | Proposed Data Type | Key | Constraints | Description |
|---|---|---|---|---|
| course_id | INT | PK | AUTO_INCREMENT, NOT NULL | Unique course identifier |
| course_name | VARCHAR(150) | | NOT NULL | Course name |
| module_id | INT | FK | NOT NULL | Module to which the course belongs |

### 3.7 PROGRAM_MODULE

**Purpose:** Associates programmes with their modules and specifies the academic level and curriculum semester in which each module is taught.

| Attribute | Proposed Data Type | Key | Constraints | Description |
|---|---|---|---|---|
| program_module_id | INT | PK | AUTO_INCREMENT, NOT NULL | Unique programme-module record |
| program_id | INT | FK | NOT NULL | Associated programme |
| module_id | INT | FK | NOT NULL | Associated module |
| level_id | INT | FK | NOT NULL | Academic level |
| semester_number | TINYINT | | NOT NULL | Curriculum semester number |

### 3.8 LEVEL

**Purpose:** Stores the academic levels used by the institution.

| Attribute | Proposed Data Type | Key | Constraints | Description |
|---|---|---|---|---|
| level_id | INT | PK | AUTO_INCREMENT, NOT NULL | Unique level identifier |
| level_name | VARCHAR(50) | | NOT NULL | Level name |
| level_number | TINYINT | | NOT NULL | Numeric level representation |

### 3.9 CLASS

**Purpose:** Stores the different classes organized under academic programmes and levels.

| Attribute | Proposed Data Type | Key | Constraints | Description |
|---|---|---|---|---|
| class_id | INT | PK | AUTO_INCREMENT, NOT NULL | Unique class identifier |
| class_name | VARCHAR(50) | | NOT NULL | Class name |
| level_id | INT | FK | NOT NULL | Level associated with the class |
| program_id | INT | FK | NOT NULL | Programme associated with the class |

### 3.10 ENROLLMENT

**Purpose:** Records a student's allocation to a class during a particular academic year.

| Attribute | Proposed Data Type | Key | Constraints | Description |
|---|---|---|---|---|
| enrollment_id | INT | PK | AUTO_INCREMENT, NOT NULL | Unique enrollment identifier |
| student_id | INT | FK | NOT NULL | Enrolled student |
| class_id | INT | FK | NOT NULL | Assigned class |
| academic_year_id | INT | FK | NOT NULL | Academic year of enrollment |
| enrollment_date | DATE | | NOT NULL | Date of enrollment |
| status | VARCHAR(30) | | NOT NULL | Enrollment status |

### 3.11 ACADEMIC_YEAR

**Purpose:** Stores the academic years organized by the institution.

| Attribute | Proposed Data Type | Key | Constraints | Description |
|---|---|---|---|---|
| academic_year_id | INT | PK | AUTO_INCREMENT, NOT NULL | Unique academic year identifier |
| year_name | VARCHAR(20) | | UNIQUE, NOT NULL | Academic year name |
| start_date | DATE | | NOT NULL | Academic year starting date |
| end_date | DATE | | NOT NULL | Academic year ending date |
| year_status | VARCHAR(30) | | NOT NULL | Current academic year status |

### 3.12 SEMESTER

**Purpose:** Stores the semesters belonging to academic years.

| Attribute | Proposed Data Type | Key | Constraints | Description |
|---|---|---|---|---|
| semester_id | INT | PK | AUTO_INCREMENT, NOT NULL | Unique semester identifier |
| academic_year_id | INT | FK | NOT NULL | Academic year to which the semester belongs |
| semester_number | TINYINT | | NOT NULL | Semester number |
| start_date | DATE | | NOT NULL | Semester starting date |
| end_date | DATE | | NOT NULL | Semester ending date |
| semester_status | VARCHAR(30) | | NOT NULL | Current semester status |

## 4. Foreign Key Reference

The following table summarizes the foreign key relationships.

| Child Table | Foreign Key | Referenced Table | Referenced Attribute |
|---|---|---|---|
| COURSE | module_id | MODULE | module_id |
| PROGRAM_MODULE | program_id | PROGRAM | program_id |
| PROGRAM_MODULE | module_id | MODULE | module_id |
| PROGRAM_MODULE | level_id | LEVEL | level_id |
| CLASS | program_id | PROGRAM | program_id |
| CLASS | level_id | LEVEL | level_id |
| ENROLLMENT | student_id | STUDENT | std_id |
| ENROLLMENT | class_id | CLASS | class_id |
| ENROLLMENT | academic_year_id | ACADEMIC_YEAR | academic_year_id |
| SEMESTER | academic_year_id | ACADEMIC_YEAR | academic_year_id |
| TEACHING_ASSIGNMENT | lecturer_id | LECTURER | lecturer_id |
| TEACHING_ASSIGNMENT | course_id | COURSE | course_id |
| TEACHING_ASSIGNMENT | class_id | CLASS | class_id |
| TEACHING_ASSIGNMENT | semester_id | SEMESTER | semester_id |

## 5. Important Unique Constraints

The following unique constraints are proposed to prevent duplicate records:

| Table | Unique Constraint | Purpose |
|---|---|---|
| STUDENT | matricule | Prevents duplicate student matriculation numbers |
| PROGRAM | program_code | Prevents duplicate programme codes |
| PROGRAM_MODULE | program_id, module_id | Prevents the same module from appearing more than once in a programme |
| ENROLLMENT | student_id, academic_year_id | Prevents a student from having multiple enrollment records in the same academic year |
| SEMESTER | academic_year_id, semester_number | Prevents duplicate semester numbers within the same academic year |
| CLASS | class_name, program_id, level_id | Prevents duplicate class names within the same programme and level |

These constraints must be confirmed against the institution's business rules before implementation.

## 6. General Data Integrity Rules

1. Every table must have a primary key.
2. Foreign keys must reference existing records.
3. Required attributes must not accept NULL values.
4. Unique attributes must not contain duplicate values.
5. Date values must be logically valid.
6. Academic year and semester dates must be consistent.
7. A student must not have more than one enrollment in the same academic year.
8. A module must not appear more than once in the same programme's curriculum.
9. A class must be associated with a valid programme and level.
10. Teaching assignments must reference valid lecturers, courses, classes, and semesters.

## 7. Conclusion

The data dictionary provides a detailed reference for the structure and meaning of the data stored in the IAI University Management Database.

It will guide the creation of database tables, selection of data types, implementation of constraints, and development of SQL operations.

All proposed data types and constraints must be reviewed and approved by the group before final implementation.

---

**Document status:** Initial data dictionary  
**Database management system:** MariaDB  
**Number of entities:** 12
