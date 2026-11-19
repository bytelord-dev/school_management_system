# REQUIREMENTS SPECIFICATION
## University Management Database System
### Case Study: Institut Africain d'Informatique (IAI), Cameroon

| Document information | Details |
|---|---|
| Project name | University Management Database System |
| Case study | Institut Africain d'Informatique (IAI), Cameroon |
| Document title | Requirements Specification |
| Document number | 02 |
| Database Management System | MariaDB |
| Version | 1.0 — Initial Draft |
| Project type | Relational Database Design and Implementation |
| Team size | 4 members |
| Status | Draft for team validation |

---

# 1. INTRODUCTION

## 1.1 Purpose of this document

This document specifies the functional and non-functional requirements of the University Management Database System developed using the Institut Africain d'Informatique (IAI), Cameroon, as its case study.

It defines the services the database must provide, the information it must maintain, the constraints it must enforce, and the conditions under which the system will be considered acceptable.

This document serves as a reference for database design, implementation, testing, and validation.

## 1.2 Project overview

The project aims to design and implement a relational database that supports selected academic management activities at IAI.

The database will organize information concerning students, lecturers, academic programmes, academic levels, classes, modules, courses, academic years, semesters, student enrollment, programme curricula, and teaching assignments.

MariaDB has been selected as the target Database Management System (DBMS).

The implementation will use SQL to define database structures, manipulate data, retrieve information, enforce access permissions, and manage transactions.

## 1.3 Intended audience

This document is intended for:

- The four members of the project group.
- The project supervisor or lecturer.
- Individuals responsible for database design and implementation.
- Individuals responsible for testing and evaluating the database.

## 1.4 Definitions and abbreviations

| Term | Definition |
|---|---|
| DBMS | Database Management System |
| RDBMS | Relational Database Management System |
| SQL | Structured Query Language |
| PK | Primary Key |
| FK | Foreign Key |
| ERD | Entity-Relationship Diagram |
| DDL | Data Definition Language |
| DML | Data Manipulation Language |
| DQL | Data Query Language |
| DCL | Data Control Language |
| TCL | Transaction Control Language |
| CRUD | Create, Read, Update, Delete |
| Academic year | A defined academic period containing semesters |
| Curriculum | The organization of modules within an academic programme |

---

# 2. PROJECT SCOPE

## 2.1 Scope of the system

The system will provide a structured database for managing the selected academic information and relationships within the institution.

The implementation will cover:

1. Student information management.
2. Lecturer information management.
3. Academic programme management.
4. Academic level management.
5. Class management.
6. Module management.
7. Course management.
8. Programme curriculum management.
9. Academic year management.
10. Semester management.
11. Student enrollment and class allocation.
12. Lecturer teaching assignment management.

## 2.2 Out of scope

The following functionalities are excluded from the current project:

- Examination results and grade management.
- Tuition fees and financial accounting.
- Student attendance management.
- Library management.
- Hostel and accommodation management.
- Payroll and lecturer salary management.
- Online admission portals.
- Student and lecturer self-service applications.

The project focuses on the database layer. It does not require the development of a complete web or desktop application.

## 2.3 Project limitations

The database will represent only the academic processes and business rules established within the approved project scope.

Processes that require additional entities or information not included in the agreed model will not be implemented unless the group formally reviews and approves a change to the scope.

---

# 3. GENERAL SYSTEM DESCRIPTION

## 3.1 Product perspective

The proposed system is a relational database designed to organize and maintain academic information.

It will serve as a central data repository connecting the different academic entities.

The database will allow authorized database users to insert, modify, delete, and retrieve information according to their assigned privileges.

## 3.2 Target DBMS

The project will be implemented using MariaDB.

All final SQL scripts, database objects, constraints, stored routines, triggers, views, and test cases must be compatible with the agreed MariaDB version.

Group members who use MySQL for practice must validate their final SQL scripts against the project's MariaDB environment before those scripts are accepted.

## 3.3 General operating assumptions

The following assumptions apply to the current project:

1. The institution's academic structure is represented using the twelve agreed entities.
2. Each academic year contains two semesters in the current model.
3. Each student has a unique matricule.
4. Each class belongs to one programme and one academic level.
5. Each module may be included in different programmes.
6. Each module belongs to one or more programme curricula through PROGRAM_MODULE.
7. Each course belongs to one module.
8. A student may have enrollment records across different academic years.
9. A student may have only one enrollment record per academic year under the agreed model.
10. Each teaching assignment concerns one lecturer, one course, one class, and one actual semester.

