# AMD-Users Table
CREATE TABLE amd_users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    create_at TIMESTAMP NOT NULL,
    email VARCHAR(50) NOT NULL,
    encrypted_pwd VARCHAR(255) NOT NULL,
    name VARCHAR(50) NOT NULL,
    user_id VARCHAR(255) NOT NULL
);

