CREATE TABLE COURSE (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(150) NOT NULL,
    module_id INT NOT NULL,

    CONSTRAINT fk_course_module
        FOREIGN KEY (module_id)
        REFERENCES MODULE(module_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;