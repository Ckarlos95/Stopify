class Release < Granite::ORM::Base
  adapter mysql
  table_name releases

  belongs_to :artist
  belongs_to :album

  # id : Int64 primary key is created for you
  timestamps
end
