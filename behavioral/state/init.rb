require_relative 'cabina_state'
require_relative 'move_state'
require_relative 'stop_state'
require_relative 'cabina'

stop_state = StopState.new
move_state = MoveState.new
cabina = Cabina.new(stop_state)

cabina.open_door # => Door is opened
cabina.close_door # => Door is closed
cabina.go_up(3) # => Cabina can't go up becouse it stop
cabina.go_down(1) # => Cabina can't go up becouse it stop
cabina.change_state(move_state)
cabina.open_door # => Cabina can't open door becouse it moving
cabina.open_door # => Cabina can't open door becouse it moving
cabina.go_down(1) # => Moving down to 1
cabina.go_up(3) # => Moving up to 3
