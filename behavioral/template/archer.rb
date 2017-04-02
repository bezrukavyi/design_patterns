class Archer < Unit
  attr_reader :speed

  def stop
    puts 'Stop in 100 steps from the enemy'
  end

  def attack
    puts 'Fire the enemy from the bow'
  end
end
