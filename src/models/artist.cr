class Artist < Granite::ORM::Base
  adapter mysql
  table_name artists

  belongs_to :country

  has_many :followers
  has_many :users, through: followers

  has_many :releases
  has_many :albums, through: releases

  # id : Int64 primary key is created for you
  field name : String
  field biography : String
  timestamps
end
