class Follower < Granite::ORM::Base
  adapter mysql
  table_name followers

  belongs_to :user
  belongs_to :artist

  # id : Int64 primary key is created for you
  timestamps
end
