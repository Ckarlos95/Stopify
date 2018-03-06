-- +micrate Up
CREATE TABLE albums (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  year YEAR,
  duration TIME DEFAULT "00:00:00",
  image VARCHAR(255),
  plays INT DEFAULT 0,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);


-- +micrate Down
DROP TABLE IF EXISTS albums;
