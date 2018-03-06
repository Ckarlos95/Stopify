-- +micrate Up
CREATE TABLE artists (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  biography TEXT,
  country_id BIGINT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
CREATE INDEX artist_country_id_idx ON artists (country_id);

-- +micrate Down
DROP TABLE IF EXISTS artists;
