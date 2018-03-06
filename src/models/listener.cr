class Listener < Granite::ORM::Base
  adapter mysql
  table_name listeners

  belongs_to :user
  belongs_to :playlist

  # id : Int64 primary key is created for you
  timestamps
end
