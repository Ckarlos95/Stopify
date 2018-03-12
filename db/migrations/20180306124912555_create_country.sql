-- +micrate Up
CREATE TABLE countries (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);


-- +micrate Down
DROP TABLE IF EXISTS countries;
