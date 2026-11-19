# 03 — ENTITY RELATIONSHIP DOCUMENTATION

## 1. Introduction

This document presents the entity relationship structure of the IAI University Management Database.

It describes the entities involved, their attributes, primary keys, foreign keys, and the relationships that exist between them.

The database is designed to manage the academic activities included in the project's scope, particularly student registration, programme management, curriculum organization, class allocation, academic years, semesters, lecturers, and teaching assignments.

The database contains **12 entities**.

## 2. Database Entities

### 2.1 STUDENT

Stores personal and identification information about students.

| Attribute | Description | Key |
|---|---|---|
| std_id | Unique student identifier | PK |
| matricule | Student matriculation number | |
| first_name | Student's first name | |
| last_name | Student's last name | |
| DOB | Date of birth | |
| gender | Student's gender | |
| email | Student's email address | |
| phone | Student's phone number | |
| address | Student's residential address | |
| student_status | Current student status | |

### 2.2 LECTURER

Stores information about lecturers employed by the institution.

| Attribute | Description | Key |
|---|---|---|
| lecturer_id | Unique lecturer identifier | PK |
| first_name | Lecturer's first name | |
| email | Lecturer's email address | |
| phone | Lecturer's phone number | |
| hire_date | Date the lecturer was employed | |
| lecturer_status | Current lecturer status | |

### 2.3 TEACHING_ASSIGNMENT

Records the assignment of lecturers to teach specific courses in particular classes and semesters.

| Attribute | Description | Key |
|---|---|---|
| assignment_id | Unique assignment identifier | PK |
| lecturer_id | Assigned lecturer | FK |
| course_id | Course being taught | FK |
| class_id | Class receiving the course | FK |
| semester_id | Semester of the assignment | FK |
| start_date | Assignment starting date | |
| end_date | Assignment ending date | |
| assignment_status | Current assignment status | |

### 2.4 PROGRAM

Stores the academic programmes offered by the institution.

| Attribute | Description | Key |
|---|---|---|
| program_id | Unique programme identifier | PK |
| program_code | Programme code | |
| program_name | Programme name | |

### 2.5 MODULE

Stores academic modules and their credit values.

| Attribute | Description | Key |
|---|---|---|
| module_id | Unique module identifier | PK |
| module_name | Module name | |
| credit_value | Number of credits assigned to the module | |

### 2.6 COURSE

Stores courses belonging to academic modules.

| Attribute | Description | Key |
|---|---|---|
| course_id | Unique course identifier | PK |
| course_name | Course name | |
| module_id | Module to which the course belongs | FK |

### 2.7 PROGRAM_MODULE

Associates programmes with their modules and specifies the academic level and curriculum semester in which each module is taught.

| Attribute | Description | Key |
|---|---|---|
| program_module_id | Unique programme-module record | PK |
| program_id | Associated programme | FK |
| module_id | Associated module | FK |
| level_id | Academic level | FK |
| semester_number | Curriculum semester number | |

### 2.8 LEVEL

Stores the academic levels used by the institution.

| Attribute | Description | Key |
|---|---|---|
| level_id | Unique level identifier | PK |
| level_name | Level name | |
| level_number | Numeric level representation | |

### 2.9 CLASS

Stores the different classes organized under academic programmes and levels.

| Attribute | Description | Key |
|---|---|---|
| class_id | Unique class identifier | PK |
| class_name | Class name | |
| level_id | Level associated with the class | FK |
| program_id | Programme associated with the class | FK |

### 2.10 ENROLLMENT

Records a student's allocation to a class during a particular academic year.

| Attribute | Description | Key |
|---|---|---|
| enrollment_id | Unique enrollment identifier | PK |
| student_id | Enrolled student | FK |
| class_id | Assigned class | FK |
| academic_year_id | Academic year of enrollment | FK |
| enrollment_date | Date of enrollment | |
| status | Enrollment status | |

### 2.11 ACADEMIC_YEAR

Stores the academic years organized by the institution.

| Attribute | Description | Key |
|---|---|---|
| academic_year_id | Unique academic year identifier | PK |
| year_name | Academic year name | |
| start_date | Academic year starting date | |
| end_date | Academic year ending date | |
| year_status | Current academic year status | |

### 2.12 SEMESTER

Stores the semesters belonging to academic years.

| Attribute | Description | Key |
|---|---|---|
| semester_id | Unique semester identifier | PK |
| academic_year_id | Academic year to which the semester belongs | FK |
| semester_number | Semester number | |
| start_date | Semester starting date | |
| end_date | Semester ending date | |
| semester_status | Current semester status | |

## 3. Entity Relationships and Cardinalities

The following relationships describe how the entities interact.

