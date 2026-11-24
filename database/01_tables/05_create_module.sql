CREATE TABLE MODULE (
    module_id INT AUTO_INCREMENT PRIMARY KEY,
    module_name VARCHAR(150) NOT NULL,
    credit_value INT NOT NULL,

    CONSTRAINT chk_module_credit
        CHECK (credit_value > 0)
) ENGINE=InnoDB;