CREATE TABLE TEACHING_ASSIGNMENT (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    lecturer_id INT NOT NULL,
    course_id INT NOT NULL,
    class_id INT NOT NULL,
    semester_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE DEFAULT NULL,
    assignment_status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_assignment_lecturer
        FOREIGN KEY (lecturer_id)
        REFERENCES LECTURER(lecturer_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_assignment_course
        FOREIGN KEY (course_id)
        REFERENCES COURSE(course_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_assignment_class
        FOREIGN KEY (class_id)
        REFERENCES CLASS(class_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_assignment_semester
        FOREIGN KEY (semester_id)
        REFERENCES SEMESTER(semester_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_assignment_dates
        CHECK (end_date IS NULL OR start_date < end_date)
) ENGINE=InnoDB;