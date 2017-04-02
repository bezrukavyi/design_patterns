class Cabina
  attr_accessor :state

  def initialize(state)
    @state = state
  end

  def change_state(state)
    self.state = state if state.valid?
  end

  def open_door
    state.open_door
  end

  def close_door
    state.close_door
  end

  def go_up(floor)
    state.go_up(floor)
  end

  def go_down(floor)
    state.go_down(floor)
  end
end