---

# 4. FUNCTIONAL REQUIREMENTS

Functional requirements describe the operations and services the database must support.

Each requirement has a unique identifier to facilitate implementation and testing.

## 4.1 Student management requirements

| ID | Requirement |
|---|---|
| FR-STU-01 | The database shall allow the creation of student records. |
| FR-STU-02 | The database shall store each student's matricule and personal information. |
| FR-STU-03 | The database shall ensure that each student has a unique student identifier. |
| FR-STU-04 | The database shall ensure that matricules are unique. |
| FR-STU-05 | The database shall allow authorized users to retrieve student information. |
| FR-STU-06 | The database shall allow authorized users to update student information. |
| FR-STU-07 | The database shall maintain the student's identity independently of changes in class allocation. |
| FR-STU-08 | The database shall maintain a student status. |

## 4.2 Lecturer management requirements

| ID | Requirement |
|---|---|
| FR-LEC-01 | The database shall allow the creation of lecturer records. |
| FR-LEC-02 | The database shall store lecturer names and contact information. |
| FR-LEC-03 | The database shall store the lecturer's hire date and status. |
| FR-LEC-04 | The database shall allow authorized users to retrieve lecturer information. |
| FR-LEC-05 | The database shall allow authorized users to update lecturer information. |
| FR-LEC-06 | The database shall maintain the relationship between lecturers and their teaching assignments. |

## 4.3 Programme management requirements

| ID | Requirement |
|---|---|
| FR-PRO-01 | The database shall allow the creation of academic programmes. |
| FR-PRO-02 | The database shall store the programme code and programme name. |
| FR-PRO-03 | The database shall ensure that programme codes are unique. |
| FR-PRO-04 | The database shall allow authorized users to retrieve programme information. |
| FR-PRO-05 | The database shall maintain the relationship between programmes and their classes. |

## 4.4 Academic level management requirements

| ID | Requirement |
|---|---|
| FR-LVL-01 | The database shall allow the creation of academic levels. |
| FR-LVL-02 | The database shall store the level name and level number. |
| FR-LVL-03 | The database shall allow academic levels to be associated with classes. |
| FR-LVL-04 | The database shall allow academic levels to be associated with programme curriculum records. |

## 4.5 Class management requirements

| ID | Requirement |
|---|---|
| FR-CLS-01 | The database shall allow the creation of classes. |
| FR-CLS-02 | The database shall associate every class with one programme. |
| FR-CLS-03 | The database shall associate every class with one academic level. |
| FR-CLS-04 | The database shall distinguish classes using unique class identifiers. |
| FR-CLS-05 | The database shall allow the retrieval of classes belonging to a particular programme or level. |
| FR-CLS-06 | The database shall support class names that may be reused across different programmes. |

## 4.6 Module management requirements

| ID | Requirement |
|---|---|
| FR-MOD-01 | The database shall allow the creation of modules. |
| FR-MOD-02 | The database shall store module names and credit values. |
| FR-MOD-03 | The database shall allow modules to be associated with different programmes. |
| FR-MOD-04 | The database shall allow authorized users to retrieve module information. |
| FR-MOD-05 | The database shall maintain the relationship between modules and courses. |

## 4.7 Course management requirements

| ID | Requirement |
|---|---|
| FR-COU-01 | The database shall allow the creation of courses. |
| FR-COU-02 | The database shall store course names. |
| FR-COU-03 | Every course shall belong to one module. |
| FR-COU-04 | The database shall allow authorized users to retrieve courses belonging to a particular module. |
| FR-COU-05 | The database shall prevent a course from referencing a nonexistent module. |

## 4.8 Programme curriculum management requirements

| ID | Requirement |
|---|---|
| FR-CUR-01 | The database shall allow modules to be associated with academic programmes. |
| FR-CUR-02 | The database shall record the academic level at which each module is positioned within a programme. |
| FR-CUR-03 | The database shall record the curriculum semester number for each programme-module association. |
| FR-CUR-04 | The database shall allow the retrieval of modules belonging to a particular programme and level. |
| FR-CUR-05 | The database shall prevent the same module from being assigned multiple curriculum positions within the same programme under the agreed business rule. |

## 4.9 Academic year management requirements