| No. | Parent Entity | Child Entity | Cardinality | Explanation |
|---|---|---|---|---|
| 1 | PROGRAM | CLASS | 1:N | One programme can have several classes. Each class belongs to one programme. |
| 2 | LEVEL | CLASS | 1:N | One level can contain several classes. Each class belongs to one level. |
| 3 | PROGRAM | PROGRAM_MODULE | 1:N | One programme can have several curriculum module records. |
| 4 | MODULE | PROGRAM_MODULE | 1:N | One module can appear in several programmes. |
| 5 | LEVEL | PROGRAM_MODULE | 1:N | One level can be associated with several programme-module records. |
| 6 | MODULE | COURSE | 1:N | One module can contain several courses. Each course belongs to one module. |
| 7 | STUDENT | ENROLLMENT | 1:N | One student can have several enrollment records across academic years. |
| 8 | CLASS | ENROLLMENT | 1:N | One class can have several students enrolled in it. |
| 9 | ACADEMIC_YEAR | ENROLLMENT | 1:N | One academic year can contain several enrollment records. |
| 10 | ACADEMIC_YEAR | SEMESTER | 1:N | One academic year contains its semesters. |
| 11 | LECTURER | TEACHING_ASSIGNMENT | 1:N | One lecturer can have several teaching assignments. |
| 12 | COURSE | TEACHING_ASSIGNMENT | 1:N | One course can be assigned to different classes and lecturers. |
| 13 | CLASS | TEACHING_ASSIGNMENT | 1:N | One class can have several teaching assignments. |
| 14 | SEMESTER | TEACHING_ASSIGNMENT | 1:N | One semester can contain several teaching assignments. |

**Note:** The 1:N relationships are implemented using foreign keys in the child entities.

## 4. Important Relationship Explanations

### 4.1 STUDENT, CLASS and ENROLLMENT

STUDENT and CLASS have a many-to-many relationship over time.

- A student can be enrolled in different classes across different academic years.
- A class can contain many students.
- ENROLLMENT resolves this relationship.

For example, a student may be enrolled in BA1A during 2025/2026 and BA2 during 2026/2027.

Each enrollment record represents one student's class allocation for one academic year.

### 4.2 PROGRAM, MODULE and PROGRAM_MODULE

PROGRAM and MODULE have a many-to-many relationship.

- One programme can contain several modules.
- One module can be shared by several programmes.
- PROGRAM_MODULE resolves this relationship.

PROGRAM_MODULE also stores the academic level and curriculum semester number associated with the module.

### 4.3 MODULE and COURSE

The relationship is one-to-many.

A module may contain several courses, but each course belongs to one module.

Credit values are stored in MODULE because credits are attributed to modules, not individual courses.

### 4.4 STUDENT and COURSE

There is no direct relationship between STUDENT and COURSE in the current model.

A student's curriculum courses can be determined through the following path:

**STUDENT → ENROLLMENT → CLASS → PROGRAM_MODULE → MODULE → COURSE**

The student's programme and level are obtained from the CLASS record.

### 4.5 LECTURER, COURSE, CLASS and SEMESTER

TEACHING_ASSIGNMENT records which lecturer teaches which course to which class during a particular semester.

Each teaching assignment refers to:

- One lecturer.
- One course.
- One class.
- One semester.

This structure allows the same course to be taught to different classes, potentially by different lecturers.

## 5. Referential Integrity

The following foreign key relationships must be implemented:

| Entity | Foreign Key | References |
|---|---|---|
| COURSE | module_id | MODULE(module_id) |
| PROGRAM_MODULE | program_id | PROGRAM(program_id) |
| PROGRAM_MODULE | module_id | MODULE(module_id) |
| PROGRAM_MODULE | level_id | LEVEL(level_id) |
| CLASS | program_id | PROGRAM(program_id) |
| CLASS | level_id | LEVEL(level_id) |
| ENROLLMENT | student_id | STUDENT(std_id) |
| ENROLLMENT | class_id | CLASS(class_id) |
| ENROLLMENT | academic_year_id | ACADEMIC_YEAR(academic_year_id) |
| SEMESTER | academic_year_id | ACADEMIC_YEAR(academic_year_id) |
| TEACHING_ASSIGNMENT | lecturer_id | LECTURER(lecturer_id) |
| TEACHING_ASSIGNMENT | course_id | COURSE(course_id) |
| TEACHING_ASSIGNMENT | class_id | CLASS(class_id) |
| TEACHING_ASSIGNMENT | semester_id | SEMESTER(semester_id) |

## 6. Additional Integrity Considerations

The following rules must be considered during relational schema implementation:

1. A student's matricule must be unique.
2. A student must not have more than one enrollment in the same academic year.
3. A semester number must not be duplicated within the same academic year.
4. A module must not appear more than once in the same programme's curriculum.
5. A class must belong to one programme and one academic level.
6. A course must belong to one module.
7. A teaching assignment must reference valid lecturer, course, class and semester records.
8. The programme and level associated with a class must correspond to the programme and level of its curriculum records.

Some rules require more than ordinary foreign keys. In particular, consistency between the programme and level of CLASS and PROGRAM_MODULE must be enforced through suitable composite constraints or additional database validation.

## 7. Conclusion

This document establishes the entity structure and relationships of the IAI University Management Database.

It identifies the twelve entities, their attributes, and the relationships required to support the academic activities included in the project.

The next stage is to transform this conceptual model into a relational schema, identifying primary keys, foreign keys, unique constraints, and other integrity rules before implementing the database in MariaDB.

---

**Document status:** Initial database design documentation  
**Database management system:** MariaDB  
**Number of entities:** 12
