-- +micrate Up
CREATE TABLE discs (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  number INT DEFAULT 1,
  album_id BIGINT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
CREATE INDEX disc_album_id_idx ON discs (album_id);

-- +micrate Down
DROP TABLE IF EXISTS discs;