| ID | Requirement |
|---|---|
| FR-AY-01 | The database shall allow the creation of academic years. |
| FR-AY-02 | The database shall store the academic year name, start date, end date, and status. |
| FR-AY-03 | The database shall allow authorized users to retrieve academic year information. |
| FR-AY-04 | The database shall maintain the relationship between academic years and semesters. |
| FR-AY-05 | The database shall associate student enrollment records with academic years. |

## 4.10 Semester management requirements

| ID | Requirement |
|---|---|
| FR-SEM-01 | The database shall allow the creation of semesters. |
| FR-SEM-02 | Every semester shall belong to one academic year. |
| FR-SEM-03 | The database shall store the semester number, start date, end date, and status. |
| FR-SEM-04 | The database shall ensure that semester numbers are unique within the same academic year. |
| FR-SEM-05 | The database shall allow teaching assignments to reference actual semesters. |

## 4.11 Student enrollment requirements

| ID | Requirement |
|---|---|
| FR-ENR-01 | The database shall allow students to be enrolled in classes. |
| FR-ENR-02 | Each enrollment shall reference one student. |
| FR-ENR-03 | Each enrollment shall reference one class. |
| FR-ENR-04 | Each enrollment shall reference one academic year. |
| FR-ENR-05 | The database shall store the enrollment date and enrollment status. |
| FR-ENR-06 | The database shall maintain enrollment history across different academic years. |
| FR-ENR-07 | The database shall prevent a student from having more than one enrollment record in the same academic year. |
| FR-ENR-08 | The database shall allow the retrieval of a student's class history. |
| FR-ENR-09 | The database shall allow the retrieval of students enrolled in a particular class during a particular academic year. |

## 4.12 Teaching assignment requirements

| ID | Requirement |
|---|---|
| FR-TA-01 | The database shall allow teaching assignments to be created. |
| FR-TA-02 | Every teaching assignment shall reference one lecturer. |
| FR-TA-03 | Every teaching assignment shall reference one course. |
| FR-TA-04 | Every teaching assignment shall reference one class. |
| FR-TA-05 | Every teaching assignment shall reference one semester. |
| FR-TA-06 | The database shall store the assignment start date, end date, and status. |
| FR-TA-07 | The database shall allow the retrieval of courses assigned to a lecturer. |
| FR-TA-08 | The database shall allow the retrieval of lecturers assigned to a particular class and course. |
| FR-TA-09 | The database shall preserve previous teaching assignments when a lecturer is replaced. |
| FR-TA-10 | The database shall support different lecturers teaching the same course to different classes. |

## 4.13 Database query and reporting requirements

| ID | Requirement |
|---|---|
| FR-REP-01 | The database shall support queries that retrieve students and their classes. |
| FR-REP-02 | The database shall support queries that retrieve programmes and their associated modules. |
| FR-REP-03 | The database shall support queries that retrieve courses belonging to modules. |
| FR-REP-04 | The database shall support queries that retrieve lecturers and their teaching assignments. |
| FR-REP-05 | The database shall support queries that retrieve enrollment information by academic year. |
| FR-REP-06 | The database shall support aggregate queries such as counting students in classes. |
| FR-REP-07 | The database shall support joins and subqueries across related academic entities. |
| FR-REP-08 | The database shall support views for frequently required information. |

---

# 5. BUSINESS RULES AND DATA INTEGRITY REQUIREMENTS

The database must enforce the following agreed business rules.

| ID | Rule |
|---|---|
| BR-01 | Every student has a unique student identifier. |
| BR-02 | Every student has a unique matricule. |
| BR-03 | Every programme has a unique programme code. |
| BR-04 | Every class belongs to one programme and one level. |
| BR-05 | A class is uniquely identified independently of its name. |
| BR-06 | Every course belongs to one module. |
| BR-07 | A module may be shared by different programmes. |
| BR-08 | A programme may contain multiple modules through PROGRAM_MODULE. |
| BR-09 | A module must not appear more than once in the same programme's curriculum. |
| BR-10 | PROGRAM_MODULE records the programme, module, level, and curriculum semester number. |
| BR-11 | Each student may have multiple enrollment records across academic years. |
| BR-12 | A student may have at most one enrollment record per academic year. |
| BR-13 | Each enrollment references one student, one class, and one academic year. |
| BR-14 | Each academic year contains two semesters in the current model. |
| BR-15 | A semester belongs to one academic year. |
| BR-16 | Semester numbers must be unique within an academic year. |
| BR-17 | Each teaching assignment references one lecturer, one course, one class, and one semester. |
| BR-18 | Previous teaching assignments must be retained when lecturers are replaced. |
| BR-19 | The programme of an enrolled student is determined through the student's enrolled class. |

