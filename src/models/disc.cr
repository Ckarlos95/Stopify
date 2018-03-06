class Disc < Granite::ORM::Base
  adapter mysql
  table_name discs

  belongs_to :album

  # id : Int64 primary key is created for you
  field number : Int32
  timestamps
end
