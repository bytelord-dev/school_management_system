# 06 — DATABASE DESIGN DECISIONS

## 1. Introduction

This document explains the major design decisions made during the development of the IAI University Management Database.

Database design involves more than identifying entities and relationships. It also requires making decisions about how information should be organized, how relationships should be represented, how data integrity should be maintained, and how the database should support the institution's academic operations.

The purpose of this document is to explain the reasoning behind the selected database structure and establish the principles that will guide its implementation.

## 2. Database Management System Selection

### Decision

MariaDB was selected as the Database Management System (DBMS) for the project.

### Justification

MariaDB is a relational database management system that supports:

- SQL operations.
- Primary and foreign key constraints.
- Transactions.
- Stored procedures and functions.
- Triggers.
- Views.
- Indexes.
- User privileges and access control.

These features are suitable for implementing and testing the academic database requirements.

Some group members may use MySQL in their personal development environments. However, MariaDB remains the team's official target DBMS.

All final SQL scripts must be validated using the agreed MariaDB version.

## 3. Relational Database Model

### Decision

The project uses the relational database model.

### Justification

The institution's academic information consists of related data entities such as students, lecturers, programmes, modules, courses, classes, and academic years.

The relational model allows this information to be organized into tables connected through primary and foreign keys.

It also supports:

- Data consistency.
- Referential integrity.
- Reduced data duplication.
- Structured queries.
- Transaction management.

## 4. Selection of Entities

### Decision

The database contains twelve entities:

1. STUDENT
2. LECTURER
3. TEACHING_ASSIGNMENT
4. PROGRAM
5. MODULE
6. COURSE
7. PROGRAM_MODULE
8. LEVEL
9. CLASS
10. ENROLLMENT
11. ACADEMIC_YEAR
12. SEMESTER

### Justification

These entities represent the main academic objects and activities included in the project's scope.

Each entity stores information about a distinct concept or relationship that requires independent management.

The structure separates student information, academic organization, curriculum information, and teaching assignments.

## 5. Use of Surrogate Primary Keys

### Decision

Each entity uses a dedicated identifier as its primary key.

Examples include:

- std_id
- lecturer_id
- program_id
- module_id
- course_id
- class_id

### Justification

Dedicated identifiers provide stable and unique references to records.

They prevent the database from depending on descriptive attributes such as names, email addresses, or class names, which may change or may not be globally unique.

They also simplify the creation of foreign key relationships.

## 6. Student Enrollment Design

### Decision

The ENROLLMENT entity connects STUDENT, CLASS, and ACADEMIC_YEAR.

### Justification

A student may belong to different classes across different academic years.

For example:

- During 2025/2026, a student may be allocated to BA1A.
- During 2026/2027, the same student may be allocated to BA2.

Instead of changing the student's class information directly in the STUDENT table, each academic-year allocation is recorded as a separate enrollment record.

This approach preserves the student's academic class allocation history.

### Additional Rule

A student must not have more than one enrollment record for the same academic year.

This rule will be enforced using a unique constraint on:

`(student_id, academic_year_id)`

## 7. Programme and Class Separation

### Decision

PROGRAM and CLASS are represented as separate entities.

### Justification

A programme represents an academic course of study offered by the institution, while a class represents a specific group of students organized under a programme and academic level.

For example, the Software Engineering programme may contain:

- BA1A
- BA1B
- BA1C
- BA2
- SE3

These classes belong to the same programme but may represent different academic levels or student groups.

Separating PROGRAM and CLASS avoids storing programme information repeatedly for every student.

### Additional Rule

Each class must belong to exactly one programme and one academic level.

## 8. Independent LEVEL Entity

### Decision

LEVEL is represented as an independent entity rather than storing level names directly in CLASS.

### Justification

Different programmes may use the same academic levels.

For example, Level 1 and Level 2 exist in multiple programmes.

Creating a separate LEVEL entity allows the same academic level to be referenced by different classes and programme curricula.

It also avoids unnecessary duplication of level information.

## 9. Programme and Module Relationship

### Decision

PROGRAM and MODULE are connected through the PROGRAM_MODULE entity.

### Justification

A programme can contain several modules, while a module may be shared by different programmes.

This represents a many-to-many relationship.

The PROGRAM_MODULE entity resolves this relationship and stores additional curriculum information:

- The programme.
- The module.
- The academic level.
- The curriculum semester number.

This allows the database to identify which modules belong to a particular programme and academic level.

### Additional Rule

A module must not appear more than once in the curriculum of the same programme.

The proposed unique constraint is:

`UNIQUE(program_id, module_id)`

## 10. Separation of MODULE and COURSE

### Decision

MODULE and COURSE are represented as separate entities.

### Justification

A module may contain several courses, but each course belongs to one module in the approved model.

The separation reflects the institution's academic organization and allows courses to be grouped under modules.

Another important consideration is that credit values are attributed to modules rather than individual courses.

Therefore, the credit_value attribute is stored in MODULE instead of COURSE.

## 11. Separation of Curriculum Semester and Actual Semester

### Decision

PROGRAM_MODULE stores semester_number, while SEMESTER is a separate entity associated with ACADEMIC_YEAR.

### Justification

The two concepts represent different things.

