require 'sqlite3'
require 'bcrypt'

class Seeder
  
  def self.seed!
    drop_tables
    create_tables
    populate_tables
  end

  def self.drop_tables
    db.execute('DROP TABLE IF EXISTS fruits')
  end

  def self.create_tables
    db.execute('CREATE TABLE fruits (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL CHECK(name <> "") UNIQUE,
                tastiness INTEGER NOT NULL CHECK(tastiness > 0),
                description TEXT)')
  end

  def self.populate_tables
  end

  private
  def self.db
    return @db if @db
    @db = SQLite3::Database.new('db/fruits.sqlite')
    @db.results_as_hash = true
    @db
  end
end

Seeder.seed!