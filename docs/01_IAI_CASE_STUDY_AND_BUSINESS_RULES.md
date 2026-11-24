# IAI UNIVERSITY MANAGEMENT DATABASE SYSTEM

## Case Study and Business Rules

**Case Study:** Institut Africain d'Informatique (IAI), Cameroon

**Database Management System:** MariaDB

**Document Version:** 1.0 — Initial Draft


# 1. INTRODUCTION

## 1.1 Background

Information management is an important aspect of the administration of educational institutions. Universities and higher education institutions handle different academic activities, including student registration, academic programme management, class organization, curriculum management, lecturer allocation, and the organization of academic years and semesters.

These activities involve large amounts of related information. For example, students are assigned to classes, classes belong to academic programmes, programmes contain modules, modules contain courses, and lecturers are assigned to teach courses to specific classes.

Managing these relationships requires an organized approach to information storage and retrieval. A properly designed database can help maintain data consistency, reduce unnecessary duplication, and facilitate access to relevant academic information.

This project focuses on the design and implementation of a relational database for selected academic management activities at the Institut Africain d'Informatique (IAI), Cameroon.

## 1.2 Presentation of the case study

The Institut Africain d'Informatique (IAI), Cameroon, is the institution selected for this case study.

The project examines selected aspects of its academic organization, particularly the management of students, lecturers, academic programmes, levels, classes, modules, courses, academic years, semesters, student enrollment, and teaching assignments.

The study considers how these academic elements relate to one another and identifies the information that must be maintained to represent their relationships accurately.

The database will therefore provide a structured representation of the selected academic activities.

## 1.3 Problem statement

Academic management involves several interconnected entities and activities. Information about students, programmes, classes, modules, courses, lecturers, and academic periods must be properly organized.

Without an appropriate data structure, managing these relationships can lead to difficulties such as:

- Difficulty retrieving a student's academic class history.
- Inconsistencies when organizing programmes and their curricula.
- Difficulty identifying the courses associated with a particular module.
- Difficulty determining which lecturer teaches a particular course to a particular class.
- Duplication or inconsistency of academic information.
- Difficulty maintaining historical academic records across different academic years.

The project therefore seeks to design a relational database that represents these selected academic activities and enforces the relationships and rules governing them.

## 1.4 Aim of the project

The main aim of this project is to design and implement a relational database for managing selected academic activities at IAI, Cameroon, using MariaDB.

## 1.5 Specific objectives

The project intends to:

1. Identify the main entities involved in the selected academic activities.
2. Analyze the relationships between students, lecturers, programmes, classes, modules, and courses.
3. Establish the business rules governing these relationships.
4. Design an appropriate entity-relationship model.
5. Transform the conceptual model into a relational database schema.
6. Implement the database using MariaDB.
7. Apply integrity constraints to ensure data consistency.
8. Implement and test relevant SQL operations and database features.
9. Demonstrate the database using realistic academic scenarios.

---

# 2. DESCRIPTION OF THE ACADEMIC ENVIRONMENT

## 2.1 Academic programmes

The institution's academic organization includes different programmes of study.

The programmes considered in this project include:

- Software Engineering.
- Systems and Networks (Système et Réseaux).
- Génie Logiciel.

Each programme represents a distinct course of study with an associated academic structure.

A programme is different from a class. For example, Software Engineering is a programme, whereas BA1A and BA1B are classes associated with that programme.

## 2.2 Academic levels

Academic programmes are organized into different levels representing stages of academic progression.

The following class naming examples have been identified for the programmes considered:

| Programme | Level 1 | Level 2 | Level 3 |
|---|---|---|---|
| Software Engineering | BA1A, BA1B, BA1C | BA2 | SE3 |
| Systems and Networks | L1 | L2 | SR |
| Génie Logiciel | L1 | L2 | GL |

The examples show that class names may be reused across different programmes. Consequently, a class must be uniquely identified independently of its name.

## 2.3 Classes

A class represents an academic group of students belonging to a particular programme and academic level.

For example, BA1A, BA1B, and BA1C are separate classes within Software Engineering Level 1.

Although these classes belong to the same programme and level, they remain distinct academic groups.

Each class is associated with one programme and one academic level.

## 2.4 Modules and courses

The academic curriculum is organized into modules and courses.

A module is an academic unit that groups related courses and has an associated credit value.

A module may contain several courses, while each course belongs to one module.

Furthermore, a module may be shared by different programmes. Its position within a particular programme is defined through the programme's curriculum structure.

## 2.5 Academic years and semesters

Academic activities are organized into academic years.

Within the scope of this project, an academic year contains two semesters. Each semester belongs to one academic year and has its own dates and administrative status.

The database distinguishes between an actual semester belonging to an academic year and the curriculum semester number used to position a module within a programme.

## 2.6 Students and lecturers

Students are individuals enrolled in academic programmes and allocated to classes.

The institution maintains information that identifies students and supports their academic administration.

Lecturers are individuals responsible for teaching courses. Their information is maintained separately from student information.

Teaching activities are represented through assignments connecting lecturers, courses, classes, and semesters.

---

# 3. SCOPE OF THE STUDY

## 3.1 Activities included

The project covers the following academic management activities:

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

## 3.2 Activities excluded

To maintain a manageable project scope, the following activities are excluded from the current implementation:

- Examination results and grades.
- Tuition fees and financial accounting.
- Student attendance management.
- Library management.
- Hostel and accommodation management.
- Lecturer payroll management.

These activities may be considered in future extensions, but they are not part of the current database model.

---

# 4. BUSINESS CASES

This section will describe the individual academic activities, their actors, processes, information requirements, and governing business rules.

The business cases will be developed in the following order:

1. Student registration and identification.
2. Programme selection and admission.
3. Academic level management.
4. Class management.
5. Module management.
6. Course management.
7. Programme curriculum management.
8. Academic year management.
9. Semester management.
10. Student enrollment and class allocation.
11. Lecturer management.
12. Lecturer teaching assignment management.

Each business case will be analyzed before its corresponding database implementation is developed.
