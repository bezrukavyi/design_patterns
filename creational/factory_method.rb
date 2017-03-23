class Mammal
  def say
    'I am mammal'
  end
end

class Plant
  def say
    'I am plant'
  end
end

class Lion < Mammal
  def say
    "I am lion and #{super}"
  end
end

class Baobab < Plant
  def say
    "I am baobab and #{super}"
  end
end

class Frog < Mammal
  def say
    "I am frog and #{super}"
  end
end

class Seaweed < Plant
  def say
    "I am seaweed and #{super}"
  end
end

class EcoFactory
  attr_reader :mammals, :plants

  def initialize(mammals_count: 0, plants_count: 0)
    @mammals = mammals_count.times.map { generate_organism(:mammal) }
    @plants = plants_count.times.map { generate_organism(:plant) }
  end

  def all_say
    mammals.each { |mammal| puts mammal.say }
    plants.each { |plant| puts plant.say }
  end

  def undefined_organism
    raise "Undefined organism #{type}"
  end
end

class LandEco < EcoFactory
  def generate_organism(type)
    case type
    when :mammal then Lion.new
    when :plant then Baobab.new
    else undefined_organism(type)
    end
  end
end

class WaterEco < EcoFactory
  def generate_organism(type)
    case type
    when :mammal then Frog.new
    when :plant then Seaweed.new
    else undefined_organism(type)
    end
  end
end

LandEco.new(mammals_count: 1, plants_count: 1).all_say
# I am lion and I am mammal
# I am baobab and I am plant
WaterEco.new(mammals_count: 1, plants_count: 1).all_say
# I am frog and I am mammal
# I am seaweed and I am plant
