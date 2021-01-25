class Cat
  # code goes here
  @@all = []
  def self.all
    @@all
  end

  attr_accessor :owner, :mood
  attr_reader :name

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    self.class.all.push(self)
  end

end
