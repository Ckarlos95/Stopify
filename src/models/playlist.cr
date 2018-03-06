class Playlist < Granite::ORM::Base
  adapter mysql

  belongs_to :user

  has_many :included_songs
  has_many :songs, through: included_songs

  table_name playlists

  # id : Int64 primary key is created for you
  field name : String
  field description : String
  field duration : Time
  field image : String
  timestamps
end
