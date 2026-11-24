CREATE TABLE SEMESTER (
    semester_id INT AUTO_INCREMENT PRIMARY KEY,
    academic_year_id INT NOT NULL,
    semester_number TINYINT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    semester_status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_semester_academic_year
        FOREIGN KEY (academic_year_id)
        REFERENCES ACADEMIC_YEAR(academic_year_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT uq_academic_year_semester
        UNIQUE (academic_year_id, semester_number),

    CONSTRAINT chk_semester_number
        CHECK (semester_number IN (1, 2)),

    CONSTRAINT chk_semester_dates
        CHECK (start_date < end_date)
) ENGINE=InnoDB;