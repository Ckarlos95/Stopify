class Artist < Granite::ORM::Base
  adapter mysql
  table_name artists

  belongs_to :country

  # id : Int64 primary key is created for you
  field name : String
  field biography : String
  timestamps
end