## 5.1 Integrity constraints

The implementation shall use appropriate database constraints to enforce data integrity.

These include:

- Primary key constraints.
- Foreign key constraints.
- NOT NULL constraints.
- UNIQUE constraints.
- CHECK constraints where supported and appropriate.
- Referential actions such as RESTRICT, CASCADE, or SET NULL where justified by the business rules.

The database must also enforce consistency between a class's programme and level and the programme-level curriculum used to retrieve its modules.

This consistency must be addressed during relational schema design, not assumed to be guaranteed by unrelated foreign keys.

---

# 6. NON-FUNCTIONAL REQUIREMENTS

Non-functional requirements describe the quality attributes and operational expectations of the database.

## 6.1 Data integrity

**NFR-INT-01:** The database shall maintain accurate and consistent relationships between related records.

**NFR-INT-02:** The database shall prevent the insertion of records that reference nonexistent parent records.

**NFR-INT-03:** The database shall prevent duplicate records where uniqueness is required by the business rules.

## 6.2 Reliability

**NFR-REL-01:** The database shall use a transactional storage engine such as InnoDB to support reliable transactions.

**NFR-REL-02:** The database shall support transaction control through COMMIT and ROLLBACK.

**NFR-REL-03:** Database operations involving multiple related changes should preserve consistency if an operation fails.

## 6.3 Security

**NFR-SEC-01:** Access to the database shall be controlled through database accounts and privileges.

**NFR-SEC-02:** Users shall receive only the permissions required for their assigned responsibilities.

**NFR-SEC-03:** Administrative operations shall be restricted to authorized database users.

**NFR-SEC-04:** Sensitive connection credentials shall not be stored in public project files or committed to the shared repository.

## 6.4 Maintainability

**NFR-MNT-01:** SQL scripts shall be organized into clearly named directories according to their purpose.

**NFR-MNT-02:** Database objects shall follow consistent naming conventions.

**NFR-MNT-03:** Changes to the database structure shall be documented.

**NFR-MNT-04:** The database shall be designed to allow future extensions without unnecessary restructuring.

## 6.5 Portability and compatibility

**NFR-PRT-01:** The final implementation shall be compatible with the agreed MariaDB version.

**NFR-PRT-02:** SQL scripts developed using another RDBMS shall be validated and adapted before integration.

**NFR-PRT-03:** The database shall be reproducible using the project's documented SQL installation scripts.

## 6.6 Performance

**NFR-PER-01:** The database shall use appropriate indexes to improve retrieval of frequently queried information.

**NFR-PER-02:** Queries shall be written to avoid unnecessary operations and excessive data retrieval.

**NFR-PER-03:** Primary and foreign key columns shall be appropriately indexed according to MariaDB requirements and query needs.

## 6.7 Backup and recovery

**NFR-BR-01:** The project shall provide a procedure for exporting and backing up the database.

**NFR-BR-02:** The project shall document how to restore the database from a valid backup.

**NFR-BR-03:** Backup and restoration procedures shall be tested before final delivery.

---

# 7. DATABASE IMPLEMENTATION REQUIREMENTS

## 7.1 Database language requirements

The project shall demonstrate practical use of the following SQL categories and database features.

| Category | Required concepts |
|---|---|
| DDL | CREATE, ALTER, DROP, TRUNCATE |
| DML | INSERT, UPDATE, DELETE |
| DQL | SELECT, WHERE, ORDER BY, GROUP BY, HAVING, DISTINCT |
| Joins | INNER JOIN, LEFT JOIN, RIGHT JOIN, multi-table joins |
| Subqueries | Scalar, multi-row, correlated, nested subqueries, EXISTS and NOT EXISTS |
| DCL | GRANT, REVOKE |
| TCL | COMMIT, ROLLBACK, SAVEPOINT |
| Views | CREATE VIEW, query views, update views where appropriate |
| Functions | User-defined stored functions |
| Procedures | Stored procedures with parameters |
| Triggers | BEFORE and AFTER triggers where justified |
| Constraints | PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK |
| Indexes | CREATE INDEX and index evaluation |

These features must be demonstrated through meaningful operations related to the academic database.

