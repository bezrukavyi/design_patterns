class Cavalryman < Unit
  attr_reader :speed

  def stop
    puts "Don't stop"
  end

  def attack
    puts 'At full gallop crashe into enemy formation'
  end
end
