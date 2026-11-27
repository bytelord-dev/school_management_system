CREATE TABLE LECTURER (
    lecturer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(30),
    hire_date DATE NOT NULL,
    lecturer_status VARCHAR(30) NOT NULL
) ENGINE=InnoDB;
