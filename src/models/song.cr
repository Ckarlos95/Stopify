class Song < Granite::ORM::Base
  adapter mysql

  belongs_to :disc

  table_name songs
  
  # id : Int64 primary key is created for you
  field name : String
  field duration : Time
  field plays : Int32
  timestamps
end
