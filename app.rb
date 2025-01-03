require 'bcrypt'

class App < Sinatra::Base
  def db
    return @db if @db

    @db = SQLite3::Database.new("db/password_tracker.sqlite")
    @db.results_as_hash = true

    return @db
  end
end