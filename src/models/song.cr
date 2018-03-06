class Song < Granite::ORM::Base
  adapter mysql

  belongs_to :disc

  has_many :included_songs
  has_many :playlists, through: included_songs

  table_name songs

  # id : Int64 primary key is created for you
  field name : String
  field duration : Time
  field plays : Int32
  timestamps
end