**Curriculum semester number:**

Indicates where a module belongs in a programme's curriculum. For example, a module may be scheduled for curriculum semester 1 or 2.

**Actual semester:**

Represents a semester taking place within a specific academic year, with actual starting and ending dates.

For example, Semester 1 of 2025/2026 is an actual academic semester.

Keeping these concepts separate prevents confusion between curriculum organization and academic calendar management.

## 12. Academic Year and Semester Relationship

### Decision

SEMESTER is connected to ACADEMIC_YEAR through a foreign key.

### Justification

Each semester belongs to a particular academic year.

This allows the institution to organize semesters within academic years and store their respective dates and statuses.

The model supports the institution's two-semester academic-year structure.

### Additional Rule

A semester number must not be duplicated within the same academic year.

The proposed unique constraint is:

`UNIQUE(academic_year_id, semester_number)`

The requirement that each academic year contains exactly two semesters must also be validated during database operations.

## 13. Teaching Assignment Design

### Decision

The TEACHING_ASSIGNMENT entity connects LECTURER, COURSE, CLASS, and SEMESTER.

### Justification

Teaching assignments involve multiple academic objects.

A lecturer may teach different courses, and a course may be taught to different classes.

The same course may also be assigned to different lecturers in different classes.

Therefore, storing a lecturer directly in COURSE would not adequately represent the institution's teaching arrangements.

TEACHING_ASSIGNMENT records each specific assignment.

Each record represents:

- One lecturer.
- One course.
- One class.
- One semester.

### Historical Records

When a lecturer's assignment changes, a new assignment record should be created while retaining the previous record.

This preserves assignment history.

## 14. Absence of a Direct STUDENT–COURSE Relationship

### Decision

The current database does not contain a direct relationship between STUDENT and COURSE.

### Justification

Students in the same programme and academic level follow the same curriculum under the current project assumptions.

The courses applicable to a student can therefore be obtained through the following relationship path:

STUDENT → ENROLLMENT → CLASS → PROGRAM_MODULE → MODULE → COURSE

The student's programme and level are obtained through the CLASS entity.

Creating a separate STUDENT_COURSE entity is not necessary for the current scope.

However, individual course registration, electives, and retake management would require additional design considerations if introduced in a future version.

## 15. Absence of a Separate Programme Enrollment Entity

### Decision

The current model does not include a separate STUDENT_PROGRAM_ENROLLMENT entity.

### Justification

The admission process involves programme selection followed by class allocation.

Under the agreed project scope, these operations occur as part of the same admission workflow.

The ENROLLMENT entity records the student's class allocation, while the associated programme can be obtained through the CLASS entity.

This avoids storing programme information redundantly in ENROLLMENT.

## 16. Absence of a RESULT Entity

### Decision

The current database does not include a RESULT entity.

### Justification

The project scope focuses on academic organization and teaching administration rather than examination and student performance management.

Therefore, examination marks, grades, and academic results are excluded from the current database model.

If examination and result management are introduced in a future version, additional entities and relationships will be required.

## 17. Data Integrity and Constraints

### Decision

The database will use primary keys, foreign keys, unique constraints, NOT NULL constraints, and appropriate validation rules.

### Justification

These mechanisms help maintain accurate and consistent data.

Examples include:

- Unique student matriculation numbers.
- Unique programme codes.
- One enrollment per student per academic year.
- Unique semester numbers within an academic year.
- Valid references between related entities.
- Valid date ranges.

Some business rules involve more than a single foreign key. In particular, the programme and level associated with a CLASS must correspond to the programme and level of the relevant PROGRAM_MODULE records.

This consistency will require suitable composite constraints or additional database validation.

## 18. Storage Engine Selection

### Decision

InnoDB will be used as the storage engine for the database tables.

### Justification

InnoDB supports:

- Foreign key constraints.
- Transactions.
- COMMIT and ROLLBACK operations.
- Data integrity.
- Row-level locking.

These features are important for maintaining consistency when multiple related database operations are performed.

## 19. Normalization Approach

### Decision

The database will be designed using relational normalization principles.

### Justification

Normalization helps organize information into appropriate tables and reduces unnecessary data duplication.

The design separates concepts such as:

- Students and enrollments.
- Programmes and classes.
- Modules and courses.
- Academic years and semesters.
- Lecturers and teaching assignments.

The group will review the relational schema to ensure that attributes depend appropriately on their respective keys and that avoidable insertion, update, and deletion anomalies are minimized.

The final normalization assessment will be documented during relational schema validation.

## 20. Project Scope Limitations

The current database focuses on the approved academic management requirements.

The following areas are excluded from the current implementation:

- Examination results and student grades.
- School fee management.
- Student attendance management.
- Library management.
- Hostel management.
- Staff payroll management.
- Online learning and course delivery.

These areas may be considered in future extensions of the database.

## 21. Conclusion

The database design decisions establish the principles and reasoning behind the structure of the IAI University Management Database.

They explain how the twelve entities were organized, why specific relationships were selected, and how data integrity will be maintained.

These decisions will guide the transformation of the conceptual design into a relational schema and its subsequent implementation using MariaDB.

---

**Document status:** Initial database design decisions  
**Database management system:** MariaDB  
**Number of entities:** 12
