class Playlist < Granite::ORM::Base
  adapter mysql
  table_name playlists

  belongs_to :user

  # id : Int64 primary key is created for you
  field name : String
  field description : String
  field duration : Time
  field image : String
  timestamps
end
