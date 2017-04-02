class StopState < CabinaState
  attr_accessor :door_state

  def initialize(state = 0)
    @door_state = state
  end

  def door_status
    door_state.zero? ? :closed : :opened
  end

  def open_door
    return puts "Door's already opened" if door_state == 1
    self.door_state = 1
    puts "Door is #{door_status}"
  end

  def close_door
    return puts "Door's already closed" if door_state == 0
    self.door_state = 0
    puts "Door is #{door_status}"
  end

  def go_up(floor)
    puts super << ' becouse it stop'
  end

  def go_down(floor)
    puts super << ' becouse it stop'
  end

  private

  def move(floor)
    @current_floor = floor
  end
end
