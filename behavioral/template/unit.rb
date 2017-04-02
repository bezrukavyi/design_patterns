class Unit
  attr_reader :speed

  def initialize(options)
    @speed = options[:speed]
  end

  def hit_and_run
    move('forward')
    stop
    attack
    move('back')
  end

  def move(direction)
    puts "#{self.class} go #{direction} by speed #{speed}"
  end

  def stop
    raise 'Must be redefined'
  end

  def attack
    raise 'Must be redefined'
  end
end
