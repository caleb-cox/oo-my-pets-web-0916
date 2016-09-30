class Owner
  @@all = []

  attr_accessor :name, :pets
  attr_reader :species

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {fishes: [], dogs: [], cats: []}

    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |species, pet_list|
      pet_list.each do |pet|
        pet.mood = "nervous"
      end
      pet_list.clear
    end
  end

  def list_pets
    fish_count = @pets[:fishes].size
    dog_count = @pets[:dogs].size
    cat_count = @pets[:cats].size

    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end
end