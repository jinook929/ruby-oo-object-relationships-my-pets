class Owner
  # code goes here
  @@all = []
  def self.all
    @@all
  end

  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    self.class.all.push(self)
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end
  
  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.find {|dog| dog.owner == self}.mood = "happy"
  end

  def feed_cats
    Cat.all.find {|cat| cat.owner == self}.mood = "happy"
  end

  def sell_pets
    self.cats.concat(self.dogs).each {|pet| pet.mood = "nervous"; pet.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