The inclusion of a feature in this list does not mean that every operation must be used in the production schema. Some concepts may be demonstrated in controlled test scripts.

## 7.2 Stored procedures and functions

Stored procedures and functions shall be implemented where they provide useful reusable database operations.

Possible examples include:

- Retrieving students enrolled in a particular class and academic year.
- Retrieving the modules assigned to a programme and level.
- Counting students enrolled in a class.
- Retrieving teaching assignments for a lecturer.

The final routines must be selected based on actual requirements and tested.

## 7.3 Triggers

Triggers may be used to enforce or automate appropriate database operations.

Possible applications include:

- Validating data before insertion or modification.
- Recording relevant changes where an appropriate audit structure exists.
- Enforcing business rules that cannot be adequately represented by ordinary constraints.

Triggers must not duplicate constraints unnecessarily or introduce hidden side effects.

## 7.4 Views

Views shall provide simplified access to frequently required combinations of related academic information.

Possible examples include:

- Student enrollment information.
- Programme curriculum information.
- Lecturer teaching assignment information.

---

# 8. DATA REQUIREMENTS

The database shall contain the following twelve entities.

| No. | Entity | Main purpose |
|---:|---|---|
| 1 | STUDENT | Stores student personal and identification information |
| 2 | LECTURER | Stores lecturer information |
| 3 | TEACHING_ASSIGNMENT | Records teaching arrangements |
| 4 | PROGRAM | Stores academic programmes |
| 5 | MODULE | Stores modules and credit values |
| 6 | COURSE | Stores courses belonging to modules |
| 7 | PROGRAM_MODULE | Defines programme curriculum placement |
| 8 | LEVEL | Stores academic levels |
| 9 | CLASS | Stores academic classes |
| 10 | ENROLLMENT | Records student class allocation by academic year |
| 11 | ACADEMIC_YEAR | Stores academic years |
| 12 | SEMESTER | Stores actual semesters within academic years |

The detailed attributes, data types, primary keys, foreign keys, and constraints for each entity shall be specified in the Relational Schema and Data Dictionary documents.

---

# 9. ACCEPTANCE CRITERIA

The database will be considered acceptable when the following conditions have been satisfied.

| ID | Acceptance criterion |
|---|---|
| AC-01 | All twelve agreed entities are implemented. |
| AC-02 | All approved relationships are represented correctly. |
| AC-03 | Primary keys and foreign keys are implemented. |
| AC-04 | Required uniqueness and integrity constraints are enforced. |
| AC-05 | The database supports student registration and enrollment records. |
| AC-06 | The database supports programme, class, level, module, and course management. |
| AC-07 | The database supports academic year and semester management. |
| AC-08 | The database supports lecturer teaching assignments. |
| AC-09 | Required SQL categories and database features are demonstrated. |
| AC-10 | Procedures, functions, triggers, and views are tested where implemented. |
| AC-11 | Positive and negative test cases are documented. |
| AC-12 | The complete database can be recreated using the documented installation scripts. |
| AC-13 | The final implementation runs successfully on the agreed MariaDB version. |
| AC-14 | Project documentation is complete and consistent with the implemented database. |

---

# 10. REQUIREMENTS TRACEABILITY

Requirements traceability ensures that each requirement is connected to its corresponding design, implementation, and test.

The project group shall maintain a traceability relationship between:

1. Requirement identifier.
2. Business rule or business case.
3. Database entity or relationship.
4. SQL implementation file.
5. Test case.
6. Test result.

A detailed traceability matrix may be maintained during implementation.

Example:

| Requirement | Database entity | Implementation | Test |
|---|---|---|---|
| FR-STU-01 | STUDENT | Student table script | Student insertion test |
| FR-ENR-07 | ENROLLMENT | Unique constraint | Duplicate enrollment test |
| FR-CUR-04 | PROGRAM_MODULE | Curriculum query | Programme curriculum retrieval test |
| FR-TA-09 | TEACHING_ASSIGNMENT | Assignment records | Lecturer replacement history test |

---

# 11. CONCLUSION

This Requirements Specification establishes the functional and non-functional requirements for the University Management Database System based on the selected academic activities of IAI, Cameroon.

It provides the foundation for the next stages of the project, including conceptual database design, relational schema development, MariaDB implementation, and database testing.

All implementation decisions shall remain consistent with the approved requirements and business rules. Any proposed changes shall be reviewed and documented by the project group before implementation.
