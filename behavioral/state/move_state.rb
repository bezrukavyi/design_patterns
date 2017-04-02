class MoveState < CabinaState
  attr_accessor :current_floor

  def initialize(floor = 1)
    @current_floor = floor
  end

  def open_door
    puts super << ' becouse it moving'
  end

  def close_door
    puts super << " door's already closed"
  end

  def go_up(floor)
    puts "Moving up to #{floor}"
    move(floor)
  end

  def go_down(floor)
    puts "Moving down to #{floor}"
    move(floor)
  end

  private

  def move(floor)
    @current_floor = floor
  end
end
