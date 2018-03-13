-- +micrate Up
CREATE TABLE songs (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  duration TIME DEFAULT "00:00:00",
  plays INT DEFAULT 0,
  disc_id BIGINT UNSIGNED,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
CREATE INDEX song_disc_id_idx ON songs (disc_id);

-- +micrate Down
DROP TABLE IF EXISTS songs;
