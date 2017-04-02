require_relative 'unit'
require_relative 'archer'
require_relative 'cavalryman'

archer = Archer.new(speed: 10)
cavalryman = Cavalryman.new(speed: 20)

archer.hit_and_run
cavalryman.hit_and_run
