CREATE TABLE ACADEMIC_YEAR (
    academic_year_id INT AUTO_INCREMENT PRIMARY KEY,
    year_name VARCHAR(20) NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    year_status VARCHAR(30) NOT NULL,

    CONSTRAINT chk_academic_year_dates
        CHECK (start_date < end_date)
) ENGINE=InnoDB;