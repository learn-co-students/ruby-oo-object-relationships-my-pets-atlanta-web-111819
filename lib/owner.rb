class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self 
    @cats = []
    @dogs = []
  end 

  def say_species
    "I am a #{@species}."
  end 

  def self.all
    @@all
  end 

  def self.count
    @@all.length
  end 

  def self.reset_all
    @@all.delete_if{|o| o}
  end 

  def cats 
    Cat.all.select {|c| c.owner == self}
  end 

  def dogs 
    Dog.all.select {|d| d.owner == self}
  end 

  def buy_cat(name)
    Cat.new(name, self)
  end 

  def buy_dog(name)
    Dog.new(name, self)
  end 

  def walk_dogs
    Dog.all.select do |dog|
      if dog.owner == self
        dog.mood = "happy"
      end 
    end 
  end 

  def feed_cats
    Cat.all.select do |cat|
     if cat.owner == self
      cat.mood = "happy"
     end 
    end 
  end 

  def sell_pets
    #i think like prox or something could be used here
    #bc im re-using wayyy to often. not sure tho
    Dog.all.select do |dog|
      if dog.owner == self 
        dog.mood = "nervous"
        dog.owner = nil
      end 
    end 
    Cat.all.select do |cat|
      if cat.owner == self
      cat.mood = "nervous"
      cat.owner = nil
      end 
    end 
  end 
   
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 



end