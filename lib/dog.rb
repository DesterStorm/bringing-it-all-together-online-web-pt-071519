class Dog 
  
  attr_accessor :name, :breed, :id
  # attr_reader 
  
  def initialize(attributes)
    # @id = id 
    # @name = name 
    # @breed = breed 
    attributes.each {|key, value| self.send(("#{key}="), value)}
    self.id ||= nil
  end
  
  def self.create_table
    sql = <<-SQL
    CREATE TABLE dogs (
    id INTEGER PRIMARY KEY, 
    name TEXT,
    breed TEXT
    );
    SQL
    
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = <<-SQL
    DROP TABLE dogs;
    SQL
    
    DB[:conn].execute(sql)
  end
  
  def save
    if self.id 
      self.update
    else 
      sql = <<-SQL
      INSERT INTO dogs (name, breed) VALUES (?, ?);
      SQL
      DB[:conn].execute(sql, name, breed)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
      
      self
    end
  end
  
  def self.create(hash_of_attributes)
    peko = Dog.new(hash_of_attributes)
    peko.save
    peko
  end
  
  def self.new_from_database
    
  end
  
end