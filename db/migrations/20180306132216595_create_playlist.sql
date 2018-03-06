-- +micrate Up
CREATE TABLE playlists (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  duration TIME DEFAULT "00:00:00",
  image VARCHAR(255),
  user_id BIGINT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
CREATE INDEX playlist_user_id_idx ON playlists (user_id);

-- +micrate Down
DROP TABLE IF EXISTS playlists;