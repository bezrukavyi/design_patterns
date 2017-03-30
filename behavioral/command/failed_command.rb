class FailedCommand < Command
  def execute
    1 == 2
  end

  def unexecute; end
end
