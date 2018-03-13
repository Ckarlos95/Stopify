-- +micrate Up
CREATE TABLE included_songs (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  playlist_id BIGINT UNSIGNED,
  song_id BIGINT UNSIGNED,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
CREATE INDEX included_song_playlist_id_idx ON included_songs (playlist_id);
CREATE INDEX included_song_song_id_idx ON included_songs (song_id);

-- +micrate Down
DROP TABLE IF EXISTS included_songs;
