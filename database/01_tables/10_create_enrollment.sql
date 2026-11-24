CREATE TABLE ENROLLMENT (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    class_id INT NOT NULL,
    academic_year_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id)
        REFERENCES STUDENT(std_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_enrollment_class
        FOREIGN KEY (class_id)
        REFERENCES CLASS(class_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_enrollment_academic_year
        FOREIGN KEY (academic_year_id)
        REFERENCES ACADEMIC_YEAR(academic_year_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT uq_student_academic_year
        UNIQUE (student_id, academic_year_id)
) ENGINE=InnoDB;