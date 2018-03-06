class Album < Granite::ORM::Base
  adapter mysql

  has_many :releases
  has_many :artists, through: releases

  table_name albums


  # id : Int64 primary key is created for you
  field name : String
  field year : Int32
  field duration : Time
  field image : String
  field plays : Int32
  timestamps
end
