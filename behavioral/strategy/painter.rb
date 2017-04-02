class Painter
  attr_accessor :tool

  def make
    return puts 'Painter cant make without tool' unless tool
    tool.use
  end
end
