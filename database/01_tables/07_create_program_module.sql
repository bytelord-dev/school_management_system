CREATE TABLE PROGRAM_MODULE (
    program_module_id INT AUTO_INCREMENT PRIMARY KEY,
    program_id INT NOT NULL,
    module_id INT NOT NULL,
    level_id INT NOT NULL,
    semester_number TINYINT NOT NULL,

    CONSTRAINT fk_program_module_program
        FOREIGN KEY (program_id)
        REFERENCES PROGRAM(program_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_program_module_module
        FOREIGN KEY (module_id)
        REFERENCES MODULE(module_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_program_module_level
        FOREIGN KEY (level_id)
        REFERENCES `LEVEL`(level_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT uq_program_module
        UNIQUE (program_id, module_id),

    CONSTRAINT chk_program_module_semester
        CHECK (semester_number IN (1, 2))
) ENGINE=InnoDB;