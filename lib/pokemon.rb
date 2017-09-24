require "pry"
class Pokemon

  attr_reader :id, :name, :type, :db

  def initialize(id: id, name: name, type: type, db: db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database)
    pik = database.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    Pokemon.new(id: pik[0], name: pik[1], type: pik[2], db: database)
  end

end
