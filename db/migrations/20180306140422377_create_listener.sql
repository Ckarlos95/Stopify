-- +micrate Up
CREATE TABLE listeners (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED,
  playlist_id BIGINT UNSIGNED,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
CREATE INDEX listener_user_id_idx ON listeners (user_id);
CREATE INDEX listener_playlist_id_idx ON listeners (playlist_id);

-- +micrate Down
DROP TABLE IF EXISTS listeners;
