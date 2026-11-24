CREATE TABLE `LEVEL` (
    level_id INT AUTO_INCREMENT PRIMARY KEY,
    level_name VARCHAR(50) NOT NULL,
    level_number TINYINT NOT NULL,

    CONSTRAINT chk_level_number
        CHECK (level_number > 0)
) ENGINE=InnoDB;