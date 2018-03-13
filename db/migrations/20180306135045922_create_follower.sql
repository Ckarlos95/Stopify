-- +micrate Up
CREATE TABLE followers (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED,
  artist_id BIGINT UNSIGNED,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
CREATE INDEX follower_user_id_idx ON followers (user_id);
CREATE INDEX follower_artist_id_idx ON followers (artist_id);

-- +micrate Down
DROP TABLE IF EXISTS followers;
