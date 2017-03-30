class CompositeCommand < Command
  attr_accessor :commands, :completed_commands

  def initialize
    @commands = []
    @completed_commands = []
  end

  def add_command(command)
    commands << command
  end

  def remove_command(command)
    commands.delete(command)
  end

  def execute
    commands.each do |command|
      if command.execute
        completed_commands << command
      else
        unexecute
      end
    end
  end

  def unexecute
    completed_commands.reverse_each do |command|
      command.unexecute
      completed_commands.delete(command)
    end
  end
end
