
-- ==========================================
-- IAI UNIVERSITY
-- PROGRAM_MODULE INSERTION
-- All programmes and all three levels
-- ==========================================

-- LEVEL 1: SHARED BY SE, SR AND GL

INSERT INTO PROGRAM_MODULE
(program_id, module_id, level_id, semester_number)
VALUES
-- SOFTWARE ENGINEERING
(1, 1, 1, 1),
(1, 1, 1, 2),
(1, 2, 1, 1),
(1, 3, 1, 1),
(1, 4, 1, 1),
(1, 5, 1, 1),
(1, 6, 1, 2),
(1, 7, 1, 2),
(1, 8, 1, 2),
(1, 9, 1, 2),
(1, 10, 1, 1),
(1, 10, 1, 2),

-- SYSTEMS AND NETWORKS
(2, 1, 1, 1),
(2, 1, 1, 2),
(2, 2, 1, 1),
(2, 3, 1, 1),
(2, 4, 1, 1),
(2, 5, 1, 1),
(2, 6, 1, 2),
(2, 7, 1, 2),
(2, 8, 1, 2),
(2, 9, 1, 2),
(2, 10, 1, 1),
(2, 10, 1, 2),

-- GENIE LOGICIEL
(3, 1, 1, 1),
(3, 1, 1, 2),
(3, 2, 1, 1),
(3, 3, 1, 1),
(3, 4, 1, 1),
(3, 5, 1, 1),
(3, 6, 1, 2),
(3, 7, 1, 2),
(3, 8, 1, 2),
(3, 9, 1, 2),
(3, 10, 1, 1),
(3, 10, 1, 2);


-- LEVEL 2: SHARED BY SE, SR AND GL

INSERT INTO PROGRAM_MODULE
(program_id, module_id, level_id, semester_number)
VALUES
-- SOFTWARE ENGINEERING
(1, 11, 2, 1),
(1, 12, 2, 1),
(1, 13, 2, 1),
(1, 14, 2, 1),
(1, 15, 2, 1),
(1, 16, 2, 2),
(1, 17, 2, 2),
(1, 18, 2, 1),
(1, 18, 2, 2),
(1, 19, 2, 2),
(1, 20, 2, 2),
(1, 21, 2, 2),

-- SYSTEMS AND NETWORKS
(2, 11, 2, 1),
(2, 12, 2, 1),
(2, 13, 2, 1),
(2, 14, 2, 1),
(2, 15, 2, 1),
(2, 16, 2, 2),
(2, 17, 2, 2),
(2, 18, 2, 1),
(2, 18, 2, 2),
(2, 19, 2, 2),
(2, 20, 2, 2),
(2, 21, 2, 2),

-- GENIE LOGICIEL
(3, 11, 2, 1),
(3, 12, 2, 1),
(3, 13, 2, 1),
(3, 14, 2, 1),
(3, 15, 2, 1),
(3, 16, 2, 2),
(3, 17, 2, 2),
(3, 18, 2, 1),
(3, 18, 2, 2),
(3, 19, 2, 2),
(3, 20, 2, 2),
(3, 21, 2, 2);


-- LEVEL 3: SOFTWARE ENGINEERING

INSERT INTO PROGRAM_MODULE
(program_id, module_id, level_id, semester_number)
VALUES
(1, 22, 3, 1),
(1, 23, 3, 1),
(1, 24, 3, 1),
(1, 25, 3, 1),
(1, 26, 3, 1),
(1, 27, 3, 2),
(1, 28, 3, 2),
(1, 29, 3, 1),
(1, 29, 3, 2),
(1, 30, 3, 2);


-- LEVEL 3: GENIE LOGICIEL

INSERT INTO PROGRAM_MODULE
(program_id, module_id, level_id, semester_number)
VALUES
(3, 22, 3, 1),
(3, 23, 3, 1),
(3, 24, 3, 1),
(3, 25, 3, 1),
(3, 26, 3, 1),
(3, 27, 3, 2),
(3, 28, 3, 2),
(3, 29, 3, 1),
(3, 29, 3, 2),
(3, 30, 3, 2);


-- LEVEL 3: SYSTEMS AND NETWORKS

INSERT INTO PROGRAM_MODULE
(program_id, module_id, level_id, semester_number)
VALUES
(2, 31, 3, 1),
(2, 32, 3, 1),
(2, 33, 3, 1),
(2, 34, 3, 1),
(2, 26, 3, 2),
(2, 35, 3, 2),
(2, 36, 3, 2),
(2, 37, 3, 2),
(2, 38, 3, 2),
(2, 39, 3, 2),
(2, 40, 3, 2);
