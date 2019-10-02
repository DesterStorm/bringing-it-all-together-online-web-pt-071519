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
  
  
  
end