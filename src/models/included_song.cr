class IncludedSong < Granite::ORM::Base
  adapter mysql
  table_name included_songs

  belongs_to :playlist
  belongs_to :song

  # id : Int64 primary key is created for you
  timestamps
end
