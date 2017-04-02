require_relative 'painter'
require_relative 'chalk'
require_relative 'brush'

brush = Brush.new
chalk = Chalk.new
painter = Painter.new

painter.make # => Painter cant make without tool
painter.tool = brush
painter.make # => Writing a picture by brush
painter.tool = chalk
painter.make # => Writing a picture by chalk
