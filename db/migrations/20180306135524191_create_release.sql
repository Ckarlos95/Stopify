-- +micrate Up
CREATE TABLE releases (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  artist_id BIGINT,
  album_id BIGINT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
CREATE INDEX release_artist_id_idx ON releases (artist_id);
CREATE INDEX release_album_id_idx ON releases (album_id);

-- +micrate Down
DROP TABLE IF EXISTS releases;
