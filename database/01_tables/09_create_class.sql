CREATE TABLE CLASS (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL,
    level_id INT NOT NULL,
    program_id INT NOT NULL,

    CONSTRAINT fk_class_level
        FOREIGN KEY (level_id)
        REFERENCES `LEVEL`(level_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_class_program
        FOREIGN KEY (program_id)
        REFERENCES PROGRAM(program_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT uq_class_name_program_level
        UNIQUE (class_name, program_id, level_id)
) ENGINE=InnoDB;