class AdminController < ApplicationController
  @uri = "mysql://admin:admin@localhost/"

  def dashboard
    render "dashboard.slang"
  end

  def databases
    databases = with_db { |db| db.query_all "SHOW DATABASES", as: String }

    respond_with { json databases.to_json }
  end

  def tables
    database = params["database"]
    tables = with_db { |db| db.query_all "SHOW TABLES FROM #{database}", as: String }

    respond_with { json tables.to_json }
  end

  def table_desc
    database = params["database"]
    table = params["table"]
    titles = {"field", "type", "null", "key", "default", "extra"}
    desc = with_db do |db|
      db.query_all(
        "DESC #{database}.#{table}",
        as: {String, String, String, String, String?, String}
      )
    end
    description = desc.map { |row| Hash.zip titles.to_a, row.to_a }

    respond_with { json description.to_json }
  end

  def with_db
    DB.open @uri do |db|
      yield db
    end
  end
end
