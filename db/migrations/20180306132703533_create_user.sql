-- +micrate Up
CREATE TABLE users (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  hashed_password VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  birthday DATE NOT NULL,
  gender INT UNSIGNED NOT NULL DEFAULT 0,
  -- gender: 0 is for unknown gender as of ISO/IEC 5218
  role INT UNSIGNED NOT NULL DEFAULT 2,
  -- role: 2 is for normal user
  country_id BIGINT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
CREATE INDEX user_country_id_idx ON users (country_id);

-- +micrate Down
DROP TABLE IF EXISTS users;
