class Artist < Granite::ORM::Base
  adapter mysql

  belongs_to :country

  has_many :followers
  has_many :users, through: followers

  has_many :releases
  has_many :albums, through: releases

  has_many :discs

  table_name artists

  # id : Int64 primary key is created for you
  field name : String
  field biography : String
  timestamps
end
