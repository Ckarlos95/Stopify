class Country < Granite::ORM::Base
  adapter mysql
  table_name countries


  # id : Int64 primary key is created for you
  field name : String
  timestamps
end
