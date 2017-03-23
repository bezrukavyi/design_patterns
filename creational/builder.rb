class Wheel
  attr_accessor :diameter

  def initialize(options)
    @diameter = options[:diameter]
  end
end

class Engine
  attr_accessor :type

  def initialize(options)
    @type = options[:type]
  end
end

class Carcass
  attr_accessor :material

  def initialize(options)
    @material = options[:material]
  end
end

class Car
  attr_accessor :wheels, :engine, :carcass

  def initialize(options)
    @wheels = options[:wheels]
    @engine = options[:engine]
    @carcass = options[:carcass]
  end
end

class CarBuilder
  attr_reader :car

  def initialize(options)
    wheels = 4.times.map { generate(:wheel, options) }
    @car = Car.new(
      wheels: wheels,
      engine: generate(:engine, options),
      carcass: generate(:carcass, options)
    )
  end

  def wheels
    car.wheels
  end

  def engine
    car.engine
  end

  def carcass
    car.carcass
  end

  private

  def generate(component, options)
    Object.const_get(component.to_s.capitalize).new(options[component.to_sym])
  end
end

car_options = {
  wheel: { diameter: 10 },
  engine: { type: 'diesel' },
  carcass: { material: 'glass' },
}

builder = CarBuilder.new(car_options)
puts builder.wheels.map(&:diameter) #10 10 10 10
puts builder.engine.type #diesel
puts builder.carcass.material #glass
