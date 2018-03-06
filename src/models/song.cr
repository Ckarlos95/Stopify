class Song < Granite::ORM::Base
  adapter mysql
  table_name songs

  belongs_to :disc

  # id : Int64 primary key is created for you
  field name : String
  field duration : Time
  field plays : Int32
  timestamps
end
